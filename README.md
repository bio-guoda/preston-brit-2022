This experimental biodiversity datasets describes BRIT records and associated images. 


# Methods 

Preston v0.3.9 was used to index 825,877 image urls published across three BRIT related to DwC-A records using:

```bash
# lists image urls after tracking dwca archives
preston track https://sernecportal.org/portal/content/dwca/VDB_DwC-A.zip\
 https://sernecportal.org/portal/content/dwca/NLU_DwC-A.zip\
 https://portal.torcherbaria.org/portal/content/dwca/BRIT_DwC-A.zip\
 | preston dwc-stream\
 | grep URI\
 | jq --raw-output '.["http://rs.tdwg.org/ac/terms/accessURI" | "http://rs.tdwg.org/ac/terms/thumbnailAccessURI" | "http://rs.tdwg.org/ac/terms/goodQualityAccessURI"]'\
 | gzip\
 > image-urls.tsv.gz
 # list image urls and track them
 cat image-urls.tsv.gz | gunzip | xargs -L25 preston track
 ```

The tracked image urls were retrieved using a server in a data center in Germany on a ~ 1Gb connection .

```
preston history | head -n1 | preston cat | grep -o -P "2022-[0-9]{2}-[0-9]{2}T.*Z" | sort | uniq | head -n1
2022-06-06T17:02:10.924Z
```

and ended at:

```
$ preston history --data-dir $PWD | tail -n1 | preston cat --data-dir $PWD | grep -o -P "2022-[0-9]{2}-[0-9]{2}T.*Z" | sort | uniq | head -n1
2022-07-26T16:47:05.428Z
```

so took about 1 month and 20 days.

# Results

An example of a tracked image shown below was extraced using:

```
$ preston ls -l tsv\
 | grep hasVersion\
 | grep -v "well-known"\
 | tail -n1
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0452000/BRIT452101_med.jpg	http://purl.org/pav/hasVersion	hash://sha256/5807395372135bbc50350ebae598c9484cb279cc2d17b003a06626f03fb0853e	urn:uuid:6d46581e-8dfa-4c90-96d4-c06155b2b2ee
$ preston cat hash://sha256/5807395372135bbc50350ebae598c9484cb279cc2d17b003a06626f03fb0853e > BRIT452101_med.jpg
```

![BRIT452101_med.jpg](BRIT452101_med.jpg)

with caption generated using:

```
$ preston ls\
 | grep hasVersion\
 | grep zip\
 | preston dwc-stream\
 | grep BRIT452101\
 | jq .
```

```json 
{
  "http://www.w3.org/ns/prov#wasDerivedFrom": "line:zip:hash://sha256/28ebbca9c3e3d092e6193f5f54f476815f4e347ff79b1bb7de07090e78a648ea!/occurrences.csv!/L129118",
  "http://www.w3.org/1999/02/22-rdf-syntax-ns#type": "http://rs.tdwg.org/dwc/terms/Occurrence",
  "http://rs.tdwg.org/dwc/terms/coordinateUncertaintyInMeters": null,
  "http://rs.tdwg.org/dwc/terms/informationWithheld": null,
  "http://rs.tdwg.org/dwc/terms/minimumElevationInMeters": null,
  "http://rs.tdwg.org/dwc/terms/specificEpithet": "drummondii",
  "http://rs.tdwg.org/dwc/terms/individualCount": null,
  "http://rs.tdwg.org/dwc/terms/stateProvince": "Texas",
  "http://rs.tdwg.org/dwc/terms/family": "Sapindaceae",
  "http://rs.tdwg.org/dwc/terms/georeferenceSources": null,
  "http://rs.tdwg.org/dwc/terms/verbatimEventDate": null,
  "https://symbiota.org/terms/recordID": "urn:uuid:606c50c8-fccb-44a9-af1e-411766713fcf",
  "http://rs.tdwg.org/dwc/terms/dynamicProperties": null,
  "http://rs.tdwg.org/dwc/terms/locality": "Independence Creek near Pecos River. P. O. Dryden.",
  "http://rs.tdwg.org/dwc/terms/georeferencedBy": null,
  "http://rs.tdwg.org/dwc/terms/georeferenceRemarks": null,
  "http://rs.tdwg.org/dwc/terms/minimumDepthInMeters": null,
  "http://rs.tdwg.org/dwc/terms/decimalLongitude": null,
  "http://rs.tdwg.org/dwc/terms/typeStatus": null,
  "http://rs.tdwg.org/dwc/terms/year": "1963",
  "http://rs.tdwg.org/dwc/terms/endDayOfYear": null,
  "http://rs.tdwg.org/dwc/terms/maximumDepthInMeters": null,
  "http://rs.tdwg.org/dwc/terms/occurrenceRemarks": null,
  "http://rs.tdwg.org/dwc/terms/country": "United States",
  "http://rs.tdwg.org/dwc/terms/maximumElevationInMeters": null,
  "http://rs.tdwg.org/dwc/terms/occurrenceID": "606c50c8-fccb-44a9-af1e-411766713fcf",
  "https://symbiota.org/terms/recordEnteredBy": "preprocessed",
  "http://rs.tdwg.org/dwc/terms/ownerInstitutionCode": null,
  "http://purl.org/dc/terms/accessRights": null,
  "http://rs.tdwg.org/dwc/terms/collectionCode": null,
  "http://rs.tdwg.org/dwc/terms/recordedBy": "Delzie Demaree",
  "http://rs.tdwg.org/dwc/terms/lifeStage": null,
  "http://rs.tdwg.org/dwc/terms/day": "16",
  "http://rs.tdwg.org/dwc/terms/associatedSequences": null,
  "http://rs.tdwg.org/dwc/terms/verbatimDepth": null,
  "http://rs.tdwg.org/dwc/terms/identificationQualifier": null,
  "http://rs.tdwg.org/dwc/terms/order": "Sapindales",
  "http://rs.tdwg.org/dwc/terms/georeferenceVerificationStatus": null,
  "http://purl.org/dc/terms/references": "https://portal.torcherbaria.org/portal/collections/individual/index.php?occid=24923936",
  "http://rs.tdwg.org/dwc/terms/collectionID": "fea81a47-2365-45cc-bef9-b6bbff7457e6",
  "http://rs.tdwg.org/dwc/terms/geodeticDatum": null,
  "http://rs.tdwg.org/dwc/terms/reproductiveCondition": null,
  "http://rs.tdwg.org/dwc/terms/preparations": null,
  "http://rs.tdwg.org/dwc/terms/subgenus": null,
  "http://rs.tdwg.org/dwc/terms/county": "Terrell",
  "http://rs.tdwg.org/dwc/terms/kingdom": "Plantae",
  "http://rs.tdwg.org/dwc/terms/establishmentMeans": null,
  "http://purl.org/dc/terms/rightsHolder": "Botanical Research Institute of Texas",
  "http://rs.tdwg.org/dwc/terms/taxonRemarks": null,
  "http://rs.tdwg.org/dwc/terms/georeferenceProtocol": null,
  "http://rs.tdwg.org/dwc/terms/sex": null,
  "http://rs.tdwg.org/dwc/terms/otherCatalogNumbers": null,
  "http://rs.tdwg.org/dwc/terms/fieldNumber": null,
  "http://rs.tdwg.org/dwc/terms/identifiedBy": null,
  "http://rs.tdwg.org/dwc/terms/scientificName": "Sapindus drummondii",
  "http://rs.tdwg.org/dwc/terms/habitat": "Elevation ft. 1800. 12 ft. tall. Rocky bottom",
  "http://rs.tdwg.org/dwc/terms/associatedOccurrences": null,
  "http://rs.tdwg.org/dwc/terms/verbatimCoordinates": null,
  "http://rs.tdwg.org/dwc/terms/recordNumber": "48417",
  "http://purl.org/dc/terms/modified": "2020-09-25 10:38:07",
  "http://rs.tdwg.org/dwc/terms/class": null,
  "http://rs.tdwg.org/dwc/terms/verbatimTaxonRank": null,
  "http://rs.tdwg.org/dwc/terms/institutionCode": "BRIT",
  "http://rs.tdwg.org/dwc/terms/disposition": null,
  "http://rs.tdwg.org/dwc/terms/phylum": "Magnoliophyta",
  "http://rs.tdwg.org/dwc/terms/identificationRemarks": null,
  "http://rs.tdwg.org/dwc/terms/eventDate": "1963-07-16",
  "http://purl.org/dc/terms/language": null,
  "http://rs.tdwg.org/dwc/terms/month": "7",
  "http://rs.tdwg.org/dwc/terms/scientificNameAuthorship": "Hook. & Arn.",
  "http://rs.tdwg.org/dwc/terms/infraspecificEpithet": null,
  "http://rs.tdwg.org/dwc/terms/dateIdentified": null,
  "http://purl.org/dc/elements/1.1/rights": "http://creativecommons.org/licenses/by/4.0/",
  "http://rs.tdwg.org/dwc/terms/municipality": null,
  "http://rs.tdwg.org/dwc/terms/identificationReferences": null,
  "http://rs.tdwg.org/dwc/terms/genus": "Sapindus",
  "http://rs.tdwg.org/dwc/terms/basisOfRecord": "PreservedSpecimen",
  "http://rs.tdwg.org/dwc/terms/taxonID": "15950",
  "http://rs.tdwg.org/dwc/terms/locationRemarks": null,
  "http://rs.tdwg.org/dwc/terms/catalogNumber": "BRIT452101",
  "http://rs.tdwg.org/dwc/terms/verbatimElevation": null,
  "http://rs.tdwg.org/dwc/terms/higherClassification": "Plantae|Magnoliophyta|Eudicots|Core Eudicots|Malvids|Rosids|Sapindales|Sapindaceae|Sapindus",
  "http://rs.tdwg.org/dwc/terms/dataGeneralizations": null,
  "http://rs.tdwg.org/dwc/terms/eventID": null,
  "http://rs.tdwg.org/dwc/terms/taxonRank": "Species",
  "http://rs.tdwg.org/dwc/terms/startDayOfYear": "197",
  "http://rs.tdwg.org/dwc/terms/associatedTaxa": null,
  "http://rs.tdwg.org/dwc/terms/decimalLatitude": null
}
{
  "http://www.w3.org/ns/prov#wasDerivedFrom": "line:zip:hash://sha256/28ebbca9c3e3d092e6193f5f54f476815f4e347ff79b1bb7de07090e78a648ea!/multimedia.csv!/L102995",
  "http://www.w3.org/1999/02/22-rdf-syntax-ns#type": "http://rs.tdwg.org/ac/terms/Multimedia",
  "http://rs.tdwg.org/ac/terms/comments": null,
  "http://rs.tdwg.org/ac/terms/metadataLanguage": "en",
  "http://purl.org/dc/terms/identifier": "https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0452000/BRIT452101.jpg",
  "http://purl.org/dc/elements/1.1/creator": null,
  "http://ns.adobe.com/xap/1.0/MetadataDate": "2020-05-16 15:32:09",
  "http://purl.org/dc/terms/type": "StillImage",
  "http://purl.org/dc/terms/format": "image/jpeg",
  "http://rs.tdwg.org/ac/terms/caption": null,
  "http://ns.adobe.com/xap/1.0/rights/WebStatement": "http://creativecommons.org/licenses/by/4.0/",
  "http://rs.tdwg.org/ac/terms/thumbnailAccessURI": "https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0452000/BRIT452101_thumb.jpg",
  "http://rs.tdwg.org/ac/terms/subtype": "Photograph",
  "http://rs.tdwg.org/ac/terms/accessURI": "https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0452000/BRIT452101.jpg",
  "http://purl.org/dc/terms/rights": null,
  "http://ns.adobe.com/xap/1.0/rights/UsageTerms": "CC BY-NC-SA (Attribution-NonCommercial-ShareAlike)",
  "http://rs.tdwg.org/ac/terms/goodQualityAccessURI": "https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0452000/BRIT452101_med.jpg",
  "http://ns.adobe.com/xap/1.0/rights/Owner": "Botanical Research Institute of Texas",
  "http://rs.tdwg.org/ac/terms/providerManagedID": "urn:uuid:da7f9fe0-225d-409f-8243-10ca07bb3505",
  "http://rs.tdwg.org/ac/terms/associatedSpecimenReference": "https://portal.torcherbaria.org/portal/collections/individual/index.php?occid=24923936"
}
```

More concisely, this sampled BRIT image corpus can be reference using a citation signature hash://sha256/18b51a180c63929d5e3a50dbb72295579c2645546d22ae3fdcd5e2095c43d199 . 

For this corpus, the following servers were queried for reported image urls:

```
$ preston ls --data-dir $PWD  -l tsv  | grep hasVersion | sed 's+https://++g' | cut -f1 | sed 's+/.*++g' | sort | uniq -c | sort -nr
 596759 bisque.cyverse.org
 220278 web.corral.tacc.utexas.edu
   7537 api.idigbio.org
    942 portal.torcherbaria.org
    410 storage.idigbio.org
    252 sernecportal.org
     30 static.inaturalist.org
     10 urn:null
      4 inaturalist-open-data.s3.amazonaws.com
```

Preston reports non-responsive URLs as skolemized blanks see https://www.w3.org/TR/rdf11-concepts/#section-skolemization .

Using this labeling of non-responsible image URLs, the following servers produced non-responsive urls:

```
$ preston ls -l tsv\
 | grep hasVersion\
 | grep ".well-known/genid"\
 | sed 's+https://++g'\
 | cut -f1\
 | sed 's+/.*++g'\
 | sort\
 | uniq -c\
 | sort -nr
     98 web.corral.tacc.utexas.edu
     55 bisque.cyverse.org
     10 urn:null
      3 portal.torcherbaria.org
```

# Result Revisited

The following reported 156 image locations appeared to yield no content on tracking them a first time. (see also https://github.com/bio-guoda/preston-brit-2022/issues/1) 


```
https://bisque.cyverse.org/image_service/image/00-fXkw8KPeArtBjNrpPHtvTU/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-cXkjNdUW9rKCE8etGzpHtg/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-intt3JyJUMbaF3FBJZtKhc/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-d3bwMyyiXEQHApGbtd6LxF/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-aGd7xZ2uPa9Kbsfr8cEpBm/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-RjMY6zZi6s3JdapmTuuf6L/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-C4CNLCZD46aJZmcxx4rm2i/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-3TJvfeyG9D8wtKSTkZa8AG/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-F7jtcCZ9oBA3j2YnwbmKrH/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-g96HN5fQsJnEoBLbhwg8Le/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-iyKdXjKoQTgXy9iZxeEQDM/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-6GjTcou77eDxdbcixkGt9c/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-tX6XLpXivgF6t9jkesZ38F/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-CzChz3A6abzTwB9zCeRZCi/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-QoCbePYv8BYX3JbYDWavdR/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-9otLZbWx7KMYeCGqJu9Fg8/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-ie3faMpL5fmZZGmW6dfyyf?resize=1250&format=jpeg
https://bisque.cyverse.org/image_service/image/00-PSmXxi7JywuXnFbmfCAF2e?resize=1250&format=jpeg
https://bisque.cyverse.org/image_service/image/00-GYe8bJ3z7KozDsJqbzfVVZ?resize=1250&format=jpeg
https://bisque.cyverse.org/image_service/image/00-T88aXALn5zsWPhaP6DvEKd/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-gdGPD7Xmo9NoqSDKXszgN/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-N4VHTti4mToXwCcJXHHQnB/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-iX4e3CcK6qDU4npjabyE39/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-MAGixLashpnnatT3B9DDLb/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-jt29JHUMYHVZBdMwX8YEjf/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-cGNuk7rjCFQJwRwkEre4zg/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-2wXBZEQdEsFwamBV2SLfPZ/resize:1250/format:jpeg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0509000/BRIT509186_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0557000/BRIT557009_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0502000/BRIT502367_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0502000/BRIT502116_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0502000/BRIT502415_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0502000/BRIT502258_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0502000/BRIT502460_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0502000/BRIT502086_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0545000/BRIT545461_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0547000/BRIT547289_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0536000/BRIT536480_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0537000/BRIT537103_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0240000/BRIT240966_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0537000/BRIT537135_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0537000/BRIT537131_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0539000/BRIT539156_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0539000/BRIT539158_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0539000/BRIT539144_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0539000/BRIT539136_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0539000/BRIT539143_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0539000/BRIT539130_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0539000/BRIT539162_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0546000/BRIT546809_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0546000/BRIT546537_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0565000/BRIT565579_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0565000/BRIT565651_med.jpg
https://bisque.cyverse.org/image_service/image/00-NNbUnwSApdKpwV88jya73Q/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-drdU6yfV2iMHEScNCCnauC/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-JTMsT2xqjGtEkrJ2XTUnf8/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-wQhG7Kwjx7bfixi3xgnDxG/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Vg77D6CrcTp2M3bM5q2WbP/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-wmVFuTzpyNtMqiGZrbp2GZ/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-dguyqrpa3MhC4mFQAvffiE/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-K6MzoZ5CzDCjkYNrToQVCT/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-KFQVR865F2tCnmFuFE2Sfc/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-bedLvssypaWBZSXxH7xkkc/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Q8wQTFuJfBGKFXHQRjfSca/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-dDfCUqfDWiKywrvcXaEkWY/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-mDAzNumFjZw6UcTadscLNf/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-kTVY9mVbNbMmJ9m6sEa6ei/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-fzaczeURipNgfB5ATsN9jX/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Kknpm4havinGzqosXCiy84/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-bd6zjsQ5MUErQZS9M5Sr8M/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-7J9FqXFGUzAyrVZbgJJoGG/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-rB3x6s6GiQDf3zM39XWbte/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-anTuWfwkPTuFCGbS4QVpgT/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-NseahtVLc4aigczTwhpx38/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Va4gmxvFrMyhNGahaDBrze/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-bP7yMwFuoJqkHLXgVxpbm8/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Y4gyWqVBAWTjQxvijXmXxC/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-rSAJHdhtSFsM3wH7F7LTiS/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-4VwLjQD9GqzgaVWz8Xpat5/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-t3wBguEmaY3mvRn5HfRbLo/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-zEx63i64ZvuGotD3whiFfT/resize:1250/format:jpeg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0260000/BRIT260001_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0260000/BRIT260111_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0260000/BRIT260110_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0260000/BRIT260109_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0260000/BRIT260108_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0260000/BRIT260107_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0260000/BRIT260106_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0272000/BRIT272653_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0272000/BRIT272652_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0272000/BRIT272651_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0457000/BRIT457873_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0457000/BRIT457874_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0457000/BRIT457875_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0457000/BRIT457876_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0457000/BRIT457877_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0012000/BRIT12670_med.jpg
https://portal.torcherbaria.org/imglib/seinet/torch/BRIT/202006/field_madder-6270273_1593287703.jpg
https://portal.torcherbaria.org/imglib/seinet/torch/BRIT/202007/scf_35-2_1595371669.jpg
https://portal.torcherbaria.org/imglib/seinet/torch/BRIT/202010/IMG_0846_1601579155.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0343000/BRIT343474_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0343000/BRIT343219_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0358000/BRIT358998_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0358000/BRIT358991_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0358000/BRIT358637_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0358000/BRIT358557_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0358000/BRIT358556_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0489000/BRIT489405_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0351000/BRIT351906_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0351000/BRIT351963_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0347000/BRIT347280_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0347000/BRIT347294_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0372000/BRIT372847_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0346000/BRIT346910_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0346000/BRIT346902_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0346000/BRIT346907_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0346000/BRIT346903_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0344000/BRIT344266_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0347000/BRIT347292_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0347000/BRIT347279_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0372000/BRIT372885_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0372000/BRIT372772_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0346000/BRIT346937_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0346000/BRIT346911_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0346000/BRIT346906_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0347000/BRIT347281_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0372000/BRIT372770_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0391000/BRIT391295_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0390000/BRIT390870_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0391000/BRIT391244_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0391000/BRIT391432_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389066_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389274_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389480_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389281_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389260_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389290_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389471_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389472_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389469_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389098_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389272_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0389000/BRIT389099_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0407000/BRIT407915_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0408000/BRIT408124_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0383000/BRIT383196_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0383000/BRIT383179_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0383000/BRIT383091_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0383000/BRIT383083_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0383000/BRIT383133_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0488000/BRIT488593_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0383000/BRIT383136_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0488000/BRIT488574_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0383000/BRIT383135_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0368000/BRIT368409_med.jpg
https://web.corral.tacc.utexas.edu/torch/BRIT/BRIT0368000/BRIT368730_med.jpg
```

On retrying the inaccessible content locations, only 33 remained inaccessible, hinting to intermittent and permanent access issues:

```
https://bisque.cyverse.org/image_service/image/00-7J9FqXFGUzAyrVZbgJJoGG/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-anTuWfwkPTuFCGbS4QVpgT/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-bd6zjsQ5MUErQZS9M5Sr8M/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-bedLvssypaWBZSXxH7xkkc/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-bP7yMwFuoJqkHLXgVxpbm8/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-dDfCUqfDWiKywrvcXaEkWY/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-dguyqrpa3MhC4mFQAvffiE/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-drdU6yfV2iMHEScNCCnauC/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-fzaczeURipNgfB5ATsN9jX/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-gdGPD7Xmo9NoqSDKXszgN/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-iX4e3CcK6qDU4npjabyE39/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-jt29JHUMYHVZBdMwX8YEjf/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-JTMsT2xqjGtEkrJ2XTUnf8/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-K6MzoZ5CzDCjkYNrToQVCT/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-KFQVR865F2tCnmFuFE2Sfc/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Kknpm4havinGzqosXCiy84/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-kTVY9mVbNbMmJ9m6sEa6ei/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-MAGixLashpnnatT3B9DDLb/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-mDAzNumFjZw6UcTadscLNf/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-N4VHTti4mToXwCcJXHHQnB/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-NNbUnwSApdKpwV88jya73Q/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-NseahtVLc4aigczTwhpx38/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Q8wQTFuJfBGKFXHQRjfSca/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-rB3x6s6GiQDf3zM39XWbte/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Va4gmxvFrMyhNGahaDBrze/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Vg77D6CrcTp2M3bM5q2WbP/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-wmVFuTzpyNtMqiGZrbp2GZ/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-wQhG7Kwjx7bfixi3xgnDxG/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-Y4gyWqVBAWTjQxvijXmXxC/resize:1250/format:jpeg
https://bisque.cyverse.org/image_service/image/00-zEx63i64ZvuGotD3whiFfT/resize:1250/format:jpeg
https://portal.torcherbaria.org/imglib/seinet/torch/BRIT/202006/field_madder-6270273_1593287703.jpg
https://portal.torcherbaria.org/imglib/seinet/torch/BRIT/202007/scf_35-2_1595371669.jpg
https://portal.torcherbaria.org/imglib/seinet/torch/BRIT/202010/IMG_0846_1601579155.jpg
```



