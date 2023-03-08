# Utilisation de l'image GCC 11.2 comme base pour la compilation
FROM gcc:11.2

# Configuration de la shell pour utiliser bash lors de l'exécution de commandes
SHELL ["/bin/bash", "-c"]

# Copie des fichiers sources de l'application dans le répertoire de travail
COPY . /app

# Définition du répertoire de travail pour les opérations de compilation
WORKDIR /app

# Exécution de la commande `make` pour compiler l'application
RUN make

# Nettoyage des fichiers inutiles après la compilation
RUN rm -rf Makefile
RUN rm -rf app

# Définition du binaire compilé comme entrée de l'application
CMD ["./compiled-app"]
