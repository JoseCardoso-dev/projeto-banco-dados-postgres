-- Índices em chaves estrangeiras

-- Feedback
CREATE INDEX idx_feedback_id_participante ON TB_FEEDBACK(ID_PARTICIPANTE);
CREATE INDEX idx_feedback_id_atividade ON TB_FEEDBACK(ID_ATIVIDADE);

-- Atividade
CREATE INDEX idx_atividade_id_local ON TB_ATIVIDADE(ID_LOCAL);
CREATE INDEX idx_atividade_id_projeto ON TB_ATIVIDADE(ID_PROJETO_EXTENSAO);
CREATE INDEX idx_atividade_id_evento ON TB_ATIVIDADE(ID_EVENTO);

-- Certificado
CREATE INDEX idx_certificado_id_atividade ON TB_CERTIFICADO(ID_ATIVIDADE);
CREATE INDEX idx_certificado_id_participante ON TB_CERTIFICADO(ID_PARTICIPANTE);

-- Ocorrência
CREATE INDEX idx_ocorrencia_id_atividade ON TB_OCORRENCIA(ID_ATIVIDADE);

-- Relacionamentos
CREATE INDEX idx_rl_participante_atividade_participante ON RL_PARTICIPANTE_ATIVIDADE(ID_PARTICIPANTE);
CREATE INDEX idx_rl_participante_atividade_atividade ON RL_PARTICIPANTE_ATIVIDADE(ID_ATIVIDADE);

CREATE INDEX idx_rl_atividade_instrutor_atividade ON RL_ATIVIDADE_INSTRUTOR(ID_ATIVIDADE);
CREATE INDEX idx_rl_atividade_instrutor_instrutor ON RL_ATIVIDADE_INSTRUTOR(ID_INSTRUTOR);

CREATE INDEX idx_rl_atividade_parceira_atividade ON RL_ATIVIDADE_PARCEIRA(ID_ATIVIDADE);
CREATE INDEX idx_rl_atividade_parceira_parceira ON RL_ATIVIDADE_PARCEIRA(ID_PARCEIRA);

CREATE INDEX idx_rl_atividade_membro_atividade ON RL_ATIVIDADE_MEMBRO_APOIO(ID_ATIVIDADE);
CREATE INDEX idx_rl_atividade_membro_membro ON RL_ATIVIDADE_MEMBRO_APOIO(ID_MEMBRO_APOIO);

CREATE INDEX idx_rl_atividade_recurso_atividade ON RL_ATIVIDADE_RECURSO(ID_ATIVIDADE);
CREATE INDEX idx_rl_atividade_recurso_recurso ON RL_ATIVIDADE_RECURSO(ID_RECURSO);
