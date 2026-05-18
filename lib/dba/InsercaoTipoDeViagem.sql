USE transportadora;

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