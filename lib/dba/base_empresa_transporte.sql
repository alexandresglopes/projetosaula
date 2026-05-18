CREATE DATABASE transportadora 
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE transportadora;


CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,         
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(30) NOT NULL,
    celular VARCHAR(15) NOT NULL,    
    rua VARCHAR(50) NULL,
    bairro VARCHAR(50) NULL,
    cidade VARCHAR(30) NULL
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


CREATE TABLE veiculos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE, 
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano VARCHAR(5) NOT NULL,
    capacidade VARCHAR(5) NOT NULL    
);

INSERT INTO veiculos (placa, marca, modelo, ano, capacidade) 
VALUES 
('ABC1234','FORD','FIESTA','2018','5'),
('ABC1235','TOYOTA','COROLLA','2026','5'),
('ABC1236','FIAT','PUNTO','2020','5'),
('ABC1237','CHEVROLLET','PRISMA','2019','5'),
('ABC1238','NISSAN','MARCH','2022','5');



CREATE TABLE tipo_servico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_servico VARCHAR(20) NOT NULL UNIQUE, 
    descricao VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) DEFAULT NULL     
);

INSERT INTO tipo_servico (codigo_servico, descricao, valor) 
VALUES 
('COD001','transporte de pessoas','1500.50'),
('COD002','transporte de carga','3500.50'),
('COD003','transporte de material','2500.50'),
('COD004','transporte de animais','2500.50'),
('COD005','transporte de material restrito','6500.50');




CREATE TABLE viagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(25) NOT NULL UNIQUE, 
    cpf_cliente VARCHAR(14) NOT NULL, 
    cnh_motorista VARCHAR(15) NOT NULL,
    placa_veiculo VARCHAR(10) NOT NULL,
    tipo_servico VARCHAR(20) NOT NULL,
    data_saida DATE,
    data_chegada DATE,
    destino VARCHAR(50) NOT NULL,
    origem VARCHAR(50) NOT NULL,
    status_viagem VARCHAR(50) NOT NULL, 

    FOREIGN KEY (cpf_cliente) REFERENCES clientes(cpf),
    FOREIGN KEY (cnh_motorista) REFERENCES motoristas(cnh),
    FOREIGN KEY (placa_veiculo) REFERENCES veiculos(placa),
    FOREIGN KEY (tipo_servico) REFERENCES tipo_servico(codigo_servico)
);

INSERT INTO viagem (
codigo, 
cpf_cliente, 
cnh_motorista, 
placa_veiculo, 
tipo_servico, 
data_saida, 
data_chegada, 
destino, 
origem, 
status_viagem) 
VALUES 
('BR001', '000.000.000-01','12345','ABC1234','COD001','2026-05-18','2026-05-22','paraná','rio de janeiro','em aberto'),
('BR002', '000.000.000-02','12346','ABC1235','COD001','2026-05-18','2026-05-22','paraná','rio de janeiro','em aberto'),
('BR003', '000.000.000-03','12347','ABC1236','COD001','2026-05-18','2026-05-22','paraná','rio de janeiro','em aberto'),
('BR004', '000.000.000-04','12348','ABC1237','COD001','2026-05-18','2026-05-22','paraná','rio de janeiro','em aberto'),
('BR005', '000.000.000-05','12349','ABC1238','COD001','2026-05-18','2026-05-22','paraná','rio de janeiro','em aberto');



CREATE TABLE pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_pagamento VARCHAR(20) NOT NULL UNIQUE, 
    codigo_viagem VARCHAR(25) NOT NULL,
    data_pagamento DATE,
    valor_toral DECIMAL(10, 2) DEFAULT NULL,
    forma_pagamento VARCHAR(10) NOT NULL,

    FOREIGN KEY (codigo_viagem) REFERENCES viagem(codigo)     
);

INSERT INTO pagamentos (codigo_pagamento, codigo_viagem, data_pagamento, valor_toral, forma_pagamento) 
VALUES 
('PAG001','BR001', '2026-05-18','1500.50','PIX'),
('PAG002','BR002', '2026-05-18','3500.50','PIX'),
('PAG003','BR003', '2026-05-18','2500.50','PIX'),
('PAG004','BR004', '2026-05-18','2500.50','PIX'),
('PAG005','BR005', '2026-05-18','6500.50','PIX');


--CONSULTA DE CLIENTES
SELECT * FROM clientes;

SELECT * FROM clientes WHERE cpf='000.000.000-01';


--CONSULTA DE VIAGENS
SELECT * FROM viagem;

SELECT * FROM viagem WHERE cpf_cliente='000.000.000-01';

SELECT * FROM viagem WHERE cnh_motorista='12345';

SELECT * FROM viagem WHERE placa_veiculo='ABC1234';


--CONSULTA DE MOTORISTAS
SELECT * FROM motoristas;

SELECT * FROM motoristas WHERE cnh='12345';


--CONSULTA DE TIPO DE SERVIÇOS
SELECT * FROM tipo_servico;

SELECT * FROM tipo_servico WHERE codigo_servico='COD001';

SELECT * FROM tipo_vtipo_servicoiagem WHERE valor >= '2500';


--CONSULTA DE PAGAMENTODS
SELECT * FROM pagamentos;

SELECT * FROM pagamentos WHERE codigo_pagamento='PAG001';

SELECT * FROM pagamentos WHERE codigo_viagem='BR001';

SELECT * FROM pagamentos WHERE valor_toral >= '1500';










