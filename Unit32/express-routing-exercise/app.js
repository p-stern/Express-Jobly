const express = require('express');
const ExpressError = require('./expressError');

const app = express();

app.use(express.json());


function calcMean(numsArray) {
    const sum = numsArray.reduce((total, n) => total + n, 0);
    return sum / numsArray.length;
}

function calcMedian(numsArray) {

    midpoint = numsArray.length / 2;
    if (numsArray.length % 2 == 0) {
        // median is average of middle 2 numbers in even length array
        return median = (numsArray[midpoint] + numsArray[midpoint - 1]) / 2;
    } else {
        // median is middle number in odd length array
        return median = (numsArray[Math.floor(midpoint)]);
    }
}

//https://vhudyma-blog.eu/mean-median-mode-and-range-in-javascript/
function calcMode(numsArray) {
    const mode = {};
    let max = 0, count = 0;

    for (let i = 0; i < numsArray.length; i++) {
        const item = numsArray[i];

        if (mode[item]) {
            mode[item]++;
        } else {
            mode[item] = 1;
        }

        if (count < mode[item]) {
            max = item;
            count = mode[item];
        }
    }

    return max;
}

function sortArray(numsArray) {
    numsArray.sort((a, b) => {
        if (a > b) return 1;
        if (a < b) return -1;
        return 0;
    });
    return numsArray;
}

function validateArray(numsArray) {
    for (i = 0; i < numsArray.length; i++) {
        // check if array value is false or NaN
        if (isNaN(numsArray[i])) {
            return numsArray[i] + " is not a number";
        }
    }
    return true
}

function inspectArray(req) {
    const { nums } = req.query;
    if (!nums) {
        throw new ExpressError("nums are required", 400);
    }

    numsArray = nums.split(',')

    let validate = validateArray(numsArray);
    if (validate !== true) {
        throw new ExpressError(validate, 400)
    }

    numsArray = numsArray.map(Number);
    return sortArray(numsArray);
}

app.get('/mean', (req, res, next) => {
    let numsArray = inspectArray(req);
    let mean = calcMean(numsArray);
    let response = {
        operation: "mean",
        value: `${mean}`
    }
    return res.json(response);
})

app.get('/median', (req, res, next) => {
    let numsArray = inspectArray(req);
    let median = calcMedian(numsArray);
    let response = {
        operation: "median",
        value: `${median}`
    }
    return res.json(response);
})


app.get('/mode', (req, res, next) => {
    let numsArray = inspectArray(req);
    let mode = calcMode(numsArray);

    let response = {
        operation: "mode",
        value: `${mode}`
    }
    return res.json(response);
})


app.use((req, res, next) => {
    const e = new ExpressError("Page not found", 404)
    next(e)
})

app.use((error, req, res, next) => {
    let status = error.status || 400;
    let message = error.msg;

    // set th status and alert the user
    res.status(status).json({
        error: { message, status }
    });
});

app.listen(3000, function (req, res) {
    console.log('App on port 3000');
})