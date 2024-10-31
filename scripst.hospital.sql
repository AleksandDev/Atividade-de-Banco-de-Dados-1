-- Criação banco de dados
---------------------------------------
CREATE DATABASE hospital_fundamental2;
USE hospital_fundamental2;

CREATE TABLE paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    crm VARCHAR(20),
    especialidade VARCHAR(50)    
);

CREATE TABLE quarto (
    numero INT PRIMARY KEY,
    tipo ENUM('apartamento', 'duplo', 'enfermaria'),
    valor_diario DECIMAL(10,2)
);

CREATE TABLE internacao (
    id_internacao INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT,
    id_medico INT,
    numero_quarto INT,
    data_entrada DATE,
    data_prevista_alta DATE,
    data_efetiva_alta DATE,
    procedimentos TEXT,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico),
    FOREIGN KEY (numero_quarto) REFERENCES quarto(numero)
);

CREATE TABLE enfermeiro (
    id_enfermeiro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(11),
    coren VARCHAR(20)
);

CREATE TABLE internacao_enfermeiro (
    id_internacao INT,
    id_enfermeiro INT,
    PRIMARY KEY (id_internacao, id_enfermeiro),
    FOREIGN KEY (id_internacao) REFERENCES internacao(id_internacao),
    FOREIGN KEY (id_enfermeiro) REFERENCES enfermeiro(id_enfermeiro) 
);