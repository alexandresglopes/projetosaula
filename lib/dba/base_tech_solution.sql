CREATE DATABASE tech_solutions 
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE tech_solutions;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,         
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50),
    email VARCHAR(50) NOT NULL,
    celular VARCHAR(15) NOT NULL,    
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(30)
);


INSERT INTO clientes (nome, sobrenome, email, celular, rua, bairro, cidade) 
VALUES 
('João','Silva','joao@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Maria','Silva','maria@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Pedro','Silva','pedro@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Jose','Silva','jose@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Marcos','Silva','marcos@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C');



CREATE TABLE tecnicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(15) NOT NULL UNIQUE,    
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    sexo VARCHAR(10) NOT NULL,
    formacao VARCHAR(50) NOT NULL,    
    nivel VARCHAR(10) NOT NULL,
    salario DECIMAL(10, 2) DEFAULT NULL    
);

INSERT INTO tecnicos (matricula, nome, sobrenome, sexo, formacao, nivel, salario) 
VALUES 
('12345','João','Silva','masculino','TI','1', 10000.00),
('12346','Maria','Silva','feminino','Eletrica','1', 9000.00),
('12347','Pedro','Silva','masculino','Engenharia','2', 8000.00),
('12348','Jose','Silva','masculino','Mecanica','2', 7000.00),
('12349','Marcos','Silva','masculino','TI','1', 10000.00);



CREATE TABLE chamados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL, -
    descricao VARCHAR(300) NOT NULL,
    data_solicitacao DATE,
    status_solicitacao VARCHAR(2) NOT NULL,    
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

INSERT INTO chamados (id_cliente, descricao, data_solicitacao, status_solicitacao) 
VALUES 
(1,'chamado 1','2026-05-05','1'),
(2,'chamado 2','2026-05-06','1'),
(3,'chamado 3','2026-05-07','1'),
(4,'chamado 4','2026-05-09','2'),
(5,'chamado 5','2026-05-11','2');



CREATE TABLE servicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_servico VARCHAR(15) NOT NULL, 
    id_chamado INT NOT NULL, 
    matricula_tecnico VARCHAR(15) NOT NULL,
    data_solicitacao DATE, 
    observacao VARCHAR(300) NOT NULL,  
    FOREIGN KEY (id_chamado) REFERENCES chamados(id),
    FOREIGN KEY (matricula_tecnico) REFERENCES tecnicos(matricula)
);

INSERT INTO servicos (codigo_servico, id_chamado, matricula_tecnico, data_solicitacao, observacao) 
VALUES 
('TEC001', 1,'12345','2026-05-05','RESOLVIDO'),
('TEC002', 2,'12346','2026-05-06','RESOLVIDO'),
('TEC003', 3,'12347','2026-05-07','NÃO RESOLVIDO'),
('TEC004', 4,'12348','2026-05-09','EM ANDAMENTO'),
('TEC005', 5,'12349','2026-05-11','RESOLVIDO');