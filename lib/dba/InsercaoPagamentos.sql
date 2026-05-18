USE transportadora;

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