const express = require('express');
const app = express();
const itemsRoutes = require('./routes/items');
const ExpressError = require('./expressError');

app.use(express.json());
app.use('/items', itemsRoutes);

// 404 handler
app.use(function (req, res, next) {
    return new ExpressError("Not Found", 404);
});

//generic error handler
app.use((err, req, res, next) => {
    //the default status is 500 Internal Server Error
    let status = err.status || 500;

    // set the status and alert the user
    res.status(status).json({
        error: {
            message: err.message,
            status: status
        }
    });
});

module.exports = app;