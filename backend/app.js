const express = require("express");
const server = express();

// Configuração do Express:
server.use(express.json());
const cors = require("cors");
server.use(cors());
const PORTA = 8050;
server.listen(PORTA, () => {
    console.log(`Servidor ligado na porta ${PORTA}`);
});