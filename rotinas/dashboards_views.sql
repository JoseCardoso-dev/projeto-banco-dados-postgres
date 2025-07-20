-- DASHBOARD 1: 4 GRÁFICOS ANALÍTICOS ESTRATÉGICOS

-- 1. Participação por tipo de participante
CREATE MATERIALIZED VIEW mv_total_por_tipo_participante AS
SELECT tp_participante, COUNT(*) AS total
FROM tb_participante
GROUP BY tp_participante;

-- 2. Carga horária total oferecida por evento
CREATE MATERIALIZED VIEW mv_carga_evento AS
SELECT e.nm_evento, SUM(a.qt_carga_horaria) AS carga_total
FROM tb_evento e
JOIN tb_atividade a ON a.id_evento = e.id_evento
GROUP BY e.nm_evento;

-- 3. Atividades com maior presença
CREATE MATERIALIZED VIEW mv_presenca_atividade AS
SELECT a.nm_atividade, COUNT(*) AS qtd_presentes
FROM tb_atividade a
JOIN rl_participante_atividade r ON r.id_atividade = a.id_atividade
WHERE r.is_presente = true
GROUP BY a.nm_atividade
ORDER BY qtd_presentes DESC;

-- 4. Avaliação média por atividade
CREATE MATERIALIZED VIEW mv_nota_media_atividade AS
SELECT a.nm_atividade, ROUND(AVG(f.nr_nota), 2) AS media_nota
FROM tb_atividade a
JOIN tb_feedback f ON f.id_atividade = a.id_atividade
GROUP BY a.nm_atividade;


-- DASHBOARD 2: 6 GRÁFICOS ANALÍTICOS OPERACIONAIS

-- 1. Capacidade total dos locais por tipo
CREATE MATERIALIZED VIEW mv_capacidade_tipo_local AS
SELECT ds_tipo, SUM(qt_capacidade) AS capacidade_total
FROM tb_local
GROUP BY ds_tipo;

-- 2. Total de recursos utilizados por tipo
CREATE MATERIALIZED VIEW mv_uso_recursos AS
SELECT r.nm_recurso, SUM(ar.nr_quantidade_utilizado) AS total_utilizado
FROM tb_recurso r
JOIN rl_atividade_recurso ar ON ar.id_recurso = r.id_recurso
GROUP BY r.nm_recurso;

-- 3. Número de atividades por projeto de extensão
CREATE MATERIALIZED VIEW mv_atividades_por_projeto AS
SELECT p.nm_projeto, COUNT(*) AS total_atividades
FROM tb_projeto_extensao p
JOIN tb_atividade a ON a.id_projeto_extensao = p.id_projeto_extensao
GROUP BY p.nm_projeto;

-- 4. Quantidade de ocorrências por tipo
CREATE MATERIALIZED VIEW mv_ocorrencias_por_tipo AS
SELECT ds_tipo, COUNT(*) AS total
FROM tb_ocorrencia
GROUP BY ds_tipo;

-- 5. Participantes com mais certificados
CREATE MATERIALIZED VIEW mv_certificados_por_participante AS
SELECT p.nm_participante, COUNT(*) AS total_certificados
FROM tb_participante p
JOIN tb_certificado c ON c.id_participante = p.id_participante
GROUP BY p.nm_participante
ORDER BY total_certificados DESC;

-- 6. Feedbacks recebidos por atividade
CREATE MATERIALIZED VIEW mv_feedbacks_por_atividade AS
SELECT a.nm_atividade, COUNT(*) AS total_feedbacks
FROM tb_atividade a
JOIN tb_feedback f ON f.id_atividade = a.id_atividade
GROUP BY a.nm_atividade;
