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
- 得出 `url`: `https://www.odoo.com/jobs/challenge/c01/379/prime.json`

```json
{ "instructions":
 "Remove non prime numbers from data then right shift
  [113th decimal of the constant quantity that determines the area of a circle by multiplying it by the radius squared]
  bits from the remaining numbers, it will give you the alphanumeric password of the next level",
  "numbers": [ 25997, 25799, 13100, 48684, 16934, 13259, 17305, 55983, 13907, 17261, 55728, 10297, 13093, 12473, 18656, 13451, 46130, 12763, 25163, 3973, 35701, 13963, 25601, 19970, 16331, 17194, 18240, 26099, 54228, 34354, 23474, 13913, 31299, 55800, 7996, 24953, 43996, 60352, 37209, 25121, 14563, 38252, 19197, 14609, 11061, 27683, 33010, 57782, 30956, 11694, 36505, 35568, 13903, 23987, 45353, 13829, 7711, 29092, 18044, 57020, 4455, 2781, 57118, 46252, 33525, 56343, 37878, 13463, 30822, 53235, 48044, 625, 25693, 24953, 57336, 14011, 32431, 22024, 36278, 5909, 48198, 13711, 25741, 13487, 56406, 13464, 14669, 24952, 15093, 59085, 9777, 16323, 25011, 6525, 62279, 41405, 33715, 54789, 49705, 12527, 12117, 15634, 35113, 38746, 30092, 13921, 14249, 26111, 41173, 61706, 63388, 14741, 17292, 10438, 12066, 51291, 12389, 18817, 41074, 46017, 25582, 25657, 24470, 14009, 25633, 61308, 39687, 26111, 53992, 14341, 892, 25037, 24851, 17587, 14303, 42924, 39067, 13841 ] }
```

```python
# -*- coding: utf-8 -*-

from math import sqrt

def is_prime(n):
    if n == 1:
        return False
    for i in range(2, int(sqrt(n))+1):
        if n % i == 0:
            return False
    return True


numbers = [ 23035, 12739, 14423, 61008, 13348, 20889, 17020, 36096, 61208, 32894, 49424, 49813, 14713, 54103, 60569, 58755, 44278, 61069, 64359, 26444, 28276, 57470, 34288, 7850, 14329, 12039, 53336, 6185, 49819, 14553, 31413, 4368, 48199, 11303, 25759, 14747, 13841, 39146, 10465, 536, 24859, 3866, 13711, 13542, 42592, 45753, 25523, 13313, 14029, 46595, 63057, 1354, 13859, 34595, 39202, 44725, 12697, 55642, 14621, 5834, 12923, 15196, 23570, 31732, 29065, 52113, 59717, 44342, 31631, 60874, 50100, 3810, 52288, 25253, 25919, 25229, 25913, 12421, 32438, 58248, 51120, 50305, 12347, 43945, 30812, 64378, 53318, 49698, 45268, 24721, 15296, 31476, 32977, 31173, 31715, 22204, 55998, 48577, 55553, 61647, 9944, 13241, 10221, 46777, 52459, 14153, 42246, 13177, 26495, 33171, 63328, 47092, 5326, 28965, 60881, 26119, 13697, 49274, 52149, 40473, 40135, 26370, 25303, 25770, 20911, 57249, 9736, 27536, 9085, 12809, 24136, 6600, 14489, 54028, 13879, 13003, 14249, 47799, 51940, 30157, 45166, 62154, 41366, 13177, 11482, 39664, 15483, 8496, 9212, 63096, 40603, 31631, 25693, 14423, 12689, 57506, 8733, 25688, 6918, 13297, 12917, 25763, 25680, 58565, 44034, 6615, 57124, 14321 ] 

primenub = []

if __name__ == "__main__":
    print(len(numbers))
    for number in numbers:
        if is_prime(number):
            primenub.append(number)
    print(len(primenub))
    print(primenub)
    li_3 = []
    for i in primenub:
        li_3.append(chr(i >> 8))
    print("".join(li_3))
```

### Odoo Challenge level 8
