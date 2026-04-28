
document.addEventListener("DOMContentLoaded", function () {
    const perfil = localStorage.getItem("perfil");
    const usuario = localStorage.getItem("usuario");

    document.getElementById('user').innerHTML = usuario;

    if (!perfil) {
        window.location.href = "../index.html";
        return;
    }
    const cards = document.querySelectorAll(".module-card");

    cards.forEach(card => {
        const permitido = card.getAttribute("data-perfil");

        if (permitido && !permitido.includes(perfil)) {
            card.remove();
        }
    });
});