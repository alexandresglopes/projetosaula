async function buscaCEP() {
    const cep = document.getElementById('cep').value.replace(/\D/g, "");

    if (cep.length !== 8) {
        alert("CEP inválido! O CEP deve conter 8 dígitos.");
        return;
    }

    console.log(cep)

    try {
        const url = `https://viacep.com.br/ws/${cep}/json/`;
        const resposta = await fetch(url);
        const dados = await resposta.json();

        if (dados.erro) {
            alert("CEP não encontrado.");
            limparCamposEndereco();
            return;
        }


        document.getElementById('logradouro').value = dados.logradouro;
        document.getElementById('bairro').value = dados.bairro;
        document.getElementById('cidade').value = dados.localidade;
        document.getElementById('uf').value = dados.uf;


        document.getElementById('numero').focus();

    } catch (error) {
        console.error("Erro ao buscar o CEP:", error);
        alert("Erro ao consultar o serviço de CEP. Tente novamente mais tarde.");
    }
}

function limparCamposEndereco() {
    document.getElementById('logradouro').value = "";
    document.getElementById('bairro').value = "";
    document.getElementById('cidade').value = "";
    document.getElementById('uf').value = "";
}