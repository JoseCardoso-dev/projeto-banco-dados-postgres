CREATE OR REPLACE PROCEDURE sp_upsert_atividade_completa(
    p_id_atividade INTEGER,
    p_nm_atividade VARCHAR,
    p_dt_atividade DATE,
    p_ds_atividade TEXT,
    p_qt_carga_horaria INTEGER,
    p_id_local INTEGER,
    p_id_evento INTEGER,
    p_id_projeto_extensao INTEGER,
    p_instrutores INTEGER[],
    p_parceiras INTEGER[]
)
LANGUAGE plpgsql
AS $$
DECLARE
    id_instrutor INTEGER;
    id_parceira INTEGER;
BEGIN
    -- Verifica se atividade existe
    IF EXISTS (SELECT 1 FROM TB_ATIVIDADE WHERE ID_ATIVIDADE = p_id_atividade) THEN
        -- UPDATE
        UPDATE TB_ATIVIDADE
        SET NM_ATIVIDADE = p_nm_atividade,
            DT_ATIVIDADE = p_dt_atividade,
            DS_ATIVIDADE = p_ds_atividade,
            QT_CARGA_HORARIA = p_qt_carga_horaria,
            ID_LOCAL = p_id_local,
            ID_EVENTO = p_id_evento,
            ID_PROJETO_EXTENSAO = p_id_projeto_extensao
        WHERE ID_ATIVIDADE = p_id_atividade;
    ELSE
        -- INSERT
        INSERT INTO TB_ATIVIDADE (
            ID_ATIVIDADE, NM_ATIVIDADE, DT_ATIVIDADE, DS_ATIVIDADE,
            QT_CARGA_HORARIA, ID_LOCAL, ID_EVENTO, ID_PROJETO_EXTENSAO
        ) VALUES (
            p_id_atividade, p_nm_atividade, p_dt_atividade, p_ds_atividade,
            p_qt_carga_horaria, p_id_local, p_id_evento, p_id_projeto_extensao
        );
    END IF;

    -- Remove vínculos antigos
    DELETE FROM RL_ATIVIDADE_INSTRUTOR WHERE ID_ATIVIDADE = p_id_atividade;
    DELETE FROM RL_ATIVIDADE_PARCEIRA WHERE ID_ATIVIDADE = p_id_atividade;

    -- Insere vínculos novos com instrutores
    FOREACH id_instrutor IN ARRAY p_instrutores LOOP
        INSERT INTO RL_ATIVIDADE_INSTRUTOR (ID_ATIVIDADE, ID_INSTRUTOR, DS_PAPEL)
        VALUES (p_id_atividade, id_instrutor, 'Instrutor');
    END LOOP;

    -- Insere vínculos novos com parceiras
    FOREACH id_parceira IN ARRAY p_parceiras LOOP
        INSERT INTO RL_ATIVIDADE_PARCEIRA (ID_ATIVIDADE, ID_PARCEIRA, DS_TIPO)
        VALUES (p_id_atividade, id_parceira, 'Apoiadora');
    END LOOP;
END;
$$;


-- Verificar atividades por nome
SELECT * FROM tb_atividade WHERE nm_atividade ILIKE '%workshop%';

-- Verificar se um instrutor já está vinculado a uma atividade
SELECT * FROM rl_atividade_instrutor WHERE id_atividade = 1;