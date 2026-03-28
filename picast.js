var sys = require('sys');
var exec = require('child_process').exec;
var express = require('express');
var app = express();

app.get('/', function (req, res) {
        res.send('Welcome to PiCAST 3! In the URL, type what you want to do...');
});

app.get('/yt-stream/:url', function (req, res) {
        // Sanitize URL parameter to prevent command injection
        var videoId = req.params.url.replace(/[^a-zA-Z0-9_-]/g, '');
        if (!videoId) {
                res.status(400).send('Invalid video ID');
                return;
        }
        res.send('Streaming YouTube Video...');
        exec("livestreamer --player=mplayer https://www.youtube.com/watch?v=" + videoId + " best");
});

// Setup PiCAST Server
var srv = app.listen(3000, function () {
        var host = srv.address().address;
        var port = srv.address().port;

        console.log('Access at http://%s:%s', host, port);
});
