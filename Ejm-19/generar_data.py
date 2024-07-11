import pandas as pd
import numpy as np

# Crear un DataFrame de ejemplo con datos ficticios sobre el mantenimiento de un reactor nuclear
data = {
    'Fecha': pd.date_range(start='2023-01-01', periods=100, freq='W'),
    'Temperatura_Reactor': np.random.normal(loc=300, scale=10, size=100),
    'Presion_Reactor': np.random.normal(loc=150, scale=5, size=100),
    'Nivel_Coolant': np.random.normal(loc=50, scale=5, size=100),
    'Falla': np.random.choice([0, 1], size=100, p=[0.9, 0.1]),
    'Duracion_Mantenimiento': np.random.normal(loc=5, scale=1, size=100),
    'Costo_Mantenimiento': np.random.normal(loc=10000, scale=2000, size=100)
}

# Convertir el diccionario en un DataFrame
df = pd.DataFrame(data)

# Guardar el DataFrame como un archivo CSV
file_path = 'reactor_mantenimiento.csv'
df.to_csv(file_path, index=False)

file_path

