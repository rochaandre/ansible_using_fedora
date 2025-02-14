<img src="images/ansible_logo.jpg" width="800">

# ansible in Docker Deployment

This repository provides a streamlined approach to deploying ansible, the popular open-source automation server, within a Docker container.  This method simplifies ansible setup, management, and ensures consistent execution across different environments.  This README focuses specifically on the repository's GitHub-related information, including commit history, forks, and other relevant details.  For deployment and usage instructions, below.

This is a docker ansible deploy using oracle linux

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![GitHub Stars](https://img.shields.io/github/stars/rochaandre/ansible)](https://github.com/rochaandre/ansible/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/rochaandre/ansible)](https://github.com/rochaandre/ansible/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/rochaandre/ansible)](https://img.shields.io/github/issues/rochaandre/ansible/issues)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/rochaandre/ansible)](https://github.com/rochaandre/ansible/commits/main)

## Table of Contents




<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

This repository simplifies the process of deploying ansible using Docker.  While the primary goal is easy ansible deployment, this README specifically documents information about the repository itself, its commit history, how to contribute, and other GitHub-related aspects.  For instructions on *using* the Docker image, please refer to the deployment guide below.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

This project utilizes the following technologies:

*   **Python:** [![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)](https://www.python.org/)
*   **Docker:** [![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
*   **YAML:** [![YAML](https://img.shields.io/badge/YAML-CB8112?logo=yaml&logoColor=white)](https://yaml.org/)
*   **Text Files (.txt):**   "Configuration files (.txt)"


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

This section provides instructions on how to set up and run the project using Docker.

### Prerequisites

Before you begin, ensure you have the following installed on your Linux system:

*   **Docker:**  Follow the official Docker installation guide for Linux: [https://docs.docker.com/engine/install/](https://docs.docker.com/engine/install/)
    *   Specifically, choose the distribution of Linux you're using.
*   **(Optional) Docker Compose:** Docker Compose is recommended for managing multi-container applications. Install it if your project uses it: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

    *   For most Linux distributions, you can download the Docker Compose binary directly. For example:
        ```bash
        sudo curl -L "[https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname](https://www.google.com/search?q=https://github.com/docker/compose/releases/latest/download/docker-compose-%24(uname) -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
        ```

### Installation

1.  **Follow all steps:**

    ```bash

    # this script remove all container and images - USE ONLY in a LAB SYSTEM.
    docker container rm -f $(docker container ls -qa)
    docker image rm -f $(docker image ls -q)

    mkdir /docker/ansible -p
    cd /docker/ansible

    # create/copy template for Dockerfile use the file from this github
    vi Dockerfile

    # build the image locally
    docker build -t ansible_fedora -f Dockerfile .

    # Run the image as container
    docker run -d dockerfile_ansible_fedora sleep infinity
    or
    docker run -v .:/ansible -it ansible_fedora /bin/bash

    # Execute the command inside of a running container

    ```

2.  **The output will be similar:** 

    ```bash
    
    [root@srvfedoranfs ansible]#    docker build -t ansible_fedora -f Dockerfile .
    [+] Building 121.3s (12/12) FINISHED                                                                                              docker:default
    => [internal] load build definition from Dockerfile                                                                                        0.0s
    => => transferring dockerfile: 1.29kB                                                                                                      0.0s
    => [internal] load metadata for docker.io/library/fedora:41                                                                                1.1s
    => [internal] load .dockerignore                                                                                                           0.0s
    => => transferring context: 2B                                                                                                             0.0s
    => CACHED [1/7] FROM docker.io/library/fedora:41@sha256:3ec60eb34fa1a095c0c34dd37cead9fd38afb62612d43892fcf1d3425c32bc1e                   0.0s
    => [internal] load build context                                                                                                           0.0s
    => => transferring context: 33.44kB                                                                                                        0.0s
    => [2/7] RUN yum -y install gcc python3.9 &&     yum -y install python3-pip &&     yum -y install plocate &&     yum -y install openssh  115.9s
    => [3/7] RUN pip3 install ansible-core==2.18.2                                                                                             2.7s
    => [4/7] RUN updatedb                                                                                                                      0.3s 
    => [5/7] RUN mkdir /ansible &&     mkdir -p /stage/scripts &&     mkdir -p /etc/ansible &&     echo 'localhost' > /etc/ansible/hosts &&    0.1s 
    => [6/7] COPY sshUserSetup.sh /stage/scripts                                                                                               0.0s 
    => [7/7] WORKDIR /ansible                                                                                                                  0.0s 
    => exporting to image                                                                                                                      0.9s 
    => => exporting layers                                                                                                                     0.9s 
    => => writing image sha256:3fe5e9b776ff42192fb39f184fb370a66abf701014b85d97704ecf1f84293ece                                                0.0s
    => => naming to docker.io/library/ansible_fedora                                                                                           0.0s
    [root@srvfedoranfs ansible]#docker images
    REPOSITORY       TAG       IMAGE ID       CREATED          SIZE
    ansible_fedora   latest    3fe5e9b776ff   27 seconds ago   607MB


    [root@srvfedoranfs ansible]#docker ps
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
    [root@srvfedoranfs ansible]#    docker run -v .:/ansible -it ansible_fedora /bin/bash
    [root@a25e47f4962d ansible]# 
    [root@a25e47f4962d ansible]# 
    [root@a25e47f4962d ansible]# ansible -v
    usage: ansible [-h] [--version] [-v] [-b] [--become-method BECOME_METHOD] [--become-user BECOME_USER] [-K |
    ....
    Some actions do not make sense in Ad-Hoc (include, meta, etc)
    [root@a25e47f4962d ansible]# 

    ```

## Usage

This section explains how to create and run your application using Docker.


### Docker Container Creation

There are two main ways to create and run the Docker container: using a `Dockerfile` directly or using a `docker-compose.yml` file.

#### Using Dockerfile

1.  **Build the Image:**

    ```bash
    docker build -t your-image-name .  # The '.' indicates the Dockerfile is in the current directory

    # this script remove all container and images - USE ONLY in a LAB SYSTEM.
    docker container rm -f $(docker container ls -qa)
    docker image rm -f $(docker image ls -q)

    mkdir /docker/ansible -p
    cd /docker/ansible
    # create/copy template for Dockerfile use the file from this github
    vi Dockerfile

    # build the image locally
    docker build -t ansible_fedora -f Dockerfile .
    
    ```
 

2.  **Run the Container:**

    ```bash
    docker run -v .:/ansible -it ansible_fedora /bin/bash
    ```

    
    *   `-v .:/ansible`: Mounts a volume. This maps the `data` directory on your host to `current folder` inside the container.
    *   This is crucial for data persistence.  If your application doesn't need persistent storage, you can omit the `-v` flag.
  


3.  **Check process inside of a running container:**

    ```bash
    docker exec --user ansible -it ansible_fedora /bin/bash 
    ```



#### Using Docker Compose

1.  **Create `docker-compose.yml`:**  A `docker-compose.yml` file defines your application's services (containers).  Here's an example:

    ```yaml
    services:
      ansible_fedora:
        image: ansible_fedora  # Assuming the image is already built or will be pulled
        container_name: ansible_fedora_container #Optional
        volumes:
          - .:/ansible  # Mount the current directory to /ansible inside the container
        tty: true       # Allocate a pseudo-TTY, equivalent to -t
        stdin_open: true  # Keep stdin open even if not attached, equivalent to -i

        #Optional if you want to build it
        #build:
        #  context: . # location of the dockerfile

        command: /bin/bash # Optional, but good practice to be explicit for interactive shells
    ```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

2.  **Run with Docker Compose:**

    ```bash
    docker-compose up -d  # '-d' runs the container in detached mode (background)
    ```

    To stop the containers:

    ```bash
    docker-compose down
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Repository Structure

- [Introduction](#introduction)
- [Repository Structure](#repository-structure)
- [Commit History](#commit-history)
- [Forking and Contributing](#forking-and-contributing)
- [Issues and Bug Reports](#issues-and-bug-reports)
- [GitHub Actions (Optional)](#github-actions-optional)
- [License](#license)
