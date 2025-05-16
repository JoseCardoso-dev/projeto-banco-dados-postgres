-- Participante
CREATE INDEX idx_participante_nm ON TB_PARTICIPANTE(NM_PARTICIPANTE);
CREATE INDEX idx_participante_email ON TB_PARTICIPANTE(DS_EMAIL);

-- Instrutor
CREATE INDEX idx_instrutor_nm ON TB_INSTRUTOR(NM_INSTRUTOR);

-- Atividade
CREATE INDEX idx_atividade_nm ON TB_ATIVIDADE(NM_ATIVIDADE);
CREATE INDEX idx_atividade_dt ON TB_ATIVIDADE(DT_ATIVIDADE);

-- Evento
CREATE INDEX idx_evento_nm ON TB_EVENTO(NM_EVENTO);
CREATE INDEX idx_evento_dts ON TB_EVENTO(DT_INICIO, DT_FIM);

-- Local
CREATE INDEX idx_local_nm ON TB_LOCAL(NM_LOCAL);

-- Recurso
CREATE INDEX idx_recurso_nm ON TB_RECURSO(NM_RECURSO);

-- Projeto de Extensão
CREATE INDEX idx_projeto_nm ON TB_PROJETO_EXTENSAO(NM_PROJETO);
