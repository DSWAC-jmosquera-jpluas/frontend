
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
    //get the ip of the client
    var ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
    //get the device of the client
    var device = req.headers['user-agent'];
    //get the date of the request
    var typeOfRequest = req.method;
    var date = new Date();

    //send to server with post
    var request = require('request');
    request.post(
        'https://webapicitamedicaunl.azurewebsites.net/Audit',
        { json: { auditId:0, ip: ip, dispositivo: device, tipo: typeOfRequest, fechaHora: date } },
        function (error, response, body) {
            if (!error && response.statusCode == 200) {
                console.log(body)
            }
        }
    );
    
});





app.listen(port, () => console.log(`Example app listening on port ${port}!`))

module.exports = app;

