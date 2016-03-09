# Docker infrastructure for Heloise Workshop Plattform
This repsotory contains basic infrastructure tools e.g. docker-files for heloisenetwork.

* VocTo - RDF-Vokabulareditor
* OntoWiki - RDF-Editor -> Port: 8080
* Virtuoso - Triple Store -> Port: 8081

## Build

```
docker-compose -f docker-compose-heloise.yml build
```

## Run

```
docker-compose -f docker-compose-heloise.yml run
```


