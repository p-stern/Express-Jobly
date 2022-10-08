function cat(path) {
    const fs = require("fs")
    fs.readFile(path, 'utf8', (err, data) => {
        if (err) {
            console.log(`Error reading ${path}:`);
            console.log(err);
            process.exit(1);
        }

        console.log(data)
    })
}

const argv = process.argv;

cat(argv[2]);