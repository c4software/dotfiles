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

## « Forwarder » les ports < 1024

VirtualBox n’autorise pas le forward des ports < 1024, le seul moyen (autre que de faire tourner virtualBox en root) est de jouer avec
les iptables. Exemple avec le port 25 :

```
# Mapper le port 25 de la VM sur par exemple le port 2525
VBoxManage modifyvm xpenology --natpf1 "mailserver,tcp,,2525,,25"

# Forwarder les paquets arrivant sur le port 25 vers le port 2525 (donc la VM)
iptables -A PREROUTING -t nat -p tcp --dport 25 -j REDIRECT --to-port 2525
```

## Connexion au port série

```
socat - UNIX-CONNECT:/tmp/xpenology
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

⚠️  Attention c’est un arrêt brutal de la machine.
