const mysql2 = require("mysql2");

// Configura credenciais:
const connection = mysql2.createConnection({
   host : 'localhost',
   user : 'root',
   password : 'root',
   database : 'db_academia'
});

// Realiza a conexão:
connection.connect((error) => {
    if(error){
        console.log("Erro ao fazer conexão com banco de dados!");
        return;
    } else{
        console.log("Banco de dados conectado com sucesso!");
    }
})

// Exporta conexão para o projeto inteiro:
module.exports = connection;