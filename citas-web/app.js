
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var router = express();
const expressip = require('express-ip');
router.use(expressip().getIpInfoMiddleware);
router.set('trust proxy', true)
const port = 3000

router.use(logger('dev'));
router.use(express.json());
router.use(express.urlencoded({ extended: false }));
router.use(cookieParser());


router.get('/', (req, res) => {

        var date =  new Date();
        var ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress ;
        var browser =req.headers['user-agent'];
        var method = req.method;

        //json
        var json = {
            "ip": ip,
            "fechaHora": date,
            "dispositivo": browser,
            "tipo": method
        }

        ///request post to api
        var request = require('request');
        var options = {
            'method': 'POST',
            'url': 'http://20.63.79.173:5000/Audit',
            'headers': {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(json)

        };
        request(options, function (error, response) {
            if (error) throw new Error(error);
            console.log(response.body);
        });


        //ip
        var ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress;
        //os
        var os = require('os');
        var osName = os.platform();
        var osVersion = os.release();
        //language
        var language = req.headers["accept-language"];
        



        res.sendFile(path.join(__dirname + '/public-flutter/index.html'));
});

router.listen(port, () => console.log(`Example router listening on port ${port}!`))

module.exports = router;

