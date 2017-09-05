# vector2json
# Inputs
#   args1 - a shape file
#   args2, args3 - a property key, value pair to search for
#   args4 - a friendly name to save in the ouputting file nam
#
#  Usage, from the shell, load the functions in this shell library
#    bash> . ./FS-vector2json.sh
#    bash> vector2json esri-shapefile.shp KEY VALUE friendly_name
#
#  Example
#    bash> wget -N http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_06_tract_500k.zip
#    bash> unzip -o cb_2014_06_tract_500k.zip
#    bash> vector2json cb_2014_06_tract_500k.shp STATEFP 06 California
#
# dependencies
#   https://www.npmjs.com/package/shapefile
#   https://github.com/mbostock/ndjson-cli
#   https://www.npmjs.com/package/ndjson-cli
#   https://www.npmjs.com/package/geojson-precision

function vector2json() {

  # args
  file=$1
  property_key=$2
  property_value=$3
  friendly_name=$4

  filter="'d.properties.${property_key} === \"${property_value}\"'"
  geojson="'{type: \"FeatureCollection\", features: d}'"

  cmd="shp2json -n ${file} | ndjson-filter ${filter} | ndjson-reduce | ndjson-map ${geojson} > tmp.geojson"

  # Print out the command, then execute it
  echo $cmd
  sh -c "${cmd}"

  # reduce the number of data points
  geojson-precision tmp.geojson $property_key.$property_value.$friendly_name.geojson
  rm tmp.geojson

}
