#!/bin/bash
#
# extracts URLs to original specimen images as available through bisque.cyverse
#

preston ls\
| preston dwc-stream\
| grep URI\
| jq --raw-output '.["http://rs.tdwg.org/ac/terms/accessURI"], .["http://rs.tdwg.org/ac/terms/thumbnailAccessURI"], .["http://rs.tdwg.org/ac/terms/goodQualityAccessURI"]'\
| grep -v null\
| grep bisque\
| grep cyverse\
| grep -oP "00-[a-zA-Z0-9]+"\
| sed 's+^+https://bisque.cyverse.org/blob_service/+g'
