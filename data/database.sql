-- =========================
-- Banco: Bypass (MySQL)
-- UTF8MB4 / InnoDB
-- Versão de testes (senhas em texto simples)
-- =========================

CREATE DATABASE IF NOT EXISTS `Bypass` CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';

USE `Bypass`;

-- -------------------------
-- Tabela: responsaveis
-- -------------------------
CREATE TABLE IF NOT EXISTS `responsaveis` (
    `id_responsavel` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(180) NOT NULL,
    `telefone` VARCHAR(40),
    `email` VARCHAR(200),
    `cpf` VARCHAR(11) DEFAULT NULL,
    PRIMARY KEY (`id_responsavel`),
    UNIQUE KEY `uk_responsaveis_email` (`email`),
    UNIQUE KEY `uk_responsaveis_cpf` (`cpf`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: alunos
-- -------------------------
CREATE TABLE IF NOT EXISTS `alunos` (
    `id_aluno` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(180) NOT NULL,
    `matricula` VARCHAR(60) NOT NULL,
    `data_nascimento` DATE,
    `serie` VARCHAR(60),
    `turma` VARCHAR(60),
    `id_responsavel` INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (`id_aluno`),
    UNIQUE KEY `uk_alunos_matricula` (`matricula`),
    KEY `fk_alunos_responsavel_idx` (`id_responsavel`),
    CONSTRAINT `fk_alunos_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `responsaveis` (`id_responsavel`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: projetos
-- -------------------------
CREATE TABLE IF NOT EXISTS `projetos` (
    `id_projeto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(180) NOT NULL,
    `descricao` TEXT,
    `horario_inicio` TIME,
    `horario_fim` TIME,
    `local` VARCHAR(180),
    PRIMARY KEY (`id_projeto`),
    KEY `idx_projetos_nome` (`nome`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: alunos_projetos (N:N)
-- -------------------------
CREATE TABLE IF NOT EXISTS `alunos_projetos` (
    `id_aluno_projeto` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_aluno` INT UNSIGNED NOT NULL,
    `id_projeto` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id_aluno_projeto`),
    KEY `fk_ap_aluno_idx` (`id_aluno`),
    KEY `fk_ap_projeto_idx` (`id_projeto`),
    CONSTRAINT `fk_ap_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_ap_projeto` FOREIGN KEY (`id_projeto`) REFERENCES `projetos` (`id_projeto`) ON DELETE CASCADE ON UPDATE CASCADE,
    UNIQUE KEY `uk_aluno_projeto` (`id_aluno`, `id_projeto`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: logs_acesso
-- -------------------------
CREATE TABLE IF NOT EXISTS `logs_acesso` (
    `id_log` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_aluno` INT UNSIGNED NOT NULL,
    `data_hora` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `tipo_acesso` ENUM('entrada', 'saida') NOT NULL,
    `data_hora_entrada` DATETIME NULL,
    `data_hora_saida` DATETIME NULL,
    `local` VARCHAR(180),
    `id_projeto` INT UNSIGNED NULL,
    `status` VARCHAR(60) DEFAULT 'ok',
    PRIMARY KEY (`id_log`),
    KEY `fk_logs_aluno_idx` (`id_aluno`),
    KEY `fk_logs_projeto_idx` (`id_projeto`),
    KEY `idx_logs_data_tipo` (`data_hora`, `tipo_acesso`),
    CONSTRAINT `fk_logs_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_logs_projeto` FOREIGN KEY (`id_projeto`) REFERENCES `projetos` (`id_projeto`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: notificacoes
-- -------------------------
CREATE TABLE IF NOT EXISTS `notificacoes` (
    `id_notificacao` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_aluno` INT UNSIGNED DEFAULT NULL,
    `id_responsavel` INT UNSIGNED DEFAULT NULL,
    `id_log` BIGINT UNSIGNED DEFAULT NULL,
    `tipo` ENUM('entrada', 'saida', 'alerta') NOT NULL,
    `status_envio` ENUM('pendente', 'enviado', 'erro') DEFAULT 'pendente',
    `data_envio` DATETIME DEFAULT NULL,
    `conteudo` TEXT,
    PRIMARY KEY (`id_notificacao`),
    KEY `fk_notif_aluno_idx` (`id_aluno`),
    KEY `fk_notif_responsavel_idx` (`id_responsavel`),
    KEY `fk_notif_log_idx` (`id_log`),
    CONSTRAINT `fk_notif_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_notif_responsavel` FOREIGN KEY (`id_responsavel`) REFERENCES `responsaveis` (`id_responsavel`) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_notif_log` FOREIGN KEY (`id_log`) REFERENCES `logs_acesso` (`id_log`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: usuarios_sistema (simples, senha em texto por enquanto)
-- -------------------------
CREATE TABLE IF NOT EXISTS `usuarios_sistema` (
    `id_usuario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(180) NOT NULL,
    `email` VARCHAR(200) NOT NULL,
    `cpf` VARCHAR(11) DEFAULT NULL,
    `senha` VARCHAR(255) NOT NULL, -- senha em texto simples (apenas para testes)
    `tipo_usuario` ENUM(
        'admin',
        'porteiro',
        'professor'
    ) NOT NULL DEFAULT 'porteiro',
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id_usuario`),
    UNIQUE KEY `uk_usuarios_email` (`email`),
    UNIQUE KEY `uk_usuarios_cpf` (`cpf`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: turmas
-- -------------------------
CREATE TABLE IF NOT EXISTS `turmas` (
    `id_turma` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(80) NOT NULL, -- Ex: "3º TDS - Manhã"
    `turno` ENUM('manha', 'tarde', 'noite') NOT NULL,
    `ano_letivo` YEAR NOT NULL,
    `id_professor` INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (`id_turma`),
    CONSTRAINT `fk_turma_professor` FOREIGN KEY (`id_professor`) REFERENCES `usuarios_sistema` (`id_usuario`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: alunos_turmas (ligação aluno <-> turma)
-- -------------------------
CREATE TABLE IF NOT EXISTS `alunos_turmas` (
    `id_aluno_turma` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_aluno` INT UNSIGNED NOT NULL,
    `id_turma` INT UNSIGNED NOT NULL,
    `data_inicio` DATE DEFAULT CURRENT_DATE,
    `data_fim` DATE DEFAULT NULL,
    PRIMARY KEY (`id_aluno_turma`),
    UNIQUE KEY `uk_aluno_turma` (`id_aluno`, `id_turma`),
    CONSTRAINT `fk_at_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_at_turma` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- Tabela: horarios_turmas
-- -------------------------
CREATE TABLE IF NOT EXISTS `horarios_turmas` (
    `id_horario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_turma` INT UNSIGNED NOT NULL,
    `dia_semana` ENUM(
        'segunda',
        'terca',
        'quarta',
        'quinta',
        'sexta',
        'sabado'
    ) NOT NULL,
    `hora_inicio` TIME NOT NULL,
    `hora_fim` TIME NOT NULL,
    `materia` VARCHAR(100),
    PRIMARY KEY (`id_horario`),
    CONSTRAINT `fk_ht_turma` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- -------------------------
-- View: últimos logs por aluno (útil pra relatórios)
-- -------------------------
CREATE OR REPLACE VIEW `vw_ultimos_logs_aluno` AS
SELECT
    l.id_aluno,
    a.nome AS nome_aluno,
    l.id_log,
    l.data_hora,
    l.tipo_acesso,
    l.local,
    p.nome AS nome_projeto
FROM
    logs_acesso l
    JOIN alunos a ON a.id_aluno = l.id_aluno
    LEFT JOIN projetos p ON p.id_projeto = l.id_projeto
ORDER BY l.id_aluno, l.data_hora DESC;

-- -------------------------
-- Inserção: primeiro administrador (CPF e senha em texto simples)
-- -------------------------
INSERT INTO
    `usuarios_sistema` (
        `nome`,
        `email`,
        `cpf`,
        `senha`,
        `tipo_usuario`
    )
VALUES (
        'Administrador Geral',
        'admin@bypass.com',
        '11122233344', -- CPF (11 dígitos, sem pontuação)
        'admin123', -- senha em texto (APENAS PARA TESTES LOCAIS)
        'admin'
    );

-- =========================
-- FIM DO SCRIPT
-- =========================