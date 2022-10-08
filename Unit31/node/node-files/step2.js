function cat(path) {
    const fs = require('fs');
    fs.readFile(path, 'utf8', (err, data) => {
        if (err) {
            console.log(`Error reading ${path}:`);
            console.log(err);
            process.exit(1);
        }

        console.log(data);
    })
}

function webCat(path) {
    const axios = require('axios');
    axios.get(path)
        .then(res => { console.log(res.data); })
        .catch((err) => {
            console.log(`Error fetching ${path}:`);
            console.log('  Error: Request failed with status code 404');
        })
}

const argv = process.argv;

if (argv[2].includes("://")) {
    webCat(argv[2]);
}
else {
    cat(argv[2]);
};