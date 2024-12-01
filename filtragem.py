import pandas as pd
from sklearn.model_selection import train_test_split

df = pd.read_csv('Passagems_2024.csv', encoding='latin', sep=';')

amostra = df.head(int(len(df) * 0.1))

df.to_csv('Passagem_2024.csv', sep=';', index=False, encoding='latin')