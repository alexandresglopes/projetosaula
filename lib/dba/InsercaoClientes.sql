USE transportadora;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,         
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(30) NOT NULL,
    celular VARCHAR(15) NOT NULL,    
    rua VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(30)
);


INSERT INTO clientes (nome, sobrenome, cpf, email, celular, rua, bairro, cidade) 
VALUES 
('João','Silva','000.000.000-01','joao@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Maria','Silva','000.000.000-02','maria@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Pedro','Silva','000.000.000-03','pedro@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Jose','Silva','000.000.000-04','jose@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('Marcos','Silva','000.000.000-05','marcos@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('manuel','Silva','000.000.000-06','manuel@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('rebeca','Silva','000.000.000-07','rebeca@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('gustavo','Silva','000.000.000-08','gustavo@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('antonio','Silva','000.000.000-09','antonio@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C'),
('lais','Silva','000.000.000-10','lais@email.com','(21) 99999-9999','Rua A','Bairro B','Cidade C');