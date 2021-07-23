# Spring Boot LRC &middot; [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](https://github.com/your/your-project/blob/master/LICENSE)

Spring Boot Live Reload Container (later only LRC) is a boilerplate project that shows you
how to use Spring Boot DevTools facilities with Docker containers.

LRC supports class file hot swapping facility as well as the remote JDB control.

## Requirements

The following dependencies need to be installed to start the project:

- Docker Engine 19.03 or later
- Java 1.8 or later
- Maven 3 or later

## Installation

This section contains important information about the installation process.

### Live Reload Configuration

1. Change the configuration in the `docker-compose.yml` file.
2. Run the sample application through:
   ```bash
   $ docker-compose up
   ```
   
   or with manual build:
   
   ```
   $ docker build -t demo-app .
   $ docker run -p <your local port>:8080 demo-app
   ```
3. Configure your IDE, add a new build target like:

   - Main Class: `org.springframework.boot.devtools.RemoteSpringApplication`
   - VM Options: `-Dspring.devtools.remote.secret=<secret from docker-compose.yml>`
   - Program Arguments: `http://localhost:<your exposed port from docker-compose.yml>/`
   
4. (Optional) Enable automatic build on file change:

   - Go to File > Preferences
   - Then go to Build, Deployment, Execution > Compiler
   - Check the option called "Build project automatically"
   
5. Run the new build target, it starts the Live Reload Agent.
6. Change something in your code, the remote JVM should reload that class file immediately.

### Remote JDB Configuration

TBD
