import pandas as pd
from io import StringIO

# Generar datos ficticios para el archivo de mantenimiento
data = """
Fecha,Mantenimiento
2020-01-01,100
2020-02-01,120
2020-03-01,130
2020-04-01,150
2020-05-01,160
2020-06-01,170
2020-07-01,180
2020-08-01,190
2020-09-01,200
2020-10-01,210
2020-11-01,220
2020-12-01,230
2021-01-01,240
2021-02-01,250
2021-03-01,260
2021-04-01,270
2021-05-01,280
2021-06-01,290
2021-07-01,300
2021-08-01,310
2021-09-01,320
2021-10-01,330
2021-11-01,340
2021-12-01,350
"""

# Leer los datos en un DataFrame
df = pd.read_csv(StringIO(data))

# Guardar el DataFrame como un archivo CSV
csv_path = "/mnt/data/mantenimiento.csv"
df.to_csv(csv_path, index=False)

csv_path

# OpenAI (2024). ChatGPT (Ver. 11 Jul.) [Analizar y predecir mantenimiento industrial].
# https://chatgpt.com/share/dd88b7ff-4755-4116-9de4-e0ed11e7d319


