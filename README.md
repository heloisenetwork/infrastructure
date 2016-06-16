# Docker infrastructure for Heloise Workshop Platform
This repository contains basic infrastructure tools e.g. docker-files for heloise network.

* VocTo - RDF-Vocabulary Editor
* OntoWiki - RDF-Editor -> Port: 8080
* Virtuoso - Triple Store -> Port: 8081
* Etherpad - Collaborative Texteditor -> Port: 8082
* project-crawler - Simple RESTful API to crawl Projectpartner --> Port: 8666
* elasticsearch - searchengine to store crawled data --> Port: 9200
* project-display - Simple interface to show crawled data --> Port: 8087

## Build

```
docker-compose -f docker-compose-heloise.yml build
```

## Run

```
docker-compose -f docker-compose-heloise.yml run
```

## Tools

### Elasticsearch

The elasticsearch directory is copied from the original elastic-search Docker repo which can be found at [github](https://github.com/docker-library/elasticsearch/tree/8a74bd1f706af238e2cb9d8063d5067338e5d388)
The version is 2.2. Modifications have not been made yet.
Elasticsearch is added to docker-compose-heloise.yml and can be build and run with it.
The only configuration is to allow x-origin request to be used by the other tools.

### Project-Crawler

The Docker-Compose file is set up to provide the RESTful API but not start any crawling process so far.
With the defaultconfiguration you can start the crawlingprocess by visiting the URL

1. http://localhost:8666/cpl/index
2. http://localhost:8666/cpl/details

To make sure the crawlingprocess runs you can only visit the elasticsearch-head plugin 

	elasticsearch:9200/plugins_/head

or the project-display.

You can configure several URLs like the nedded URLs of the Heloise Projectpartner or the URL to an running and accessable elasticsearch instance under

	config/project-crawler

Since the code has to be compiled again you need to restart the container after it is changed.

### Project-Display

The tool is called Abaelardus. It is an simple Web-Frontend to show the data of the running elasticsearch instance.
Furthermore it is able to consume the RESTful API of the Project-Crawler.
Therefore you have to visit the url

	project-display/crawl.html

You can configure the url to the project-crawler under

	config/project-display


To just test the project-display just run

	docker-compose -f docker-compose-heloise.yml run --build project-display


