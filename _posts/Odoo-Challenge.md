---
title: Odoo Challenge
date: 2019-09-26 09:08:37
categories: odoo
tags: odoo
---

## Odoo Challenge

### Odoo Challenge level 1

![level 1](/imgs/odoo-challenge/odoo-challenge-1.png)

### Odoo Challenge level 2

![level 2](/imgs/odoo-challenge/odoo-challenge-2.png)

### Odoo Challenge level 3

![level 3](/imgs/odoo-challenge/odoo-challenge-3.png)

### Odoo Challenge level 4

![level 4](/imgs/odoo-challenge/odoo-challenge-4.png)

### Odoo Challenge level 5

![level 5](/imgs/odoo-challenge/odoo-challenge-5.png)

### Odoo Challenge level 6

![level 6](/imgs/odoo-challenge/odoo-challenge-6.png)

```javascript
  //  JS
  var idx = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
  var tmp = "";
  for (var i=0; i < pwd.length; i++)
      tmp += " "+idx.indexOf(pwd.charAt(i));

  if(tmp == " 37 8 37 3 3 13 15 1 9 11 38 3 39 9 38 4 10 6 6 6")
  {
      $.post('/jobs/challenge/submit', {pwd: pwd}).always(function(x) { window.location = '/jobs/challenge/next'});
  }
```

反向计算 `pwd`

```javascript
var idx = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
var pwd = ""
var tmp = " 37 8 37 3 3 13 15 1 9 11 38 3 39 9 38 4 10 6 6 6".split(' ');
for (var j=1; j < tmp.length; j++)
    pwd += idx[tmp[j]];
console.log(pwd); //B8B33df19bC3D9C4a666
```
