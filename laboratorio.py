import pandas as pd
from datetime import datetime

df = pd.read_csv('2024\\2024_Trecho.csv', encoding='latin', sep=';')

#df['Data da emissão/compra'] = pd.to_datetime(df['Data da emissão/compra'], format='%d/%m/%Y')
df['Identificador do processo de viagem'] = pd.to_numeric(df['Identificador do processo de viagem'], errors='coerce')
df = df.dropna(subset=['Identificador do processo de viagem'])

# Corrigindo a comparação
filtered_df = df[(df['Identificador do processo de viagem'] >= 19407618 ) & (df['Identificador do processo de viagem'] <= 20107067)]

print(filtered_df)

filtered_df.to_csv('trecho_2024_2.csv', sep=';', index=False, encoding='latin')
