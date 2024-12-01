import pandas as pd
from sqlalchemy import create_engine
import pymysql

# Configuração do banco de dados
db_user = 'root'
db_password = 'Brasileiro2008'
db_host = 'localhost'
db_name = 'viagens_gov'

# Caminho do arquivo CSV
csv_file = 'C:\\Users\\Gustavo\\Downloads\\partes\\passagem2324.csv'

# Criar conexão com o banco de dados
engine = create_engine(f'mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}')

# Extrair os dados do CSV
try:
    df = pd.read_csv(csv_file, sep=';', encoding='ISO-8859-1')  # Atualize o encoding conforme necessário
    print("Arquivo CSV carregado com sucesso!")
except Exception as e:
    print(f"Erro ao carregar o arquivo CSV: {e}")
    exit()

# Exemplo: Renomear colunas para correspondência com a tabela SQL
df.columns = [
    'id',
    'identificadordoprocessodeviagem',
    'numerodaproposta',
    'valordapassagem',
    'Data_da_emissao_compra'
    
]

# Carregar os dados no banco de dados
try:
    df.to_sql('passagem2324', con=engine, if_exists='append', index=False)
    print("Dados inseridos com sucesso!")
except Exception as e:
    print(f"Erro ao inserir os dados: {e}")

# Criar chave primária na tabela
try:
    # Conexão direta com o banco para executar SQL
    connection = pymysql.connect(
        host=db_host,
        user=db_user,
        password=db_password,
        database=db_name
    )
    with connection.cursor() as cursor:
        # Comando para definir a chave primária composta
        cursor.execute("""
            ALTER TABLE passagem2324
            ADD CONSTRAINT PK_viagem PRIMARY KEY (`id`);
        """)
        connection.commit()
    print("Chave primária criada com sucesso!")
except Exception as e:
    print(f"Erro ao criar a chave primária: {e}")
finally:
    if connection:
        connection.close()
