console.log("Let's get this party started!");
$('#searchBtn').on("click", getRequest);
$('#removeBtn').on("click", removeImages);

async function getRequest() {
    let $srchString = $('#srch').get(0).value;

    let res = await axios.get
        // How I did it initially
        // (`http://api.giphy.com/v1/gifs/search?q=${$srchString}&api_key=oJLvrrsu3hx9KcjxdZgSRA6CH1R2PbRd`);

        // Better way to do it
        ("http://api.giphy.com/v1/gifs/search", {
            params: {
                q: $srchString,
                api_key: "oJLvrrsu3hx9KcjxdZgSRA6CH1R2PbRd"
            }
        });

    let randomNum = Math.floor(Math.random() * res.data.data.length);
    let gif = res.data.data[`${randomNum}`].images.fixed_height_small.url;
    $('#container').append($('<img>', { src: `${gif}` }).css("padding", "3px"));
    $('#srch').get(0).value = "";
}

function removeImages() {
    $('img').remove();
}