CREATE DATABASE lyon_educadion
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE lyon_educadion;

CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    cpf VARCHAR(14) NOT NULL UNIQUE,    
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50),
    email VARCHAR(50) NOT NULL,
    senha VARCHAR(20) NOT NULL,
    funcao VARCHAR(15) NOT NULL,
    sexo VARCHAR(10),
    data_nascimento DATE,    
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(30)
);

INSERT INTO funcionarios (cpf, nome, sobrenome, email, senha, funcao, sexo, data_nascimento, rua, bairro, cidade) 
VALUES 
('12345678900','joão','silva','email@email.com','123456','professor','masculino','1980-01-01','rua','bairro','cidade'),
('12345678901','maria','silva','email@email.com','123456','professor','feminino','1980-02-01','rua','bairro','cidade'),
('12345678902','pedro','silva','email@email.com','123456','professor','masculino','1980-03-01','rua','bairro','cidade'),
('12345678903','jose','silva','email@email.com','123456','professor','masculino','1980-04-01','rua','bairro','cidade'),
('12345678904','marcos','silva','email@email.com','123456','professor','masculino','1980-05-01','rua','bairro','cidade');

CREATE TABLE professor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    matricula VARCHAR(15) NOT NULL UNIQUE,
    cpf_funcionario VARCHAR(14) NOT NULL,  
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    nivel VARCHAR(10) NOT NULL,
    formacao VARCHAR(10) NOT NULL,   
    
    FOREIGN KEY (cpf_funcionario) REFERENCES funcionarios(cpf)
);

INSERT INTO funcionarios (matricula, cpf_funcionario, nome, sobrenome, nivel, formacao) 
VALUES 
('12345','12345678900','joão','silva','1','123456','portugues'),
('12346','12345678901','maria','silva','1','123456','matematica'),
('12347','12345678902','pedro','silva','1','123456','geografia'),
('12348','12345678903','jose','silva','1','123456','historia'),
('12349','12345678904','marcos','silva','1','123456','ciencias');

CREATE TABLE turma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_turma VARCHAR(15) NOT NULL,
    nome_curso VARCHAR(30) NOT NULL,
    carga_horaria VARCHAR(10) NOT NULL,
    matricula_professor VARCHAR(15) NOT NULL,
    turno VARCHAR(10) NOT NULL,
    
    FOREIGN KEY (matricula_professor) REFERENCES professor(matricula)
);

INSERT INTO turma (numero_turma, nome_curso, carga_horaria, matricula_professor, turno) 
VALUES 
('1001','portugues','8','silva','1','12345','manha'),
('1002','matematica','8','silva','1','12346','manha'),
('1003','geografia','8','silva','1','12347','manha'),
('1004','historia','8','silva','1','12348','tarde'),
('1005','ciencias','8','silva','1','12349','tarde');

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    matricula VARCHAR(15) NOT NULL UNIQUE,
    numero_turma VARCHAR(15) NOT NULL,    
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50),
    sexo VARCHAR(10),
    foto VARCHAR(10),
    data_nascimento DATE, 
    nome_responsavel VARCHAR(50),       
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(30)

    FOREIGN KEY (numero_turma) REFERENCES turma(numero_turma)
);

INSERT INTO funcionarios (matricula, numero_turma, nome, sobrenome, sexo, foto, data_nascimento, nome_responsavel, rua, bairro, cidade) 
VALUES 
('12345','1001','vitor','silva','masculino','img1.png','1980-01-01','lucas','rua','bairro','cidade'),
('12346','1001','maria','silva','feminino','img2.png','1980-02-01','mario','rua','bairro','cidade'),
('12347','1002','pedro','silva','masculino','img3.png','1980-03-01','fatima','rua','bairro','cidade'),
('12348','1002','jose','silva','masculino','img4.png','1980-04-01','angela','rua','bairro','cidade'),
('12349','1003','marcos','silva','masculino','img5.png','1980-05-01','maria','rua','bairro','cidade');
