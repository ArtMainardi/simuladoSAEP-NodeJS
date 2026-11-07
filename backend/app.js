const express = require("express");
const server = express();
const connection = require("./db");

// Configuração do Express:
server.use(express.json());
const cors = require("cors");
server.use(cors());
const PORTA = 8050;
server.listen(PORTA, () => {
    console.log(`Servidor ligado na porta ${PORTA}`);
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