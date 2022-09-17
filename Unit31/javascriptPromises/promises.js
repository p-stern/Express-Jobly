// Part 1, #1
let part1_url_no_1 = 'http://numbersapi.com/random/year?json'
$('body').append($('<h1>Number Facts Using Promises</h1>'))

axios.get(part1_url_no_1)
    .then(res => {
        console.log(res.data)
    })
    .catch(err => console.log(err))

// Part 1, #2
let part1_url_no_2 = 'http://numbersapi.com/random/year?json'
$('body').append($('<h1>Number Facts Using Promises</h1>'))
axios.get(part1_url_no_2)
    .then(res => {
        display_num(res)
        return axios.get(part1_url_no_2)
    })
    .then(res => {
        display_num(res)
        return axios.get(part1_url_no_2)
    })
    .then(res => {
        display_num(res)
        return axios.get(part1_url_no_2)
    })
    .then(res => {
        display_num(res)
        return axios.get(part1_url_no_2)
    })
    .then(res => {
        display_num(res)
        return axios.get(part1_url_no_2)
    })
    .then(res => {
        display_num(res)
        return axios.get(part1_url_no_2)
    })
    .then(res => {
        display_num(res)
    })
    .catch(err => console.log(err))

function display_num(res) {
    console.log(res.data)
    $('#ul').append($(`<li>${res.data.text}</li>`))
}


// Part 1, #3
let fav_num = 56
let part1_url_no_3 = `http://numbersapi.com/${fav_num}`
$('body').append($('<h1>Number Facts Using Promises</h1>'))
axios.get(part1_url_no_3)
    .then(res => {
        console.log(res.data)
        $('#ul').append($(`<li>${res.data}</li>`))
        return axios.get(part1_url_no_3)
    })
    .then(res => {
        console.log(res.data)
        $('#ul').append($(`<li>${res.data}</li>`))
        return axios.get(part1_url_no_3)
    })
    .then(res => {
        console.log(res.data)
        $('#ul').append($(`<li>${res.data}</li>`))
        return axios.get(part1_url_no_3)
    })
    .then(res => {
        console.log(res.data)
        $('#ul').append($(`<li>${res.data}</li>`))
        return axios.get(part1_url_no_3)
    })
    .catch(err => console.log(err))

// Part 2, #1
let shuffle = 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
$('body').append($('<h1>Deck of Cards</h1>'))
axios.get(shuffle)
    .then(res => {
        let draw_card_url = `https://deckofcardsapi.com/api/deck/${res.data.deck_id}/draw/?count=1`
        return axios.get(draw_card_url)
    })
    .then(res => {
        console.log(`${res.data.cards[0].value} OF ${res.data.cards[0].suit}`)
    })
    .catch(err => console.log(err))

// Part 2, #2
let shuffle = 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
$('body').append($('<h1>Deck of Cards</h1>'))
axios.get(shuffle)
    .then(res => {
        get_cards(res)
    })
    .catch(err => console.log(err))

function get_cards(res) {
    let cards = []
    for (let i = 1; i < 3; i++) {
        cards.push(axios.get(`https://deckofcardsapi.com/api/deck/${res.data.deck_id}/draw/?count=1`));
    }

    Promise.all(cards)
        .then(cardsArr => (
            cardsArr.forEach(c => console.log(`${c.data.cards[0].value} OF ${c.data.cards[0].suit}`))
        ))
        .catch(err => console.log(err));
}


// Part 2, #3
let shuffle = 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
$('body').prepend($('<h1>Deck of Cards</h1>'))
axios.get(shuffle)
    .then(res => {
        $('#container').prepend($(`<button id="btn">Draw a Card</button>`).click(function () {
            get_card(res)
        }))
    })
    .catch(err => console.log(err))


function get_card(res) {
    let card = `https://deckofcardsapi.com/api/deck/${res.data.deck_id}/draw/?count=1`
    axios.get(card)
        .then(res => {
            img = res.data.cards[0].image
            $('#image').append(`<img src="${img}">`)
        })
        .catch(err => {
            $('#btn').remove()
            console.log("No more cards in deck")
        })
}