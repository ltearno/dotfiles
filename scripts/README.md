# Scripts divers

Quelques scripts utiles (ou pas).

Les MR ou suggestions, typoos, issues etc sont acceuillies avec grand plaisir...

**DISCLAIMER** : Utilisez ces script à vos propres risques. Lisez-les et assurez-vous qu'ils sont OK pour vous.



## Lire les logs IDP : `format-logs`

Lecture humaine des logs IDP au format JSON.

Les logs IDP sont au format JSON, légèrement indigeste pour le développement quotidien. Le script `format-logs` permet de convertir le format json en un format comprenant le timestamp, le correlation-id, le niveau de log et le message.

Il suffit de piper les logs vers ce script :

        kubectl get logs ... | format-logs





## Changer de projet GCP et se logguer sur un cluster K8S : `gcp-switch`

Syntaxe : `gcp-switch PROJECT_HINT CLUSTER_ID`

Switch rapide de projet GCP et cluster Kubernetes.

Stockez vos clés de service account dans le répertoire `~/gcp-keys`. Le mien contient les clés privées JSON des projets que j'utilise quotidiennement.

Pour passer d'un projet à l'autre il suffit de taper :

        gcp-switch int at-broker

Ceci va se connecter au projet gcp dont le fichier de clé privée contient "int" (s'il y a ambiguité le script vous le dira). Puis les credentials du cluster "at-broker" seront positionnées pour l'utilisation de `kubectl`.





## Afficher un token JWT : `jwtd`

Syntaxe : `jwtd`

Affichage des informations contenues dans les tokens JWT.

Copiez un token JWT dans le presse-papier et lancez `jwtd`. S'affichera dans la console les informations essentielles contenues dans le script.

**Pour des raisons de sécurité, il est recommandé d'utiliser ce script plutôt
que le site jwt.io, qui peut faire fuir (ou laisser fuiter) des informations confidentielles.**


```bash
> jwtd

Input token 
eyJhbGciOiJSUzI ... CoMLJRovuUOZkCg

Header
{
  "alg": "RS256",
  "typ": "JWT",
  "kid": "-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

Body
{
  "jti": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "exp": xxxxxxxxxx,
  "nbf": 0,
  "iat": xxxxxxxxxx,
  "iss": "https://authenticate-int.geoapi-airbusds.com/auth/realms/IDP",
  "aud": "DEV",
  "sub": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "typ": "Bearer",
  "azp": "DEV",
  "auth_time": 0,
  "session_state": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "acr": "1",
  "allowed-origins": [
    "*"
  ],
  "resource_access": {},
  "role": "{\"service\":[\"role\"]}",
  "suid": "012345678",
  "preferred_username": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "uuid": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "LoA": 100
}

Signature
dMAD...==

Principal informations

   UUID:          "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
   SUID:          "098765432"
   Service group: "DEV"
   Roles:         "{\"service\":[\"role\"]}"
```





## Bird's eye view des dépôt locaux : `repos-status`

Syntaxe : `repos-status`

Affiche la liste des dépôts dans le répertoire `~/repos`. Pour chacun, donne un résumé des modifications en cours. Ceci permet de s'avoir d'un coup d'oeil s'il y
a quelque part du travail non commité.






## Déployer ses environnements : `deploy`

**ATTENTION Ce script n'est peut-être pas compatible avec votre façon de travailler !**

Syntaxe : `deploy ENVIRONMENT_NAME`

Déploiement au workflow suivant :

- à chaque environnement correspond une branche git sur le dépot gitlab. La correspondance est par convention comme suit : environnement `dev`, branch `env_dev`
- le `.gitlabci` du dépôt est configuré pour ne déclencher les jobs **que** sur ces branches.
- le script appelé avec le nom de l'environnement en paramètre ajuste la branche locale à la position HEAD, et la pousse sur gitlab (le script utilise `origin`).
- ceci déclenche les jobs correspondants **précisément** au déploiement souhaité.

De cette façon, les tags, la branche master etc, tout ceci n'a plus d'impact sur la CI. Seulement ce que vous décidez avec vos branches. Un coup d'oeil rapide
de l'état de tous les déploiements est donc possible avec un simple `gitk env_dev env_int env_prod`...




## Sauvegarder ses changements : `wip`

**ATTENTION Ce script n'est peut-être pas compatible avec votre façon de travailler !**

Syntawxe : `wip MESSAGE`

Ajoute tous les changements dans la zone de staging, les commit avec le message préfixé par "wip " et pousse tout cela avec l'option `-f`.

**Refuse de s'exécuter sur la branche `master` !**