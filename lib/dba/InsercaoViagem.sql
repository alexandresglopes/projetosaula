InsercaoPagamentos.sql

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
