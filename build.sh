#!/bin/bash

# Instalar Flutter
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Verificar la instalación
flutter doctor

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