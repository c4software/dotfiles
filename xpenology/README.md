# Script création VM pour xpenology

Script qui initialise une VM pour pouvoir installer xpenology (Version 6.0.2 ou plus en fonction du loader)

- Requiert le Loader (http://xpenology.com/forum/viewtopic.php?f=2&t=20216)
- Dans l’archive du loader extraire les fichiers synoboot.vmdk et synoboot.img à coté du init.sh
- Lancer le init.sh
- ouvrir le http://locahost:5000
- Continuer avec le bon PAT (pour le modèle DS3615xs)

```
sudo apt install virtualbox
$ sh init.sh
```

## Démarrer la VM

```
VBoxManage startvm "xpenology" --type headless
```

⚠️  Attention, le premier boot peut être un peu long avant que le port 5000 soit accessible.

## Arrêter la VM

```
vboxmanage controlvm xpenology poweroff
```
