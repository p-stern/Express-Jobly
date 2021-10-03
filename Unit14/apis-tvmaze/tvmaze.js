/** Given a query string, return array of matching shows:
 *     { id, name, summary, episodesUrl }
 */


/** Search Shows
 *    - given a search term, search for tv shows that
 *      match that query.  The function is async show it
 *       will be returning a promise.
 *
 *   - Returns an array of objects. Each object should include
 *     following show information:
 *    {
        id: <show id>,
        name: <show name>,
        summary: <show summary>,
        image: <an image from the show data, or a default imege if no image exists, (image isn't needed until later)>
      }
 */
async function searchShows(query) {
  let res = await axios.get("http://api.tvmaze.com/search/shows",
    {
      params: { q: query }
    });
  const array = [];

  for (let i = 0; i < res.data.length; i++) {
    const object = {};
    object["id"] = res.data[i].show.id;
    object["name"] = res.data[i].show.name;
    object["summary"] = res.data[i].show.summary;
    // If there is no image, pass generic image
    res.data[i].show.image ? object["image"] = res.data[i].show.image.original :
      object["image"] = "https://tinyurl.com/tv-missing";

    array.push(object);
  }
  return array;
}

function populateShows(shows) {
  const $showsList = $("#shows-list");
  $showsList.empty();

  for (let show of shows) {
    let $item = $(
      `<div class="col-md-6 col-lg-3 Show" data-show-id="${show.id}">
         <div class="card" data-show-id="${show.id}">
           <div class="card-body">
             <h5 class="card-title">${show.name}</h5>
             <img style="height:30%; width:30%" class="card-img-top" src="${show.image}">
             <p class="card-text">${show.summary}</p>
             <button class="btn btn-primary" type="submit" id="${show.id}episodeBtn" data-bs-toggle="modal" data-bs-target="#episodesModal">Episodes</button>
           </div>
         </div>
       </div>
      `);

    $showsList.append($item);

    $(`#${show.id}episodeBtn`).click(async function () {
      let episodeArray = await getEpisodes(`${show.id}`);
      populateEpisodes(episodeArray);
    });
  }
}

/** Handle search form submission:
 *    - hide episodes area
 *    - get list of matching shows and show in shows list
 */

$("#search-form").on("submit", async function handleSearch(evt) {
  evt.preventDefault();

  let query = $("#search-query").val();
  if (!query) return;

  // $("#episodes-area").hide();

  let shows = await searchShows(query);

  populateShows(shows);
});


/** Given a show ID, return list of episodes:
 *      { id, name, season, number }
 */

async function getEpisodes(id) {
  let episodes = await axios.get(`http://api.tvmaze.com/shows/${id}/episodes`);

  const episodeArray = [];

  for (let i = 0; i < episodes.data.length; i++) {
    const episodeObj = {};
    episodeObj["id"] = episodes.data[i].id;
    episodeObj["name"] = episodes.data[i].name;
    episodeObj["season"] = episodes.data[i].season;
    episodeObj["number"] = episodes.data[i].number;

    episodeArray.push(episodeObj);
  }
  return episodeArray;
}

function populateEpisodes(episodeArray) {
  $('li').remove();
  for (let episode of episodeArray) {
    $('ul').append($(`<li>${episode.name} (season ${episode.season}, number ${episode.number})</li>`));
  }
}