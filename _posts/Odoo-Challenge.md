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

### Odoo Challenge level 7

![level 7-1](/imgs/odoo-challenge/odoo-challenge-7-1.png)

![level 7-2](/imgs/odoo-challenge/odoo-challenge-7-2.png)

- It-Is-The-Part-1-Of-Url: `/jobs/challenge/c01/<part2>/prime.json`
- It-Is-The-Part-2-Of-Url=`/jobs/challenge/<part1>/379/prime.json`

得出 `url`: `https://www.odoo.com/jobs/challenge/c01/379/prime.json`

```json
{ "instructions":
 "Remove non prime numbers from data then right shift
  [113th decimal of the constant quantity that determines the area of a circle by multiplying it by the radius squared]
  bits from the remaining numbers, it will give you the alphanumeric password of the next level",
  "numbers": [ 25997, 25799, 13100, 48684, 16934, 13259, 17305, 55983, 13907, 17261, 55728, 10297, 13093, 12473, 18656, 13451, 46130, 12763, 25163, 3973, 35701, 13963, 25601, 19970, 16331, 17194, 18240, 26099, 54228, 34354, 23474, 13913, 31299, 55800, 7996, 24953, 43996, 60352, 37209, 25121, 14563, 38252, 19197, 14609, 11061, 27683, 33010, 57782, 30956, 11694, 36505, 35568, 13903, 23987, 45353, 13829, 7711, 29092, 18044, 57020, 4455, 2781, 57118, 46252, 33525, 56343, 37878, 13463, 30822, 53235, 48044, 625, 25693, 24953, 57336, 14011, 32431, 22024, 36278, 5909, 48198, 13711, 25741, 13487, 56406, 13464, 14669, 24952, 15093, 59085, 9777, 16323, 25011, 6525, 62279, 41405, 33715, 54789, 49705, 12527, 12117, 15634, 35113, 38746, 30092, 13921, 14249, 26111, 41173, 61706, 63388, 14741, 17292, 10438, 12066, 51291, 12389, 18817, 41074, 46017, 25582, 25657, 24470, 14009, 25633, 61308, 39687, 26111, 53992, 14341, 892, 25037, 24851, 17587, 14303, 42924, 39067, 13841 ] }
```
