$('#submit').on('click', function () {
    if ($('#movie').val().length < 2) {
        alert("Enter a Movie greater than 2 characters")
    }
    else if ($('#rating').val() < 0 || $('#rating').val() > 10 || $('#rating').val() === "") {
        alert("Enter a Rating between 0 & 10")
    }
    else {
        addMovie();
        $('#movie').val('');
        $('#rating').val('');
    }
});

function addMovie() {
    $('ul')
        .append(`<li> ${$('#movie').val()} ${$('#rating').val()}/10 <button class= "remove btn-sm m-25 p-0"> X`)
        .on('click', ".remove", function () {
            // remove li from ul
            $(this).parent().remove();
        });
}