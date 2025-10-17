CREATE TABLE IF NOT EXISTS `alunos_rfid` (
    `id_aluno_rfid` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `id_aluno` INT UNSIGNED NOT NULL,
    `rfid` VARCHAR(64) NOT NULL,
    `ativo` TINYINT(1) NOT NULL DEFAULT 1, -- 1 = ativo, 0 = inativo
    `data_associacao` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `observacao` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id_aluno_rfid`),
    UNIQUE KEY `uk_alunos_rfid_rfid` (`rfid`),
    KEY `idx_alunos_rfid_aluno` (`id_aluno`),
    CONSTRAINT `fk_alunos_rfid_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;