/** Command-line tool to generate Markov text. */

function read(path) {
    try {
        return fs.readFileSync(path);
    }
    catch {
        console.log(`Error reading ${path}:`);
        console.log(`  Error: ENOENT: no such file or directory, open '${path}'`);
        process.exit(1);
    }
}

async function readUrl(path) {
    try {
        res = await axios.get(path);
        let mm = new markov.MarkovMachine(res.data);
        mm.makeText();
    }
    catch {
        console.log(`Error fetching ${path}:`);
        console.log('  Error: Request failed with status code 404');
        process.exit(1);
    }
}

const fs = require('fs');
const axios = require('axios');
const markov = require('./markov');
let text;
const argv = process.argv;


if (argv[2] == "file") {
    let text = read(argv[3]).toString();
    console.log(text);
    let mm = new markov.MarkovMachine(text);
    console.log(mm);
    mm.makeText();
}
else {
    if (argv[2] == "url") {
        readUrl(argv[3]);
    }
    else {
        console.log("Error!");
    }
}