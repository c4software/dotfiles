## reverse_tunnel.sh

Script permettant de créer des reverse tunnel.

### Usage

Exemple avec deux « ports » :

Port local : 22 exposé sur le 192.168.0.3:2200
Port local : 5900 exposé sur le port 192.168.0.3:5900

```
$ ./reverse_tunnel.sh -h 192.168.0.3 -p 22:2200 -p 5900
```

Tips: Le paramétre « -h » peut-être défini avec le host et le port (voir le compte) Ex: 

```
$ ./reverse_tunnel.sh -h "compte@machine -p 2222" -p…
```

## wallpaperBingOfDaysOSX.sh

Script permettant de mettre l’image actuelle de Bing en fond d’écran des écrans actif (attention ne change pas les différents spaces)

### Usage

```
$ sh ./wallpaperBingOfDaysOSX.sh
```
