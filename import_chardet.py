import chardet

with open('C:\\Users\\Gustavo\\Downloads\\partes\\pagamento_2023.csv', 'rb') as f:
    result = chardet.detect(f.read())
    print(result)