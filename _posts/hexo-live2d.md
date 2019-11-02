---
title: hexo live2d
date: 2019-04-09 22:04:57
tags: hexo
categories: linux
---
****

### 安装 hexo live2d

``` bash
npm install --save hexo-helper-live2d

npm install live2d-widget-model-koharu
```

****

### _config.yml 配置

``` bash
live2d:
  enable: true
  scriptFrom: local
  pluginRootPath: live2dw/
  pluginJsPath: lib/
  pluginModelPath: assets/
  tagMode: false
  debug: false
  model:
    use: live2d-widget-model-hibiki
  display:
    position: right
    width: 300
    height: 800
  mobile:
    show: false
```

****

### 效果

![hexo_live](/imgs/hexo_live.gif)
****
