USE gov_viagens;

INSERT INTO fato (
  identificador_do_processo_de_viagem,
  numero_da_proposta,
  ano,
  cod_orgao_pag,
  cod_orgao_solic,
  id_pagam,
  valor
)

SELECT
  pagamento2324.identificador_do_processo_de_viagem,
  pagamento2324.numero_da_proposta,
  pagamento2324.ano,
  orgao_pagador.cod_orgao_pag,
  orgao_solicitante.cod_orgao_solic,
  pagamento.id_pagam,
  pagamento2324.valor
FROM 
  pagamento2324
left join orgao_pagador 
  ON pagamento2324.nome_do_orgao_pagador = orgao_pagador.nome_do_orgao_pagador
left join viagem2324 
  ON pagamento2324.identificador_do_processo_de_viagem = viagem2324.identificador_do_processo_de_viagem
left join orgao_solicitante 
  ON viagem2324.nome_orgao_solicitante = orgao_solicitante.nome_orgao_solicitante
left join pagamento 
  ON pagamento2324.tipo_de_pagamento = pagamento.tipo_de_pagamento;
  
ALTER TABLE fato
MODIFY COLUMN numero_da_proposta VARCHAR(255);
  
