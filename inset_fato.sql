USE viagens_gov;

INSERT INTO fato (
  identificadordoprocessodeviagem,
  numerodaproposta,
  ano,
  cod_orgao_pag,
  cod_orgao_solic,
  id_pagam,
  valor
)

SELECT
  pagamento2324.identificadordoprocessodeviagem,
  pagamento2324.numerodaproposta,
  pagamento2324.ano,
  orgao_pagador.cod_orgao_pag,
  orgao_solicitante.cod_orgao_solic,
  pagamento.id_pagam,
  pagamento2324.valor
FROM 
  pagamento2324
left join orgao_pagador 
  ON pagamento2324.nomedoorgaopagador = orgao_pagador.nomedoorgaopagador
left join viagem2324 
  ON pagamento2324.identificadordoprocessodeviagem = viagem2324.identificadordoprocessodeviagem
left join orgao_solicitante 
  ON viagem2324.nomeorgaosolicitante = orgao_solicitante.nomeorgaosolicitante
left join pagamento 
  ON pagamento2324.tipodepagamento = pagamento.tipodepagamento;
  
  
ALTER TABLE fato
MODIFY COLUMN numerodaproposta VARCHAR(255);

