// Cria Instancia Express 
var express = require("express")
var app = express()
var db = require("./database.js")

var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// Porta do Servidor
var HTTP_PORT = 8000 
// Inicia Servidor
app.listen(HTTP_PORT, () => {
    console.log("API EmpreendeUNA iniciada na porta %PORT%".replace("%PORT%",HTTP_PORT))
});
// Root endpoint
app.get("/", (req, res, next) => {
    res.json({"message":"API Iniciada"})
});

app.get("/api/usuario", (req, res, next) => {
    var sql = "SELECT * FROM usuario"
    var params = []
    db.all(sql, params, (err, rows) => {
        if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
        res.json({
            "message":"success",
            "data":rows
        })
      });
});

app.get("/api/usuario/:id", (req, res, next) => {
    var sql = "select * from usuario where id = ?"
    var params = [req.params.id]
    db.get(sql, params, (err, row) => {
        if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
        res.json({
            "message":"success",
            "data":row
        })
      });
});

app.post("/api/usuario/", (req, res, next) => {
    console.log(req.body);
    var errors=[];
    if (!req.body.nome){
        errors.push("Nome não definido");
    }
    if (!req.body.email){
        errors.push("Email não definido");
    }
    if (!req.body.senha){
        errors.push("Senha não definida");
    }
    if (errors.length){
        res.status(400).json({"error":errors.join(", ")});
        return;
    }
    var data = {
        nome: req.body.nome,
        email: req.body.email,
        senha : req.body.senha
    }
    
    var sql = 'INSERT INTO usuario (nome, email, senha) VALUES (?,?,?)'
    var params =[data.nome, data.email, data.senha]
    db.run(sql, params, function (err, result) {
        if (err){
            res.status(400).json({"error": err.message})
            return;
        }
        res.status(201).json({
            "message": "success",
            "data": data,
            "id" : this.lastID
        })
    });
})


app.post("/api/login/", (req, res, next) => {
    console.log(req.body);
    var errors=[];
    if (!req.body.email){
        errors.push("Email não definido");
    }
    if (!req.body.senha){
        errors.push("Senha não definida");
    }
    if (errors.length){
        res.status(400).json({"error":errors.join(", ")});
        return;
    }
    var sql = "select * from usuario where email = ? and senha=?"
    var params = [req.body.email, req.body.senha]
    db.get(sql, params, (err, row) => {
        if (err) {
          res.status(400).json({"error":err.message});
          return;
        }
        if (row === undefined) {
            res.status(400).json({"error":'Usuário ou senha inválidos'});
            return; 
        }
        res.json({
            "message":"success",
            "data":row
        })
      });
})

app.use(function(req, res){
    res.status(404);
});
