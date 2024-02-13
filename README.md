# Películas Flutter

Películas es una aplicación móvil para poder consular información de películas en tiempo real, teniendo la información del usuario de TMDB, últimas películas lanzadas al mercado y un mapa de Google para iOS y Android.

## Ejecución

Para ejecutar esta aplicación es necesario tener la última versión de Flutter para poder ejecutar las dependencias de Pub.dev instaladas. En la página oficial de Flutter se puede encontrar los pasos para instalar Flutter en el ordenador. Una vez instalada se tendrá que ejecutar el siguiente comando para ejecutar la aplicación.

```bash
flutter run lib/main.dart
```



## Diseño

Se buscó el diseño más amigable para los usuarios que quisieran consultar la información de su cuenta de TMDB, con una buena ubicación.

Al iniciar la aplicación de películas se mostraba una pantalla con diferentes opciones que le brindaran información importante al usuario, con un navegador inferior que presentara las 3 opciones más relevantes.

* Perfil

En esta opción se muestra la imagen personal junto con su nombre de usuario de lado derecho para que el usuario pueda identificarse como posteriormente un panel expandible en el que se le mostrara información más detallada sobre su perfil y sobre las referencias a las que está consultando el usuario.


![alt text](https://i.imgur.com/qrGghaX.png)


* Películas

En esta pestaña se muestra un listado de las últimas películas que se han estrenado, para que el usuario pueda conocer el nombre, fecha de estreno y descripción.


![alt text](https://i.imgur.com/sHDoh8U.png)

* Maps

En la tercera pantalla se presenta un mapa interactivo de Google Maps con el que se inicia su ubicación en Perisur de la Ciudad de México, y un marcador que indica la misma ubicación. El usuario puede colocarse en la ubicación que él desee como también poder navegar a través de todo el mapa disponible para Google Maps.


![alt text](https://i.imgur.com/hHy5MPB.png)

* Storage

En la cuarta pestaña se tendrá la opción de Storage para que el usuario pueda subir a la nube de Firebase Storage una imagen de su dispositivo móvil, teniendo la funcionalidad de adjuntar imagen y subir, siendo posible ver la imagen que va a subir en la aplicación móvil junto con un texto para poder descargar la imagen ya en la nube.


![alt text](https://i.imgur.com/tWPKyoE.png)

La aplicación móvil de Películas tendrá una navegación ágil con la que el usuario puede adaptarse para futuras actualizaciones.

La información fue consultada de la página TMDB con su API pública.

[The Movie DB API](https://developer.themoviedb.org/docs/getting-started)