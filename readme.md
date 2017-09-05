# Vector data from USFS FSGeodata

Using `command line cartography` to process US Forest Service trails data.

### Vector Data

```{bash}

# Trails
wget -N https://data.fs.usda.gov/geodata/edw/edw_resources/shp/S_USA.TrailNFS_Publish.zip
unzip -o S_USA.TrailNFS_Publish.zip

# Wilderness
#wget -N https://data.fs.usda.gov/geodata/edw/edw_resources/shp/S_USA.Wilderness.zip
wget -N  https://data.fs.usda.gov/geodata/edw/edw_resources/shp/S_USA.WildernessStatus.zip
unzip -o S_USA.WildernessStatus.zip

# Ranger Districts
wget -N https://data.fs.usda.gov/geodata/edw/edw_resources/shp/S_USA.RangerDistrict.zip
unzip -o S_USA.RangerDistrict.zip

# Administrative Forest Boundaries
wget -N https://data.fs.usda.gov/geodata/edw/edw_resources/shp/S_USA.AdministrativeForest.zip
unzip -o S_USA.AdministrativeForest.zip
```

### Example

```{bash}
# load library
. ./FS-vector2json.sh

# generate geojson for the Boundary Waters Canoe Area Wilderness
vector2json S_USA.WildernessStatus.shp WILDERNESS 1241408010843 BWCAW


# Green Mountains
vector2json S_USA.WildernessStatus.shp WILDERNESS 1178459010843 BRISTOL-CLIFFS-WILDERNESS
```
