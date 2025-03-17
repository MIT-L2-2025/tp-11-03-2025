# City Image & Distance Generator

Un ensemble de scripts pour :
1. Récupérer des images de villes depuis Wikipédia
2. Calculer leur distance à Lyon
3. Générer des images composites avec les informations de distance
4. Voir la latitude et la longitude d'une ville
5. Obténir un lien vers OpenStreetMap

##  Fonctionnalités

- **Récupération d'images** depuis l'API Wikimedia
- Calcul précis de **distance géographique**
- Génération d'images **annotées automatiquement**
- Génération de lien d'une image et lien vers OpenStreetMap

##  Installation

### Prérequis
```bash
# Sur Ubuntu/Debian
sudo apt-get install -y curl jq python3 imagemagick
```

### Utilisation
**Pour obténir le lien et télécharger l'image:**
```bash
./image.sh <nom-ville>
```
**Pour déterminer la distance entre une ville et Lyon:**
```bash
./distance.sh <nom-ville>
```
**Pour obténir une image avec déscription:**
```bash
./descr.sh <nom-ville>
```
**Pour le city.sh:**
Il y a une manuelle dedans.
