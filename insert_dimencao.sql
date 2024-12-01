-- Inserir na tabela de dimensão orgao_pagador
INSERT IGNORE INTO orgao_pagador (nomedoorgaopagador)
SELECT DISTINCT nomedoorgaopagador
FROM pagamento2324;

-- Inserir na tabela de dimensão orgao_solicitante
INSERT IGNORE INTO orgao_solicitante (nomeorgaosolicitante)
SELECT DISTINCT nomeorgaosolicitante
FROM viagem2324;

-- Inserir na tabela de dimensão pagamento
INSERT IGNORE INTO pagamento (tipodepagamento)
SELECT DISTINCT tipodepagamento
FROM pagamento2324;

