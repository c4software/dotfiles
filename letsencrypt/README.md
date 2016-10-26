### Pré-requis

- Certificat(s) déjà installé(s). (Renouvellement uniquement donc)
- Le client letsencrypt installé dans le dossier ```letsencrypt/```

#### Vhost NGINX

Ajouter la configuration suivante au block ```server``` des domaines à valider.

```
location '/.well-known/acme-challenge' {
  default_type "text/plain";
  root    /tmp/letsencrypt-auto;
}
```

### Crontab

```
00      02      *       *       *       /home/vbrosseau/testRenew.sh
```
