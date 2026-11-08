document.getElementById("login-button").addEventListener("click", async () => {
    const feedback = document.getElementById("feedback");
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const body = {
       username: username,
       senha : password
    };

    const API = await fetch("http://localhost:8050/usuario/login", {
        method : "POST",
        headers : {
            "Content-Type" : "application/json"
        },
        body : JSON.stringify(body)
    });
    const result = await API.json();
    if(result.error){
        feedback.innerHTML = `Erro: ${result.error}`;
    } else {
        feedback.innerHTML = `Login realizado com sucesso! Bem vindo ${result.username}!`;
    }
});