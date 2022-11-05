
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var app = express();

const port = 3000

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public-flutter')));

app.get('/', function(req, res) {
    res.sendFile(path.join(__dirname + '/public-flutter/index.html'));
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`))

module.exports = app;

