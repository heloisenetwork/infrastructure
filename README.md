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


