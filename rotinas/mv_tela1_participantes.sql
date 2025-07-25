CREATE MATERIALIZED VIEW mv_participantes_recentes AS
SELECT 
    ID_PARTICIPANTE,
    NM_PARTICIPANTE,
    DS_EMAIL,
    TP_PARTICIPANTE,
    CURRENT_TIMESTAMP AS DT_CRIACAO
FROM TB_PARTICIPANTE
ORDER BY ID_PARTICIPANTE DESC
LIMIT 50;

-- Atualização manual da view:
REFRESH MATERIALIZED VIEW mv_participantes_recentes;