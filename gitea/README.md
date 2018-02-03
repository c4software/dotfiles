# Gitea Synology

Script de démarrage pour Gitea sur mon Nas Synology. Le paquet ne fonctionne pas correctement chez moi… J’ai donc fait un « petit script de démarrage » pour qu’il soit lancer au démarrage du système.

Pour l’installer copier le fichier ```startup_gitea.sh``` dans ```/usr/local/etc/rc.d/```:

```sh
cp startup_gitea.sh /usr/local/etc/rc.d/
chmod 755 /usr/local/etc/rc.d/startup_gitea.sh
```