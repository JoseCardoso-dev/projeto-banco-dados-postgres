CREATE MATERIALIZED VIEW mv_atividades_completas AS
SELECT
    a.id_atividade,
    a.nm_atividade,
    a.dt_atividade,
    a.qt_carga_horaria,
    l.nm_local,
    p.nm_projeto,
    e.nm_evento,
    array_agg(i.nm_instrutor) AS instrutores
FROM tb_atividade a
LEFT JOIN tb_local l ON a.id_local = l.id_local
LEFT JOIN tb_projeto_extensao p ON a.id_projeto_extensao = p.id_projeto_extensao
LEFT JOIN tb_evento e ON a.id_evento = e.id_evento
LEFT JOIN rl_atividade_instrutor ai ON ai.id_atividade = a.id_atividade
LEFT JOIN tb_instrutor i ON i.id_instrutor = ai.id_instrutor
GROUP BY a.id_atividade, l.nm_local, p.nm_projeto, e.nm_evento;