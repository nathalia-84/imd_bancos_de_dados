DROP TABLE IF EXISTS REGISTRO_NOTA;
DROP TABLE IF EXISTS TURMA;
DROP TABLE IF EXISTS PRE_REQUISITO;
DROP TABLE IF EXISTS DISCIPLINA;
DROP TABLE IF EXISTS ALUNO;
DROP TABLE IF EXISTS CURSO;
DROP TABLE IF EXISTS PROFESSOR;
DROP TABLE IF EXISTS DEPARTAMENTO;

-- Tabela DEPARTAMENTO
CREATE TABLE DEPARTAMENTO (
    Numero_departamento INT PRIMARY KEY,
    Nome_departamento VARCHAR(100) NOT NULL
);

-- Tabela CURSO
CREATE TABLE CURSO (
    Numero_curso INT PRIMARY KEY,
    Numero_departamento INT,
    Nome_curso VARCHAR(100) NOT NULL,
    FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento)
);

-- Tabela PROFESSOR
CREATE TABLE PROFESSOR (
    Numero_professor INT PRIMARY KEY,
    Nome_professor VARCHAR(100) NOT NULL,
    Numero_departamento INT,
    FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento)
);

-- Tabela ALUNO
CREATE TABLE ALUNO (
    Numero_aluno INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Tipo_aluno VARCHAR(50),
    Numero_curso INT,
    FOREIGN KEY (Numero_curso) REFERENCES CURSO(Numero_curso)
);

-- Tabela DISCIPLINA
CREATE TABLE DISCIPLINA (
    Numero_disciplina INT PRIMARY KEY,
    Nome_disciplina VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    Numero_departamento INT,
    FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento)
);

-- Tabela PRE_REQUISITO
CREATE TABLE PRE_REQUISITO (
    Numero_disciplina INT,
    Numero_pre_requisito INT,
    PRIMARY KEY (Numero_disciplina, Numero_pre_requisito),
    FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA(Numero_disciplina),
    FOREIGN KEY (Numero_pre_requisito) REFERENCES DISCIPLINA(Numero_disciplina)
);

-- Tabela TURMA
CREATE TABLE TURMA(
    Identificador_turma INT PRIMARY KEY,
    Numero_disciplina INT NOT NULL,
    Semestre CHAR(1) NOT NULL,
    Ano INT NOT NULL,
    Professor INT,
    FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA (Numero_disciplina),
    FOREIGN KEY (Professor) REFERENCES PROFESSOR (Numero_professor)
);

-- Tabela REGISTRO_NOTA
CREATE TABLE REGISTRO_NOTA(
    Numero_aluno INT,
    Identificador_turma INT,
    Nota DECIMAL(3,1) NOT NULL,
    FOREIGN KEY (Numero_aluno) REFERENCES ALUNO (Numero_aluno),
    FOREIGN KEY (Identificador_turma) REFERENCES TURMA (Identificador_turma),
    PRIMARY KEY(Numero_aluno, Identificador_turma)
);

-- DEPARTAMENTO
INSERT INTO DEPARTAMENTO VALUES (1, 'Defesa Contra as Artes das Trevas');
INSERT INTO DEPARTAMENTO VALUES (2, 'Transfiguração');
INSERT INTO DEPARTAMENTO VALUES (3, 'Poções');

-- CURSO
INSERT INTO CURSO VALUES (1, 1, 'Defesa Mágica');
INSERT INTO CURSO VALUES (2, 2, 'Transfiguração Avançada');
INSERT INTO CURSO VALUES (3, 3, 'Mestre em Poções');

-- PROFESSOR
INSERT INTO PROFESSOR VALUES (1, 'Severus Snape', 3);
INSERT INTO PROFESSOR VALUES (2, 'Minerva McGonagall', 2);
INSERT INTO PROFESSOR VALUES (3, 'Remus Lupin', 1);

-- ALUNO
INSERT INTO ALUNO VALUES (1, 'Harry Potter', 'Grifinória', 1);
INSERT INTO ALUNO VALUES (2, 'Hermione Granger', 'Grifinória', 2);
INSERT INTO ALUNO VALUES (3, 'Draco Malfoy', 'Sonserina', 3);

-- DISCIPLINA
INSERT INTO DISCIPLINA VALUES (1, 'Poções', 4, 3);
INSERT INTO DISCIPLINA VALUES (2, 'Transfiguração', 4, 2);
INSERT INTO DISCIPLINA VALUES (3, 'Defesa Contra as Artes das Trevas', 4, 1);

-- PRE_REQUISITO
INSERT INTO PRE_REQUISITO VALUES (3, 1); -- Defesa Contra as Artes das Trevas requer Poções
INSERT INTO PRE_REQUISITO VALUES (2, 1); -- Transfiguração requer Poções

-- TURMA
INSERT INTO TURMA VALUES (1, 1, 'A', 2025, 1); -- Poções com Snape
INSERT INTO TURMA VALUES (2, 2, 'A', 2025, 2); -- Transfiguração com McGonagall
INSERT INTO TURMA VALUES (3, 3, 'A', 2025, 3); -- Defesa Contra as Artes das Trevas com Lupin

-- REGISTRO_NOTA
INSERT INTO REGISTRO_NOTA VALUES (1, 1, 9.0); -- Harry em Poções
INSERT INTO REGISTRO_NOTA VALUES (2, 2, 10.0); -- Hermione em Transfiguração
INSERT INTO REGISTRO_NOTA VALUES (3, 3, 8.5); -- Draco em Defesa Contra as Artes das Trevas
INSERT INTO REGISTRO_NOTA VALUES (2, 1, 9.5); -- Hermione em Poções