---
title: web vscode in docker
date: 2019-11-10 22:57:42
categories: 
    - [linux]
    - [docker]
tags: 
    - [linux]
    - [docker]
---

## web vscode in docker

### dockerfile

```docker
RUN apt install make gcc g++ pkg-config -y
RUN npm install n -g && n 11
RUN npm install -g jshint
RUN apt-get install libx11-dev libxkbfile-dev -y && apt-get install libsecret-1-dev -y
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn -y
RUN apt-get update -y && apt-get upgrade -y
```

### build and run

```bash
git clone https://github.com/microsoft/vscode.git -b master
cd vscode
yarn
yarn watch
yarn web
```
