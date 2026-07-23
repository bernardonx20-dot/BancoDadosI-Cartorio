document.addEventListener('DOMContentLoaded', () => {
    carregarFuncionarios();
    carregarLivros();
    carregarAcessos();
    carregarIndicadorReal();
    carregarMatriculas();
    carregarIndicadorPessoal();
});

// --- FUNCIONÁRIOS ---
async function carregarFuncionarios() {
    try {
        const res = await fetch('/api/funcionarios');
        const data = await res.json();
        
        const tbody = document.querySelector('#tabelaFuncionarios tbody');
        tbody.innerHTML = '';
        
        data.forEach(func => {
            tbody.innerHTML += `
                <tr>
                    <td>${func.Id_Funcionario}</td>
                    <td>${func.Nome}</td>
                </tr>
            `;
        });
    } catch (error) {
        console.error('Erro ao carregar funcionários:', error);
    }
}

async function adicionarFuncionario() {
    const nome = document.getElementById('nomeFuncionario').value;
    if (!nome) return alert('Digite o nome do funcionário');

    try {
        const res = await fetch('/api/funcionarios', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ nome })
        });
        
        if(res.ok) {
            document.getElementById('nomeFuncionario').value = '';
            carregarFuncionarios();
        } else {
            alert('Erro ao adicionar funcionário');
        }
    } catch (error) {
        console.error(error);
    }
}

// --- LIVROS ---
async function carregarLivros() {
    try {
        const res = await fetch('/api/livros');
        const data = await res.json();
        
        const tbody = document.querySelector('#tabelaLivros tbody');
        tbody.innerHTML = '';
        
        data.forEach(livro => {
            const dataAbertura = new Date(livro.Data_Abertura).toLocaleString('pt-BR');
            tbody.innerHTML += `
                <tr>
                    <td>${livro.Id_Livro}</td>
                    <td>${livro.Tipo_Livro}</td>
                    <td>${dataAbertura}</td>
                    <td>${livro.Faixa_matricula}</td>
                </tr>
            `;
        });
    } catch (error) {
        console.error('Erro ao carregar livros:', error);
    }
}

async function adicionarLivro() {
    const tipo_livro = document.getElementById('tipoLivro').value;
    const faixa_matricula = document.getElementById('faixaMatricula').value;
    
    if (!tipo_livro || !faixa_matricula) return alert('Preencha todos os campos do livro');

    try {
        const res = await fetch('/api/livros', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ tipo_livro, faixa_matricula })
        });
        
        if(res.ok) {
            document.getElementById('tipoLivro').value = '';
            document.getElementById('faixaMatricula').value = '';
            carregarLivros();
        } else {
            alert('Erro ao adicionar livro');
        }
    } catch (error) {
        console.error(error);
    }
}

// --- ACESSO_FUNCIONARIO ---
async function carregarAcessos() {
    try {
        const res = await fetch('/api/acesso_funcionario');
        const data = await res.json();
        const tbody = document.querySelector('#tabelaAcesso tbody');
        tbody.innerHTML = '';
        data.forEach(item => {
            tbody.innerHTML += `<tr><td>${item.Id_Funcionario}</td><td>${item.Id_Livro}</td></tr>`;
        });
    } catch (error) { console.error(error); }
}

async function adicionarAcesso() {
    const id_funcionario = document.getElementById('acessoIdFuncionario').value;
    const id_livro = document.getElementById('acessoIdLivro').value;
    if (!id_funcionario || !id_livro) return alert('Preencha os campos!');
    await fetch('/api/acesso_funcionario', { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({id_funcionario, id_livro})});
    carregarAcessos();
}

// --- INDICADOR REAL ---
async function carregarIndicadorReal() {
    try {
        const res = await fetch('/api/indicador_real');
        const data = await res.json();
        const tbody = document.querySelector('#tabelaIndicadorReal tbody');
        tbody.innerHTML = '';
        data.forEach(item => {
            tbody.innerHTML += `<tr><td>${item.Id_Indicador_Real}</td><td>${item.Endereco}</td><td>${item.Area}</td><td>${item.TIPO_Imovel}</td><td>${item.Qualidade || ''}</td></tr>`;
        });
    } catch (error) { console.error(error); }
}

async function adicionarIndicadorReal() {
    const payload = {
        endereco: document.getElementById('irEndereco').value,
        area: document.getElementById('irArea').value,
        tipo_imovel: document.getElementById('irTipo').value,
        qualidade: document.getElementById('irQualidade').value
    };
    if (!payload.endereco || !payload.area || !payload.tipo_imovel) return alert('Preencha os campos obrigatórios!');
    await fetch('/api/indicador_real', { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(payload)});
    carregarIndicadorReal();
}

// --- MATRICULA ---
async function carregarMatriculas() {
    try {
        const res = await fetch('/api/matricula');
        const data = await res.json();
        const tbody = document.querySelector('#tabelaMatriculas tbody');
        tbody.innerHTML = '';
        data.forEach(item => {
            const encerramento = item.Data_Encerramento ? new Date(item.Data_Encerramento).toLocaleString('pt-BR') : '-';
            tbody.innerHTML += `<tr><td>${item.Id_Matricula}</td><td>${new Date(item.Data_abertura).toLocaleString('pt-BR')}</td><td>${encerramento}</td><td>${item.Numero_Matricula}</td><td>${item.Id_Livro}</td><td>${item.Id_Indicador_Real}</td></tr>`;
        });
    } catch (error) { console.error(error); }
}

async function adicionarMatricula() {
    const payload = {
        numero_matricula: document.getElementById('matNumero').value,
        id_livro: document.getElementById('matIdLivro').value,
        id_indicador_real: document.getElementById('matIdIr').value
    };
    if (!payload.numero_matricula || !payload.id_livro || !payload.id_indicador_real) return alert('Preencha os campos obrigatórios!');
    await fetch('/api/matricula', { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(payload)});
    carregarMatriculas();
}

// --- INDICADOR PESSOAL ---
async function carregarIndicadorPessoal() {
    try {
        const res = await fetch('/api/indicador_pessoal');
        const data = await res.json();
        const tbody = document.querySelector('#tabelaIndicadorPessoal tbody');
        tbody.innerHTML = '';
        data.forEach(item => {
            tbody.innerHTML += `<tr><td>${item.Id_Indicador_Pessoal}</td><td>${item.Nome_Participante}</td><td>${item.Percentual_Participacao || ''}</td><td>${item.Tipo_de_Ato || ''}</td><td>${item.Qualidade || ''}</td><td>${item.Documento || ''}</td><td>${item.Numero_do_Ato || ''}</td><td>${item.Id_Matricula}</td></tr>`;
        });
    } catch (error) { console.error(error); }
}

async function adicionarIndicadorPessoal() {
    const payload = {
        nome_participante: document.getElementById('ipNome').value,
        percentual_participacao: document.getElementById('ipPercentual').value,
        tipo_de_ato: document.getElementById('ipTipoAto').value,
        qualidade: document.getElementById('ipQualidade').value,
        documento: document.getElementById('ipDocumento').value,
        numero_do_ato: document.getElementById('ipNumeroAto').value,
        id_matricula: document.getElementById('ipIdMatricula').value
    };
    if (!payload.nome_participante || !payload.id_matricula) return alert('Preencha os campos obrigatórios!');
    await fetch('/api/indicador_pessoal', { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(payload)});
    carregarIndicadorPessoal();
}
