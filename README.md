# App Inspection

![Flutter Version](https://img.shields.io/badge/Flutter-3.0.0-blue)

Aplicación desarrollada en Flutter para la inspección de vehículos, facilitando la evaluación y documentación de componentes clave.

## Índice

- [Características](#características)
- [Requisitos Previos](#requisitos-previos)
- [Configuración del Entorno](#configuración-del-entorno)
- [Instalación de Flutter](#instalación)
- [Uso](#uso)
- [Estructura del Proyecto](#estructura-del-proyecto)

## Características

- **Multiplataforma**: Compatible con Android, iOS, macOS y Web.
- **Evaluación Detallada**: Permite la inspección minuciosa de componentes de vehículos.
- **Interfaz Intuitiva**: Diseñada para una experiencia de usuario óptima.

## Requisitos Previos

- [Flutter SDK 3.0.0](https://docs.flutter.dev/get-started/install)
- [Dart 2.17.0](https://dart.dev/get-dart)
- IDE compatible (recomendado: [Visual Studio Code](https://code.visualstudio.com/) o [Android Studio](https://developer.android.com/studio))

## Configuración del Entorno

Para configurar tu entorno de desarrollo con Flutter de forma sencilla, puedes seguir este video paso a paso:

📺 **Video recomendado: Instalacion de Flutter**

[![Instalación de Flutter - YouTube](https://img.youtube.com/vi/fq4N0hgOWzU/0.jpg)](https://www.youtube.com/watch?v=OIlhCrBp-uw)

> Este video te guía en la instalación del SDK de Flutter, configuración del PATH, instalación del editor (VS Code/Android Studio), y verificación con `flutter doctor`.

## Instalación del proyecto en local

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/yangeth/app_inspection.git
   ```

2. **Acceder al directorio del proyecto**:

   ```bash
   cd app_inspection
   ```

3. **Instalar dependencias**:

   ```bash
   flutter pub get
   ```

4. **Ejecutar la aplicación**:

   ```bash
   flutter run
   ```

   > También puedes especificar un dispositivo, por ejemplo:
   >
   > ```bash
   > flutter run -d chrome   # Para web
   > flutter run -d android # Para Android
   > ```

## Uso

1. **Iniciar sesión**: Accede con tus credenciales.
2. **Seleccionar vehículo**: Elige el vehículo a inspeccionar.
3. **Realizar inspección**: Completa la evaluación siguiendo las indicaciones.
4. **Generar informe**: Al finalizar, se genera un informe detallado.

## Dependencias

El proyecto utiliza las siguientes dependencias principales:

- [`flutter`](https://flutter.dev) – SDK base de Flutter.
- [`get`](https://pub.dev/packages/get) – Gestión de estado y navegación.
- [`provider`](https://pub.dev/packages/provider) – Otra opción para la gestión de estado.
- [`google_fonts`](https://pub.dev/packages/google_fonts) – Uso de fuentes personalizadas desde Google Fonts.
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) – Íconos estilo iOS.
- [`image_picker`](https://pub.dev/packages/image_picker) – Selección de imágenes desde galería o cámara.
- [`flutter_localizations`](https://docs.flutter.dev/ui/accessibility/internationalization) – Soporte para localización.
- [`intl`](https://pub.dev/packages/intl) – Internacionalización y formatos de fechas/números.
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) – Almacenamiento local de preferencias.
- [`flutter_image_compress`](https://pub.dev/packages/flutter_image_compress) – Compresión de imágenes.
- [`http`](https://pub.dev/packages/http) – Peticiones HTTP a APIs.

Dependencias de desarrollo:

- [`flutter_test`](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html) – Para pruebas unitarias.
- [`flutter_lints`](https://pub.dev/packages/flutter_lints) – Reglas de linting recomendadas por Flutter.

> Asegúrate de ejecutar `flutter pub get` después de clonar el proyecto para instalar todas estas dependencias.


## Estructura del Proyecto

```plaintext
app_inspection/
├── lib/                      # Código fuente principal
│   ├── screens/              # Pantallas de la aplicación
│   ├── widgets/              # Componentes reutilizables
│   ├── ln10/                 # Archivos para traducciones
│   ├── utils/                # Utilidades y funciones auxiliares
│   └── main.dart             # Punto de entrada de la aplicación
├── assets/                   # Recursos gráficos y otros assets
├── android/                  # Configuración específica para Android
├── ios/                      # Configuración específica para iOS
├── linux/                    # Configuración específica para Linux
├── macos/                    # Configuración específica para macOS
├── web/                      # Configuración específica para Web
└── pubspec.yaml              # Archivo de configuración de Flutter
```


