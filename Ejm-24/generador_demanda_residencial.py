# python  generador_demanda_residencial.py  # En windows
# python3 generador_demanda_residencial.py  # En Linux

import pandas as pd
import numpy as np

# Generar datos para 5000 días
num_days = 5000
date_range = pd.date_range(start="2010-01-01", periods=num_days, freq='D')

# Generar datos ficticios con variaciones
np.random.seed(0)  # Para reproducibilidad
consumo = np.random.normal(loc=200, scale=50, size=num_days).clip(min=0)  # Consumo en kWh
precio = np.random.normal(loc=0.15, scale=0.05, size=num_days).clip(min=0.05)  # Precio en $/kWh
temperatura = np.random.normal(loc=20, scale=10, size=num_days)  # Temperatura en °C

# Crear un DataFrame
data = {
    "Fecha": date_range,
    "Consumo": consumo,
    "Precio": precio,
    "Temperatura": temperatura
}

df = pd.DataFrame(data)

# Guardar el DataFrame en un archivo .csv
csv_path = "demanda_residencial.csv"
df.to_csv(csv_path, index=False)
csv_path

# REFERENCIA
# OpenAI(2024). ChatGPT (Ver 20 Jul)[Demanda Residencial en R]. 
# https://chatgpt.com/share/a95f2051-3431-4d59-bd9f-5c029ba51df0

