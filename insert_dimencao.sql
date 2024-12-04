-- Inserir na tabela de dimensão orgao_pagador
INSERT IGNORE INTO orgao_pagador (nome_do_orgao_pagador)
SELECT DISTINCT nome_do_orgao_pagador
FROM pagamento2324;

-- Inserir na tabela de dimensão orgao_solicitante
INSERT IGNORE INTO orgao_solicitante (nome_orgao_solicitante)
SELECT DISTINCT nome_orgao_solicitante
FROM viagem2324;

-- Inserir na tabela de dimensão pagamento
INSERT IGNORE INTO pagamento (tipo_de_pagamento)
SELECT DISTINCT tipo_de_pagamento
FROM pagamento2324;

