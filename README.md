# Docker infrastructure for Heloise Workshop Platform
This repository contains basic infrastructure tools e.g. docker-files for heloise network.

* VocTo - RDF-Vocabulary Editor
* OntoWiki - RDF-Editor -> Port: 8080
* Virtuoso - Triple Store -> Port: 8081
* Etherpad - Collaborative Texteditor -> Port: 8082

## Build

```
docker-compose -f docker-compose-heloise.yml build
```

## Run

```
docker-compose -f docker-compose-heloise.yml run
```

### Elastucsearch ### 

The elasticsearch directory is copied from the original elastic-search Docker repo which can be found at ![github](https://github.com/docker-library/elasticsearch/tree/8a74bd1f706af238e2cb9d8063d5067338e5d388)
The version is 2.2. Modifications have not been made yet. 
