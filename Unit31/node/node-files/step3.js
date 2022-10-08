function cat(path) {
    fs.readFile(path, 'utf8', (err, data) => {
        if (err) {
            console.log(`Error reading ${path}:`);
            console.log(err);
            process.exit(1);
        }
        else { console.log(data); }
    })

}

function catWrite(outFile, path) {
    let data = read(path);
    write(outFile, data);
}

function webCat(path) {
    axios.get(path)
        .then(res => { console.log(res.data); })
        .catch((err) => {
            console.log(`Error fetching ${path}:`);
            console.log('  Error: Request failed with status code 404');
        })
}

function webCatWrite(outFile, path) {
    let data = axios.get(path)
        .then(res => {
            write(outFile, res.data);
        })
        .catch((err) => {
            console.log(`Error fetching ${path}:`);
            console.log('  Error: Request failed with status code 404');
        })
}

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

function write(outFile, data) {
    fs.writeFile(outFile, data, (err) => {
        if (err) {
            console.log(`Couldn't write ${outFile}`);
            console.log(`  Error: ENOENT: no such file or directory, open ${outFile}`);
        }
    });
}

const fs = require('fs');
const axios = require('axios');
const argv = process.argv;

if (argv[2] == "--out") {
    if (argv.length == 5) {
        if (argv[4].includes("://")) {
            webCatWrite(argv[3], argv[4]);
        }
        else {
            catWrite(argv[3], argv[4]);
        }
    }
}
else {
    if (argv[2].includes("://")) {
        webCat(argv[2]);
    }
    else {
        cat(argv[2]);
    }
};