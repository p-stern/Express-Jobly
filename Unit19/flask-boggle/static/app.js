async function searchForWord(word) {

    let res = await axios.get("/check-word",
        {
            params: { word: word }
        });
    return res.data;
}

$("#form-guess").on("submit", async function handleSearch(evt) {
    evt.preventDefault();

    let word = $("#guess").val();
    if (!word) return;

    let result = await searchForWord(word);

    if (result.result == "ok") {
        msg = "is a valid word on the board";
    }
    else if (result.result == "not-on-board") {
        msg = "is a valid word but not on the board";
    }
    else {
        msg = "is not a valid word";
    }

    $("#score").text(`SCORE: ${result.score}`);
    $("#msg").text(`${word.toUpperCase()} ${msg}`);
    $("#guess").val("");
});

// based on code from http://jsfiddle.net/ayyadurai/GXzhZ/1/
window.onload = function () {
    let sec = 19
    let clearId =
        setInterval(function () {
            document.getElementById("timer").innerHTML = "Timer: " + sec;
            sec--;
            if (sec < 00) {
                clearInterval(clearId);
                $("#timer").html("Time's up!");
                $("#msg").remove();
                $("#form-guess").remove();
                sendScore();
            }
        }, 1000);
}

async function sendScore() {
    let score = $("#score").text().substr(7);

    let res = await axios.post("/post-score", { "score": score });
    $("#highscore").text(`HIGHSCORE: ${res.data[0]}`);
    $("#gamesPlayed").text(`GAMES PLAYED: ${res.data[1]}`);
    console.log(res);
    return res.data;
}