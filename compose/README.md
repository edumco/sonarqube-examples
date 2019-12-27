# SonarQube Server installed with Docker Compose

## How to use

If you already uses docker on you machine you can use the command:

```bash
docker-compose up -d
```

This will create a new service using the [Long Term Support](https://en.wikipedia.org/wiki/Long-term_support) version of SonarQube the will be available on port 9000 by default (this can be changed later)

On your browser acess <http://localhost:9000>

Otherwise you can execute the install-docker-and-sonar.sh file.

## 🔥🔥🔥 Houston, we have a problem 🔥🔥🔥

You may encon=============================== warnings summary ===============================
/usr/local/lib/python3.7/site-packages/_pytest/junitxml.py:436
  /usr/local/lib/python3.7/site-packages/_pytest/junitxml.py:436: PytestDeprecationWarning: The 'junit_family' default value will change to 'xunit2' in pytest 6.0.
  Add 'junit_family=legacy' to your pytest.ini file to silence this warning and make your suite compatible.
    _issue_warning_captured(deprecated.JUNIT_XML_DEFAULT_FAMILY, config.hook, 2)

-- Docs: https://docs.pytest.org/en/latest/warnings.html
-------------------- generated xml file: /reports/unit.xml ---------------------
============================== 1 warning in 0.01s ==============================
The command '/bin/sh -c pytest --junit-xml=/reports/unit.xml' returned a non-zero code: 5ter some issues on the first run, they are related to the use of [Elasticsearch](https://www.elastic.co/pt/products/elasticsearch) wich is a powerful search system that is used inside SonarQube.

Elasticsearch is a superfast and iteligent search that uses a lot of virtual memory but linux prevents a process from use too much of it and doing so prevents elasticsearch to initiate.

The work around is to increase the limit by channging the default value

```sh
echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
```

This work around is already in the script in this folder

To learn more=============================== warnings summary ===============================
/usr/local/lib/python3.7/site-packages/_pytest/junitxml.py:436
  /usr/local/lib/python3.7/site-packages/_pytest/junitxml.py:436: PytestDeprecationWarning: The 'junit_family' default value will change to 'xunit2' in pytest 6.0.
  Add 'junit_family=legacy' to your pytest.ini file to silence this warning and make your suite compatible.
    _issue_warning_captured(deprecated.JUNIT_XML_DEFAULT_FAMILY, config.hook, 2)

-- Docs: https://docs.pytest.org/en/latest/warnings.html
-------------------- generated xml file: /reports/unit.xml ---------------------
============================== 1 warning in 0.01s ==============================
The command '/bin/sh -c pytest --junit-xml=/reports/unit.xml' returned a non-zero code: 5 about it visit [https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)

## Compose file details

This compose defines two services: a sonarqube and a postgres service, both services run as a single instance.

I'ts aways recommended use a LTS (Long Term Support) for every software or the latest stable version

## Scale up

To scale vertically (make the instance faster) You should consider using a local instance with lots of RAM and super fast ssd's. But this will be too complicated and expensive so I believe the best strategie would use the cloud with a medium power server (two or four v-cores, 16GB ram and 80GB ssd its a good start number) and scale horizontally.

To scale horizontally (divide the job in multiple instances) you have to create an instance that groups only a few projects. Try to group the repositories that interact with each other like the back-end and its clients and try to limit by the max number of people working on the project at the same time (20 simultanious devs its a safe number).
