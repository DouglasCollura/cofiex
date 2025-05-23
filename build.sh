#!/bin/bash

# Instalar Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verificar la instalación
flutter doctor

# Crear archivo .env temporal si no existe
if [ ! -f .env ]; then
    echo "Creando archivo .env temporal..."
    echo "API_URL=https://api.example.com" > .env
    echo "API_KEY=temp_key" >> .env
    echo "APP_NAME=Cofiex" >> .env
    echo "APP_ENV=production" >> .env
fi

# Obtener dependencias
flutter pub get

# Construir la aplicación web
flutter build web --release

# Verificar que la construcción fue exitosa
if [ $? -eq 0 ]; then
    echo "Build completado exitosamente"
    exit 0
else
    echo "Error en la construcción"
    exit 1
fi 