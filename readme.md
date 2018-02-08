
# How to Process Shapefiles

Using `command line cartography` to process US Forest Service trails data.  Use either of these FOSS4G tools.

* [`ogr2ogr`](http://www.gdal.org/ogr2ogr.html)
* [`shp2json geocode.shp`](https://github.com/mbostock/shapefile) — `npm install --global shapefile`
  * `shp2json example.shp`


## Vector data from USGS

* Navigate to [The National Map](https://viewer.nationalmap.gov/basic/) and enable "US Topo" & "Topo Map Data and Topo Stylesheet"

### Contour
```{bash}

# Contour
wget -N https://prd-tnm.s3.amazonaws.com/StagedProducts/TopoMapVector/AZ/Shape/VECTOR_Kendrick_Peak_AZ_7_5_Min_Shape.zip
unzip VECTOR_Kendrick_Peak_AZ_7_5_Min_Shape.zip
```

## Vector data from USFS

* Navigate to  [FSGeodata](https://data.fs.usda.gov/geodata/vector/index.php).

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
