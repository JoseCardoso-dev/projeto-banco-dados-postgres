-- Inserindo participantes
INSERT INTO TB_PARTICIPANTE (NM_PARTICIPANTE, DS_EMAIL, TP_PARTICIPANTE) VALUES
('Ana Silva', 'ana.silva@example.com', 'Aluno'),
('Bruno Souza', 'bruno.souza@example.com', 'Professor'),
('Carla Mendes', 'carla.mendes@example.com', 'Comunidade'),
('Daniel Oliveira', 'daniel.oliveira@example.com', 'Aluno'),
('Eduarda Lima', 'eduarda.lima@example.com', 'Professor');

-- Inserindo instrutores
INSERT INTO TB_INSTRUTOR (NM_INSTRUTOR, DS_EMAIL, DS_AREA_ESPECIALIDADE) VALUES
('Fábio Costa', 'fabio.costa@example.com', 'Inteligência Artificial'),
('Gisele Rocha', 'gisele.rocha@example.com', 'Redes de Computadores'),
('Henrique Almeida', 'henrique.almeida@example.com', 'Segurança da Informação');

-- Inserindo instituições/parceiras
INSERT INTO TB_PARCEIRA (NM_PARCEIRA, DS_TIPO, DS_CONTATO) VALUES
('Tech Solutions', 'Empresa Privada', 'contato@techsolutions.com'),
('ONG Saber', 'ONG', 'contato@ongsaber.org');

-- Inserindo membros de apoio
INSERT INTO TB_MEMBRO_APOIO (NM_MEMBRO_APOIO, DS_PAPEL) VALUES
('Isabela Martins', 'Organizador'),
('João Pedro', 'Voluntário');

-- Inserindo locais
INSERT INTO TB_LOCAL (NM_LOCAL, DS_TIPO, QT_CAPACIDADE) VALUES
('Auditório Principal', 'Auditório', 100),
('Sala 101', 'Sala', 30);

-- Inserindo recursos
INSERT INTO TB_RECURSO (NM_RECURSO, QT_DISPONIVEL) VALUES
('Projetor', 5),
('Notebook', 10);

-- Inserindo projeto de extensão
INSERT INTO TB_PROJETO_EXTENSAO (NM_PROJETO, DS_TITULO, NM_RESPONSAVEL, DS_PERIODO) VALUES
('Inclusão Digital', 'Projeto de Inclusão Digital para a Comunidade', 'Prof. Marcos Paulo', '2025-01 a 2025-12');

-- Inserindo evento
INSERT INTO TB_EVENTO (NM_EVENTO, DT_INICIO, DT_FIM, DS_EVENTO) VALUES
('Semana da Computação', '2025-06-01', '2025-06-05', 'Evento anual com palestras e workshops na área de computação.');

-- Inserindo atividades
INSERT INTO TB_ATIVIDADE (DT_ATIVIDADE, NM_ATIVIDADE, DS_ATIVIDADE, QT_CARGA_HORARIA, ID_LOCAL, ID_PROJETO_EXTENSAO, ID_EVENTO) VALUES
('2025-06-02', 'Workshop de Python', 'Introdução à programação em Python.', 4, 1, 1, 1),
('2025-06-03', 'Palestra sobre Segurança da Informação', 'Discussão sobre práticas de segurança na internet.', 2, 2, 1, 1);

-- Inserindo feedbacks
INSERT INTO TB_FEEDBACK (NR_NOTA, DS_COMENTARIO, DT_FEEDBACK, ID_PARTICIPANTE, ID_ATIVIDADE) VALUES
(5, 'Excelente workshop!', '2025-06-02', 1, 1),
(4, 'Muito informativo.', '2025-06-03', 3, 2);

-- Inserindo certificados
INSERT INTO TB_CERTIFICADO (DT_EMISSAO, DS_TITULO, DS_DESCRICAO, CD_VERIFICACAO, ID_ATIVIDADE, ID_PARTICIPANTE) VALUES
('2025-06-06', 'Participação no Workshop de Python', 'Certificamos que Ana Silva participou do Workshop de Python.', 'ABC123', 1, 1),
('2025-06-06', 'Participação na Palestra sobre Segurança da Informação', 'Certificamos que Carla Mendes participou da Palestra sobre Segurança da Informação.', 'DEF456', 2, 3);

-- Inserindo ocorrências
INSERT INTO TB_OCORRENCIA (DH_OCORRENCIA, DS_TIPO, DS_DESCRICAO, ID_ATIVIDADE) VALUES
('2025-06-02 10:00:00', 'Equipamento', 'Projetor apresentou falha durante o workshop.', 1);

-- Relacionando participantes com atividades
INSERT INTO RL_PARTICIPANTE_ATIVIDADE (ID_PARTICIPANTE, ID_ATIVIDADE, IS_PRESENTE) VALUES
(1, 1, TRUE),
(3, 2, TRUE);

-- Relacionando atividades com instrutores
INSERT INTO RL_ATIVIDADE_INSTRUTOR (ID_ATIVIDADE, ID_INSTRUTOR, DS_PAPEL) VALUES
(1, 1, 'Ministrante'),
(2, 3, 'Palestrante');

-- Relacionando atividades com parceiras
INSERT INTO RL_ATIVIDADE_PARCEIRA (ID_ATIVIDADE, ID_PARCEIRA, DS_TIPO) VALUES
(1, 1, 'Patrocinador'),
(2, 2, 'Apoiador');

-- Relacionando atividades com membros de apoio
INSERT INTO RL_ATIVIDADE_MEMBRO_APOIO (ID_ATIVIDADE, ID_MEMBRO_APOIO, NR_CARGA_HORARIA) VALUES
(1, 1, 4),
(2, 2, 2);

-- Relacionando atividades com recursos utilizados
INSERT INTO RL_ATIVIDADE_RECURSO (ID_ATIVIDADE, ID_RECURSO, NR_QUANTIDADE_UTILIZADO) VALUES
(1, 1, 1),
(2, 2, 2);
