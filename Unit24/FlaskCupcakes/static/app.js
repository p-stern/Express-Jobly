async function getCupcakes() {
    let cupcake = await axios.get("http://127.0.0.1:5000//api/cupcakes");

    for (let i = 0; i < cupcake.data.cupcakes.length; i++) {
        $('ul').append($(`<li>Flavor: ${cupcake.data.cupcakes[i].flavor} <br>
         Size: ${cupcake.data.cupcakes[i].size} <br>
          Rating: ${cupcake.data.cupcakes[i].rating} </li>
          <img class="cupcakeImg" src="${cupcake.data.cupcakes[i].image}"><br><br>`));
    };

    return
};

$(getCupcakes);

$("#input-form").on("submit", async function handleAdd(evt) {
    evt.preventDefault();

    let flavor = $("#flavor").val();
    let size = $("#size").val();
    let rating = $("#rating").val();
    let image = $("#image").val();
    if (image === "") {
        image = null;
    }

    let newCupcake = {
        flavor: flavor,
        size: size,
        rating: rating,
        image: image
    };

    let cupcake = await axios.post("http://127.0.0.1:5000//api/cupcakes", newCupcake);

    // let image_url = `<img src = ${cupcake.data.cupcake.image}</img>`
    $('ul').append($(`<li>Flavor: ${flavor} <br> Size: ${size} <br> Rating: ${rating}</li>
    <img class="cupcakeImg" src="${cupcake.data.cupcake.image}"><br><br>`));


    $("#flavor").val("");
    $("#size").val("");
    $("#rating").val("");
    $("#image").val("");
    return
});