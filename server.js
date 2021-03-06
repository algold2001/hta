var express = require("express");
var bodyParser = require('body-parser');
var app = express();

const mysql = require('mysql');

console.log('iniciou');
//Config
app.use(bodyParser.json());
app.use(function (req, res, next) {
    ;
    res.header('Access-Control-Allow-Origin', '*');
    res.header("Access-Control-Allow-Credentials", "true");
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, X-Codingpedia, Authorization');
    next();
});

function execSQLQuery(sqlQry, res) {
    const connection = mysql.createConnection({
        host: "db4free.net",
        user: "cdahts1",
        port: "3306",
        password: "br4s1l2018",
        database: "cdahts1"
    });

    connection.query(sqlQry, function (error, results, fields) {
        if (error)
            res.json(error);
        else
            res.json(results);
        connection.end();
        console.log('executou!');
    });
}

app.get('/usuarios', (req, res) => {
    execSQLQuery('select CodUsu, Nome from Usuario', res);
});

app.get('/usuario/:id', (req, res) => {
    let filter = '';
    if (req.params.id)
        filter = ' where CodUsu=' + parseInt(req.params.id);
    execSQLQuery('select CodUsu, Nome from Usuario ' + filter, res);
});

app.get('/logar/:id/:senha', (req, res) => {
    let filter = '';
    if ((req.params.id) && (req.params.senha))
        filter = ' where CodUsu=' + parseInt(req.params.id) + ' and Senha="' + req.params.senha+'"';
    execSQLQuery('select CodUsu, Nome from Usuario ' + filter, res);
});


var server = app.listen(process.env.PORT || 3000, function(){
  console.log("Express server listening on port %d in %s mode", this.address().port, app.settings.env);
});

