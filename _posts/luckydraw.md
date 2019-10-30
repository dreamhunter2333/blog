---
title: luckydraw
date: 2019-10-30 16:37:23
categories:
tags:
---

## luckydraw

<a href="https://github.com/lhy58/canvas-lottery" class="fork">
    <img style="position: absolute; top: 0; left: 0; border: 0;" src="./src/images/fork-me.png" alt="">
</a>
    <!--320px是手机最小宽度,注意这个的width,height应该: 320 * ratio + px-->
<div style="text-align: center;margin: 100px 0 0 0">
    <canvas id="canvas" width="320px" height="320px" style="width: 320px;height: 320px;"></canvas>
</div>
<script src="./glo.js"></script>
<script src="./sudoku.js"></script>
<script>
    var canvas = document.getElementById('canvas'),
        context = canvas.getContext('2d');
    var ratio = window.devicePixelRatio || 1;
    new Sudoku({
        sudokuSize: canvas.width,
        jumpIndex: Math.floor(Math.random() * 7),
        awards: [
            {type: 'text', content: '30元话费'},
            {type: 'text', content: 'iphoneX'},
            {type: 'losing', content: '未中奖'},
            {type: 'text', content: 'MackBook Pro'},
            {type: 'image', content: 'https://img12.360buyimg.com/n7/jfs/t4807/209/1436278963/496606/8e486549/58f0884eNcec87657.jpg'},
            {type: 'losing', content: '海南3日游'},
            {type: 'image', content: 'https://img11.360buyimg.com/n7/jfs/t3187/325/423764794/213696/f4eb1dbd/57b68142Nbe104228.jpg'},
            {type: 'text', content: '火星一日游'}
        ],
        finish: function (index) {
            switch(this.awards[index].type) {
                case 'text':
                    alert('🎉恭喜您中得：' + this.awards[index].content);
                    break;
                case 'image':
                    if (index === 4)      alert('🎉恭喜您中得战争磨坊水冷机');
                    else if (index === 6) alert('🎉恭喜您中得魔声耳机');
                    break;
                case 'losing':
                    alert('💔很遗憾，您没有中奖~');
                    break;
            }
        }
    }).render(canvas, context, ratio);
</script>
