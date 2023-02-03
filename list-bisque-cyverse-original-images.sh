#!/bin/bash
#
# extracts URLs to original specimen images as available through bisque.cyverse
#

preston ls\
| preston dwc-stream\
| grep URI\
| jq --raw-output '.["http://rs.tdwg.org/ac/terms/accessURI"], .["http://rs.tdwg.org/ac/terms/thumbnailAccessURI"], .["http://rs.tdwg.org/ac/terms/goodQualityAccessURI"]'\
| grep -v null\
| grep cyverse\
| grep -oP "https://bisque.cyverse.org/image_service/image/[^/]+"
