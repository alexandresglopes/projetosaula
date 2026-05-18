USE transportadora;

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