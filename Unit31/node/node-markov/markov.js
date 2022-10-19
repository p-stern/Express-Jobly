/** Textual markov chain generator */


class MarkovMachine {

  /** build markov machine; read in text.*/

  constructor(text) {
    let words = text.split(/[ \r\n]+/);
    this.words = words.filter(c => c !== "");
    this.makeChains();
  }

  /** set markov chains:
   *
   *  for text of "the cat in the hat", chains will be
   *  {"the": ["cat", "hat"], "cat": ["in"], "in": ["the"], "hat": [null]} */

  makeChains() {
    // TODO - done
    let wordMap = new Map();
    for (let i = 0; i < this.words.length; i++) {
      let word = this.words[i];
      let nextword;
      i == this.words.length - 1 ? nextword = "null" : nextword = this.words[i + 1];
      wordMap.get(word) ? wordMap.get(word).push(nextword) : wordMap.set(word, [nextword])
      this.wordMap = wordMap;
    }
    return wordMap;
  }

  /** return random text from chains */

  makeText(numWords = 100) {
    // TODO - done
    const wordArr = Array.from(this.wordMap);
    let row = wordArr[Math.floor(Math.random() * wordArr.length)];
    let word = row[0];
    text.push(word);
    let i = 1;

    while (i < numWords && word != "null") {

      let nextWord = this.getNextWord(row[1]);

      if (nextWord == "null") {
        word = nextWord;
      }
      else {
        row = this.getRow(wordArr, nextWord);
        word = row[0];
      }
      i++;
    }

    console.log("text === ", text);
  }

  getWord(row) {
    console.log("word = ", row[0]);
    return text.push(row[0]);
  }

  getNextWord(nextArr) {
    let nextWord = nextArr[Math.floor(Math.random() * nextArr.length)];
    text.push(nextWord);
    return nextWord
  }

  getRow(wordArr, nextWord) {
    for (let i = 0; i < wordArr.length; i++) {
      if (wordArr[i][0] == nextWord) {
        return wordArr[i];
      }
    }
  }
}

const text = [];
// let mm = new MarkovMachine("the cat in the hat");
// console.log(mm);
// mm.makeText(20);

module.exports = { MarkovMachine }