const express = require("express");
const server = express();
// --
const connection = require("./db");
// --
const bcrypt = require("bcryptjs");
const saltRounds = 10;

// Configuração do Express:
server.use(express.json());
const cors = require("cors");
server.use(cors());
const PORTA = 8050;
server.listen(PORTA, () => {
    console.log(`Servidor ligado na porta ${PORTA}`);
});

// Configuração do MiddleWare:
server.use((req, res, next) => {
   console.log(`${req.method} [${req.url}]`);
   return next();
});

// === Endereços para 'USUARIOS' ===
// Selecionar todos os usuários:
server.get("/usuarios", (req, res) => {
    sql = "SELECT * FROM USUARIO";
    connection.query(sql, (error, result) => {
       if(error){
           return res.status(500).json({ error : error.message });
       }
       return res.json(result);
    });
});
// Buscar por um usuário pelo ID:
server.get("/usuario/:id", (req, res) => {
   sql = "SELECT * FROM USUARIO WHERE ID = ?";
   const id = req.params.id;
   connection.query(sql, [id], (error, result) => {
       if(error){
           return res.status(500).json({ error : error.message });
       }
       return res.json(result);
   });
});
// Realizar login:
server.post("/usuario/login", async (req, res) => {
    const sql = "SELECT * FROM USUARIO WHERE username = ?";
    const username = req.body.username;
    const password = req.body.senha;
    connection.query(sql, [username], async (error, result) => {
        if(error){
            return res.status(500).json({ error : error.message });
        }
        if(result.length == 0){
            return res.status(500).json({ error: "Usuário ou senha incorretos." })
        }
        const passwordVerify = await bcrypt.compare(password, result[0].senha_criptografada);
        if(!passwordVerify){
            return res.status(500).json({ error: "Usuário ou senha incorretos." })
        }
        return res.json(result[0]);
    });
});
// Criar usuário:
server.post("/usuario", async (req, res) => {
   const { username, senha } = req.body;
   const senhaCriptografada = await bcrypt.hash(senha, saltRounds);
   const sql = "INSERT INTO USUARIO(username, senha_criptografada) VALUES(?, ?)";
   connection.query(sql, [username, senhaCriptografada], (error, result) => {
      if(error) {
          return res.status(500).json({error: error.message});
      }
      return res.json(result);
   });
});