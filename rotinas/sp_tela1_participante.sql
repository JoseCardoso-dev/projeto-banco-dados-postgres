CREATE OR REPLACE PROCEDURE sp_cadastrar_participante(
    p_nome VARCHAR,
    p_email VARCHAR,
    p_tipo VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_id_existente INT;
BEGIN
    -- Verifica se o participante já existe pelo email
    SELECT ID_PARTICIPANTE INTO v_id_existente
    FROM TB_PARTICIPANTE
    WHERE DS_EMAIL = p_email;

    IF v_id_existente IS NOT NULL THEN
        -- Participante já existe, atualiza o nome e o tipo
        UPDATE TB_PARTICIPANTE
        SET NM_PARTICIPANTE = p_nome,
            TP_PARTICIPANTE = p_tipo
        WHERE ID_PARTICIPANTE = v_id_existente;

        RAISE NOTICE 'Participante já existente atualizado.';
    ELSE
        -- Novo participante
        INSERT INTO TB_PARTICIPANTE (NM_PARTICIPANTE, DS_EMAIL, TP_PARTICIPANTE)
        VALUES (p_nome, p_email, p_tipo);

        RAISE NOTICE 'Novo participante cadastrado.';
    END IF;
END;
$$;
