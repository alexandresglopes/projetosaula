USE transportadora;

CREATE TABLE motoristas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cnh VARCHAR(15) NOT NULL UNIQUE,    
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    categoria VARCHAR(5) NOT NULL      
);

INSERT INTO motoristas (cnh, nome, sobrenome, cpf, telefone, categoria) 
VALUES 
('12345','João','Silva','000.000.000-11','(00) 00000-0000','D'),
('12346','pedro','Silva','000.000.000-12','(00) 00000-0000','B'),
('12347','maria','Silva','000.000.000-13','(00) 00000-0000','E'),
('12348','luiz','Silva','000.000.000-14','(00) 00000-0000','B'),
('12349','mariana','Silva','000.000.000-15','(00) 00000-0000','D');