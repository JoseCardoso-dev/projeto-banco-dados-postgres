# Projeto de Banco de Dados - Extensão e Implementação do Estudo de Caso

Este projeto consiste na elaboração, modelagem, implantação e otimização de um banco de dados relacional utilizando o PostgreSQL, baseado em uma extensão crítica do estudo de caso atribuído pela disciplina. O objetivo é propor uma solução completa que atenda aos requisitos originais e expanda sua descrição, garantindo a integridade, performance e manutenibilidade do sistema.

---

## Contexto e Proposta

A partir do estudo de caso fornecido pelo professor, foi realizada uma análise crítica para identificar oportunidades de extensão dos requisitos e funcionalidades. Com base nesse levantamento, foi definido um minimundo contendo tabelas, relacionamentos e restrições suficientes para atender tanto aos requisitos originais quanto aos estendidos, com foco em um modelo robusto e escalável.

---

## Modelagem e Implantação

A modelagem do banco foi desenvolvida em duas etapas principais:

- **Modelagem Conceitual:** Utilizando o Modelo Entidade-Relacionamento (MER) na notação de Peter Chen, conforme o livro texto da disciplina, para definir entidades, atributos, relacionamentos e restrições de cardinalidade.

- **Modelagem Lógica:** Transformação do MER em um modelo relacional adequado ao PostgreSQL, incluindo a definição de chaves primárias, estrangeiras e regras de integridade.

Para materializar essa modelagem, foram elaborados scripts SQL-DDL, organizados na pasta `criacao/` do projeto, que incluem:

- `tabelas.sql`: criação das tabelas conforme o modelo lógico;
- `relacionamentos.sql`: definição das relações e integridade referencial;
- `permissoes.sql`: controle de acesso e privilégios no banco.

---

## População e Consultas

Para validar o modelo e permitir testes de desempenho e funcionalidade, o banco foi populado com dados sintéticos organizados em dois scripts na pasta `populacao/`:

- `populacao-01.sql`: dados básicos e essenciais;
- `populacao-02.sql`: dados complementares para testes mais abrangentes.

Além disso, foram desenvolvidas consultas SQL para avaliação das operações no banco, divididas em:

- `intermediarias.sql`: consultas com complexidade média, envolvendo múltiplos joins e filtros;
- `avancada.sql`: consultas avançadas, incluindo subqueries e agregações complexas.

---

## Backup e Manutenção

Para garantir a segurança dos dados e a continuidade operacional, foram criados scripts automatizados para backup e verificação da integridade das cópias, localizados na pasta `backups/config/`:

- `backup_full.sh`: script para realização de backup completo da base;
- `check_backup_integrity.sh`: script para validar a integridade dos backups realizados.

O arquivo `readme.md` nesta mesma pasta contém instruções detalhadas para o uso desses scripts.

---

## Configuração do Ambiente com Docker

O projeto conta com uma infraestrutura conteinerizada para facilitar o deploy e replicação do ambiente de banco de dados:

- `Dockerfile`: definição da imagem personalizada do PostgreSQL com ajustes específicos;
- `docker-compose.yml`: orquestração dos containers, configuração de volumes e variáveis de ambiente;
- `postgresql.conf`: arquivo de configuração avançada do servidor PostgreSQL.

Essa abordagem facilita a reprodução do ambiente em diferentes máquinas, garantindo consistência entre desenvolvedores e facilitando testes.

---

## Controle e Documentação

Toda a documentação, histórico de alterações e logs importantes do projeto estão registrados na pasta `log/`, que contém um `readme.md` explicando o uso e organização das informações para manutenção futura.

---

## Diretrizes e Boas Práticas

Durante todo o desenvolvimento, foram seguidas as políticas e boas práticas estabelecidas pelas diretrizes MAD1, PPP1 e PBR1, que guiaram a organização modular do projeto, a documentação e a automação das rotinas.

---

## Estrutura do Projeto

DB/
├── backups/
│ └── config/
│ ├── backup_full.sh
│ ├── check_backup_integrity.sh
│ └── readme.md
├── consultas/
│ ├── avancada.sql
│ └── intermediarias.sql
├── criacao/
│ ├── permissoes.sql
│ ├── relacionamentos.sql
│ └── tabelas.sql
├── indexacao/ (não utilizado no momento)
├── log/
│ └── readme.md
├── populacao/
│ ├── populacao-01.sql
│ └── populacao-02.sql
├── docker-compose.yml
├── Dockerfile
└── postgresql.conf

---

Este repositório visa ser um recurso completo e organizado para o desenvolvimento, testes e manutenção do banco de dados do estudo de caso, fornecendo um ambiente funcional e documentado para avaliação acadêmica e prática profissional.

---
