package com.cartorio.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class CartorioController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // --- FUNCIONÁRIOS ---
    @GetMapping("/funcionarios")
    public List<Map<String, Object>> getFuncionarios() {
        String sql = "SELECT * FROM Funcionario";
        return jdbcTemplate.queryForList(sql);
    }

    @PostMapping("/funcionarios")
    public String addFuncionario(@RequestBody Map<String, String> payload) {
        String nome = payload.get("nome");
        String sql = "INSERT INTO Funcionario (Nome) VALUES (?)";
        jdbcTemplate.update(sql, nome);
        return "Funcionário adicionado com sucesso!";
    }

    // --- LIVROS ---
    @GetMapping("/livros")
    public List<Map<String, Object>> getLivros() {
        String sql = "SELECT * FROM Livro";
        return jdbcTemplate.queryForList(sql);
    }

    @PostMapping("/livros")
    public String addLivro(@RequestBody Map<String, String> payload) {
        String tipoLivro = payload.get("tipo_livro");
        String faixaMatricula = payload.get("faixa_matricula");
        String sql = "INSERT INTO Livro (Tipo_Livro, Faixa_matricula) VALUES (?, ?)";
        jdbcTemplate.update(sql, tipoLivro, faixaMatricula);
        return "Livro adicionado com sucesso!";
    }
    // --- ACESSO_FUNCIONARIO ---
    @GetMapping("/acesso_funcionario")
    public List<Map<String, Object>> getAcessoFuncionario() {
        return jdbcTemplate.queryForList("SELECT * FROM Acesso_Funcionario");
    }

    @PostMapping("/acesso_funcionario")
    public String addAcessoFuncionario(@RequestBody Map<String, String> payload) {
        jdbcTemplate.update("INSERT INTO Acesso_Funcionario (Id_Funcionario, Id_Livro) VALUES (?, ?)", 
                            payload.get("id_funcionario"), payload.get("id_livro"));
        return "Acesso adicionado com sucesso!";
    }

    // --- INDICADOR REAL ---
    @GetMapping("/indicador_real")
    public List<Map<String, Object>> getIndicadorReal() {
        return jdbcTemplate.queryForList("SELECT * FROM Indicador_Real");
    }

    @PostMapping("/indicador_real")
    public String addIndicadorReal(@RequestBody Map<String, String> payload) {
        jdbcTemplate.update("INSERT INTO Indicador_Real (Endereco, Area, TIPO_Imovel, Qualidade) VALUES (?, ?, ?, ?)",
                payload.get("endereco"), payload.get("area"), payload.get("tipo_imovel"), payload.get("qualidade"));
        return "Indicador Real adicionado com sucesso!";
    }

    // --- MATRICULA ---
    @GetMapping("/matricula")
    public List<Map<String, Object>> getMatricula() {
        return jdbcTemplate.queryForList("SELECT * FROM Matricula");
    }

    @PostMapping("/matricula")
    public String addMatricula(@RequestBody Map<String, String> payload) {
        jdbcTemplate.update("INSERT INTO Matricula (Numero_Matricula, Id_Livro, Id_Indicador_Real) VALUES (?, ?, ?)",
                payload.get("numero_matricula"), payload.get("id_livro"), payload.get("id_indicador_real"));
        return "Matrícula adicionada com sucesso!";
    }

    // --- INDICADOR PESSOAL ---
    @GetMapping("/indicador_pessoal")
    public List<Map<String, Object>> getIndicadorPessoal() {
        return jdbcTemplate.queryForList("SELECT * FROM Indicador_Pessoal");
    }

    @PostMapping("/indicador_pessoal")
    public String addIndicadorPessoal(@RequestBody Map<String, String> payload) {
        jdbcTemplate.update("INSERT INTO Indicador_Pessoal (Nome_Participante, Percentual_Participacao, Tipo_de_Ato, Qualidade, Documento, Numero_do_Ato, Id_Matricula) VALUES (?, ?, ?, ?, ?, ?, ?)",
                payload.get("nome_participante"), payload.get("percentual_participacao"), payload.get("tipo_de_ato"), 
                payload.get("qualidade"), payload.get("documento"), payload.get("numero_do_ato"), payload.get("id_matricula"));
        return "Indicador Pessoal adicionado com sucesso!";
    }
}
