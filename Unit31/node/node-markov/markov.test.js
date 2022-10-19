const { MarkovMachine } = require('./markov');

describe('MarkovMachine matchers', function () {
    let words;
    let wordMap;

    beforeEach(function () {
        words = [
            'the', 'cat', 'in',
            'the', 'hat', 'is',
            'in', 'the', 'hat'
        ]

        wordMap = new MarkovMachine("the cat in the hat is in the hat");
    })

    test('playing with numeric matcher', function () {
        const wordMapLength = wordMap.makeChains().size;
        const wordsLength = words.length

        expect(wordsLength).toBeGreaterThanOrEqual(wordMapLength);
        expect(wordMapLength).toBeGreaterThanOrEqual(0);
    })

    test('playing with toContain matcher', function () {
        expect(wordMap.words[0].toBeTruthy)
        expect(wordMap.words[3].toBeTruthy)
    })
})