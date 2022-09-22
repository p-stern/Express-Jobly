// Part 1, #1
async function getFact() {
    let part1_url_no_1 = await axios.get('http://numbersapi.com/random/year?json')
    return part1_url_no_1
}

let res = getFact()
console.log(res);
$('body').append($('<h1>Number Facts Using Async/Await</h1>'))


// Part 1, #2
async function getNumber() {
    let part1_url_no_2 = 'http://numbersapi.com/random/year?json';
    let { data: n1 } = await axios.get(part1_url_no_2);
    display_num(n1.text)
    let { data: n2 } = await axios.get(part1_url_no_2);
    display_num(n2.text)
    let { data: n3 } = await axios.get(part1_url_no_2);
    display_num(n3.text)
    let { data: n4 } = await axios.get(part1_url_no_2);
    display_num(n4.text)
    let { data: n5 } = await axios.get(part1_url_no_2);
    display_num(n5.text)
    let { data: n6 } = await axios.get(part1_url_no_2);
    display_num(n6.text)
    return
}

$('body').prepend($('<h1>Number Facts Using Async/Await</h1>'))
let res = getNumber()

function display_num(text) {
    $('#ul').append($(`<li>${text}</li>`))
}


// Part 1, #3
let fav_num = 56

async function getFavNumFacts(fav_num) {
    let part1_url_no_3 = `http://numbersapi.com/${fav_num}`

    let { data: n1 } = await axios.get(part1_url_no_3);
    $('#ul').append($(`<li>${n1}</li>`))
    let { data: n2 } = await axios.get(part1_url_no_3);
    $('#ul').append($(`<li>${n2}</li>`))
    let { data: n3 } = await axios.get(part1_url_no_3);
    $('#ul').append($(`<li>${n3}</li>`))
    let { data: n4 } = await axios.get(part1_url_no_3);
    $('#ul').append($(`<li>${n4}</li>`))
    let { data: n5 } = await axios.get(part1_url_no_3);
    $('#ul').append($(`<li>${n5}</li>`))
}

$('body').prepend($('<h1>Number Facts Using Async/Await</h1>'))
let res = getFavNumFacts(fav_num)


// // Part 2, #1
async function getCard() {
    let shuffle = 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1';
    let deck = await axios.get(shuffle);

    let card = `https://deckofcardsapi.com/api/deck/${deck.data.deck_id}/draw/?count=1`
    let res = await axios.get(card)

    console.log(`${res.data.cards[0].value} OF ${res.data.cards[0].suit}`)
}

$('body').append($('<h1>Deck of Cards</h1>'));
getCard();

// Part 2, #2
async function getCards() {
    let shuffle = 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
    let deck = await axios.get(shuffle)

    let cards = []
    for (let i = 1; i < 3; i++) {
        cards.push(await axios.get(`https://deckofcardsapi.com/api/deck/${deck.data.deck_id}/draw/?count=1`));
    }

    Promise.all(cards)
        .then(cardsArr => (
            cardsArr.forEach(c => console.log(`${c.data.cards[0].value} OF ${c.data.cards[0].suit}`))
        ))
        .catch(err => console.log(err));
}

$('body').append($('<h1>Deck of Cards</h1>'))
getCards();


// Part 2, #3
async function displayCards() {
    let shuffle = 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'

    let deck = await axios.get(shuffle)
    $('#container').prepend($(`<button id="btn">Draw a Card</button>`).click(function () {
        get_card(deck)
    }))
}

async function get_card(res) {
    let card = `https://deckofcardsapi.com/api/deck/${res.data.deck_id}/draw/?count=1`
    try {
        let c = await axios.get(card)
        img = c.data.cards[0].image
        $('#image').append(`<img src="${img}">`)
    }
    catch {
        $('#btn').remove()
        console.log("No more cards in deck")
    }

}

$('body').prepend($('<h1>Deck of Cards</h1>'));
displayCards();