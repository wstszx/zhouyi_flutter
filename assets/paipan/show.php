<?php
$APPID='1751103945';
$APPKEY='dee40516b0a9f59e556e36ed88b3062c';
$URL='https://www.zydx.win/@3.0/api.php?';
?>
<meta name='keywords' content='八字排盘,四柱排盘,八字排盘系统,在线八字排盘,排八字,在线排八字,八字,命理,国学,算卦,排盘,易经,六十四卦,奇门,命运,运势,测算,姻缘,婚姻'/><meta charset='UTF-8'>
<meta name='Description' content='墨家国学可提供八字排盘免费详批，八字排盘算命是一种根据八字用天干地支表示人出生的年、月、日、时，依照查四柱间之五行生克制化、刑冲会合为推命重点，生辰八字排盘免费查询，小到性格、大到发展都能够从这上面看出端倪一二，八字在线排盘，让你提前知晓一生命格。'/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>八字排盘v3.0</title>
<a href='/' style='text-decoration:none;' target='_blank'><h2 style='text-align:center;color:#CC0000;'>八字排盘v3.0</h2></a>
<meta name='keywords' id='keywords' />
<meta name='Description' id='Description' />
<meta charset='UTF-8'>
<title id='Descriptiona' ></title>
<script type='text/javascript' src='date/date/jquery.min3.7.1.js'></script>
<script type='text/javascript' src='date/date/jquery.cookie.min1.4.1.js'></script>
<link href="date/date/select2.min4.0.8.css" rel="stylesheet" />
<script src="date/date/select2.min4.0.8.js"></script>
<script type='text/javascript' src='date/yuyanvvv.js'></script>
<html lang='zh-CN' class='no-js no-asynchronous'>
<head>
<meta charset='UTF-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
<meta name='theme-color' content='#898C7B'>
<meta name='applicable-device' content='pc,mobile'>
<meta name='renderer' content='webkit'>
<link href='date/date/swiper-bundle.min6.8.0.css' rel='stylesheet' />
<link type='text/css' href='date/smcsss.css' rel='stylesheet' />
<script type='text/javascript' src='date/date/swiper-bundle.min11.0.3.js'></script>
<div class="txt_box" style="width: 100vw;height: 100vh;display: flex;align-items: center;justify-content: center;background-color: rgba(0, 0, 0, 0.4);position: fixed;top: 0;z-index: 999;">
<div class="txt_" style="width: 200px;height: 200px;background-color: #fff;border-radius: 5px;display: flex;align-items: center;justify-content: center;"></div>
</div>
<script>$('.txt_box').hide();</script>
<div class='smnr'>
<div style='padding:10px;'>
<div id='ftrq'></div>


<b>八字排盘结果：</b><br><b>姓名：</b><b id='system.name'></b>&nbsp;&nbsp;<b id='system.xmwx'></b>
<font color='#006600'>[<a id='system.nylm'></a>][<a id='JSFW.zg'></a>]</font><br><b>性别：</b><b id='system.sexxx'></b><br><b>生肖：</b><b id='system.shengxiao'></b><br><b>节气：</b><b id='chusheng.QH'></b><br><b id='chusheng.DCXC'></b><br><b>物候：</b><b id='system.WuHou'></b><br><b>星宿：</b><b id='system.getXiuSong'></b><br><b>人元司令分野：</b><font color='red'><b id='system.SiLing'></b></font>用事（<select class="js-example-basic-single" onchange='silish()' id='system.SiLingFangshi'></select>）<a onclick=alert('人元司令分野是一个用来确定节气中天干旺衰的关键法则，其核心在于阴阳平衡的原理。阴阳之气的变化是由月令和时辰的推进决定的，气的增减深浅是预测的基础。在事物活动之前，通常会经历一个启动阶段，这个阶段可以被理解为中气和余气，它们是月令本气开始之前的重要步骤。具体来说，无论是四生月、四库月还是四正月，过程遵循这样的顺序：首先由余气主导，接着中气接替，最后本气正式成为主导。这个规律，即为人元司令分野，它为我们理解节气规律提供了重要的线索。')>
<font color='red'>？</font></a><br><b>五格：</b><b id='system.SCWG'></b><br><b>六甲空亡：</b>
<font color='#993300'><a id='bazixinxi.liujiakongwangluokong'></a></font><br><b>传统派强弱分析(主)：</b>
<font color='#993300'><a id='bzgj'></a></font><br><b>平衡法强弱分析：</b>
<font color='#993300'><a id='bzgj2'></a></font><br><b>调候法平衡分析：</b>
<font color='#993300'><a id='bzgj3'></a></font><br><b>千里命稿格局派分析：</b>
<font color='#993300' id='bzgjj'></font>
<br><b>喜用神分析：</b>
<font color='#993300' id='xyszl'></font>（内测中）
<br><b>起运：</b>命主于出生后<font color='#006600'><b id='chusheng.QY'></b></font>后起运&nbsp;&nbsp;排盘方式：<b id='system.PPFS'></b><br><b>交运：</b>命主于公历<font color='#993300'><b id='system.JYRQ'></b></font>交运<br><b>换运：</b><font color='#993300'><b id='chusheng.HYWS'></b></font><div id='ZTYS'></div><div id='XLS'></div><div id='ZTYSS'></div><b>公历：</b>
<font color='#993300'><b id='chusheng.gongli'></b></font>&nbsp;<b id='bjhs'></b>&nbsp;<b id='system.XingZuo'></b><br><b>农历：</b>
<font color='#993300'><b id='chusheng.nongli'></b></font>&nbsp;<b id='system.getYueXiang'></b>&nbsp;<b id='system.getZheng'></b>
<br>专业：
四柱:&nbsp;<input id='sxianyin' name='girl' type='radio' onclick=yjxianyin('sxianyin') checked/>
&nbsp;&nbsp;胎元:&nbsp;<input id='taixianyin' name='girl' type='radio' onclick=yjxianyin('taixianyin') />
&nbsp;&nbsp;命宫:&nbsp;<input id='mingxianyin' name='girl' type='radio' onclick=yjxianyin('mingxianyin') />
&nbsp;&nbsp;身宫:&nbsp;<input id='shenxianyin' name='girl' type='radio' onclick=yjxianyin('shenxianyin') />
&nbsp;&nbsp;胎息:&nbsp;<input id='xxianyin' name='girl' type='radio' onclick=yjxianyin('xxianyin') />
&nbsp;&nbsp;五柱:&nbsp;<input id='wxianyin' name='girl' type='radio' onclick=yjxianyin('wxianyin') />

<br>
<table class='table' border='0' cellpadding='0' cellspacing='0' id="capture">
<tr style='background-color:#666'>
<td><b style='white-space:nowrap;'>四柱:&nbsp;</b></td>
<td id='shenxianyin1'><a onclick=sc('wd','身宫')>身宫</a></td>
<td id='mingxianyin1'><a onclick=sc('wd','命宫')>命宫</a></td>
<td id='taixianyin1'><a onclick=sc('wd','胎元')>胎元</a></td>
<td id='xxianyin1'><a onclick=sc('wd','胎息')>胎息</a></td>
<td><a onclick=sc('wd','年柱')>年柱</a></td>
<td><a onclick=sc('wd','月柱')>月柱</a></td>
<td><a onclick=sc('wd','日柱')>日柱</a></td>
<td><a onclick=sc('wd','时柱')>时柱</a></td>
<td id='wxianyin1'><a onclick=sc('wd','刻柱')>刻柱</a></td>
</tr>
<tr style='background-color:#CCC'>
<td><b style='white-space:nowrap;'>十神:&nbsp;</b></td>
<td id='shenxianyin2'><span id='aBZcolor.Sgys'><a id="aDZSS[BZ.Sg]['全']"></a></span></span></td>
<td id='mingxianyin2'><span id='aBZcolor.mgys'><a id="aDZSS[BZ.mg]['全']"></a></span></span></td>
<td id='taixianyin2'><span id='aBZcolor.tgys'><a id="aDZSS[BZ.tg]['全']"></a></span></span></td>
<td id='xxianyin2'><span id='aBZcolor.Tgys'><a id="aDZSS[BZ.Tg]['全']"></a></span></span></td>
<td><span id='aBZcolor.ngys'><a id="aDZSS[BZ.ng]['全']"></a></span></span></td>
<td><span id='aBZcolor.ygys'><a id="aDZSS[BZ.yg]['全']"></a></span></span></td>
<td><span style='flex:1'>
<font id='aBZcolor.rgys'><a id='asystem.sexx'></a></font>
</span></td>
<td><span id='aBZcolor.sgys'><a id="aDZSS[BZ.sg]['全']"></a></span></span></td>
<td id='wxianyin2'><span id='aBZcolor.Kgys'><a id="aDZSS[BZ.Kg]['全']"></a></span></span></td>
</tr>
<tr style='background-color:#999' id='bm_tglines'>
<td><b style='white-space:nowrap;'>天干:&nbsp;</b></td>
<td id='shenxianyin3'><span class='big' id='aBZcolor.Sgysa'><a id='aBZ.Sg'></a></span></td>
<td id='mingxianyin3'><span class='big' id='aBZcolor.mgysa'><a id='aBZ.mg'></a></span></td>
<td id='taixianyin3'><span class='big' id='aBZcolor.tgysa'><a id='aBZ.tg'></a></span></td>
<td id='xxianyin3'><span class='big' id='aBZcolor.Tgysa'><a id='aBZ.Tg'></a></span></td>
<td><span class='big' id='aBZcolor.ngysa'><a id='aBZ.ng'></a></span></td>
<td><span class='big' id='aBZcolor.ygysa'><a id='aBZ.yg'></a></span></td>
<td><span class='big' id='aBZcolor.rgysa'><a id='aBZ.rg'></a></span></td>
<td><span class='big' id='aBZcolor.sgysa'><a id='aBZ.sg'></a></span></td>
<td id='wxianyin3'><span class='big' id='aBZcolor.Kgysa'><a id='aBZ.Kg'></a></span></td>
</tr>
<tr style='background-color:#CCC' id='bm_dzlines'>
<td><b style='white-space:nowrap;'>地支:&nbsp;</b></td>
<td id='shenxianyin4'><span class='big' id='aBZcolor.Sbqysa'><a id='aBZ.Sz'></a></span></td>
<td id='mingxianyin4'><span class='big' id='aBZcolor.mbqysa'><a id='aBZ.mz'></a></span></td>
<td id='taixianyin4'><span class='big' id='aBZcolor.tbqysa'><a id='aBZ.tz'></a></span></td>
<td id='xxianyin4'><span class='big' id='aBZcolor.Tbqysa'><a id='aBZ.Tz'></a></span></td>
<td><span class='big' id='aBZcolor.nbqysa'><a id='aBZ.nz'></a></span></td>
<td><span class='big' id='aBZcolor.ybqysa'><a id='aBZ.yz'></a></span></td>
<td><span class='big' id='aBZcolor.rbqysa'><a id='aBZ.rz'></a></span></td>
<td><span class='big' id='aBZcolor.sbqysa'><a id='aBZ.sz'></a></span></td>
<td id='wxianyin4'><span class='big' id='aBZcolor.Kbqysa'><a id='aBZ.Kz'></a></span></td>
</tr>
<tr style='background-color:#999'>
<td><b style='white-space:nowrap;'>藏干:&nbsp;</b></td>
<td id='shenxianyin5'><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.Sbqys'><a id='aZGss.Sbq'></a>&nbsp;<a id="aDZSS[BZ.Sz]['本']['全']"></a></span><span id='aBZcolor.Szqys'><a id='aZGss.Szq'></a>&nbsp;<a id="aDZSS[BZ.Sz]['中']['全']"></a></span><span id='aBZcolor.Syqys'><a id='aZGss.Syq'></a>&nbsp;<a id="aDZSS[BZ.Sz]['余']['全']"></a></span></td>
<td id='mingxianyin5'><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.mbqys'><a id='aZGss.mbq'></a>&nbsp;<a id="aDZSS[BZ.mz]['本']['全']"></a></span><span id='aBZcolor.mzqys'><a id='aZGss.mzq'></a>&nbsp;<a id="aDZSS[BZ.mz]['中']['全']"></a></span><span id='aBZcolor.myqys'><a id='aZGss.myq'></a>&nbsp;<a id="aDZSS[BZ.mz]['余']['全']"></a></span></td>
<td id='taixianyin5'><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.tbqys'><a id='aZGss.tbq'></a>&nbsp;<a id="aDZSS[BZ.tz]['本']['全']"></a></span><span id='aBZcolor.tzqys'><a id='aZGss.tzq'></a>&nbsp;<a id="aDZSS[BZ.tz]['中']['全']"></a></span><span id='aBZcolor.tyqys'><a id='aZGss.tyq'></a>&nbsp;<a id="aDZSS[BZ.tz]['余']['全']"></a></span></td>
<td id='xxianyin5'><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.Tbqys'><a id='aZGss.Tbq'></a>&nbsp;<a id="aDZSS[BZ.Tz]['本']['全']"></a></span><span id='aBZcolor.Tzqys'><a id='aZGss.Tzq'></a>&nbsp;<a id="aDZSS[BZ.Tz]['中']['全']"></a></span><span id='aBZcolor.Tyqys'><a id='aZGss.Tyq'></a>&nbsp;<a id="aDZSS[BZ.Tz]['余']['全']"></a></span></td>
<td><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.nbqys'><a id='aZGss.nbq'></a>&nbsp;<a id="aDZSS[BZ.nz]['本']['全']"></a></span><span id='aBZcolor.nzqys'><a id='aZGss.nzq'></a>&nbsp;<a id="aDZSS[BZ.nz]['中']['全']"></a></span><span id='aBZcolor.nyqys'><a id='aZGss.nyq'></a>&nbsp;<a id="aDZSS[BZ.nz]['余']['全']"></a></span></td>
<td><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.ybqys'><a id='aZGss.ybq'></a>&nbsp;<a id="aDZSS[BZ.yz]['本']['全']"></a></span><span id='aBZcolor.yzqys'><a id='aZGss.yzq'></a>&nbsp;<a id="aDZSS[BZ.yz]['中']['全']"></a></span><span id='aBZcolor.yyqys'><a id='aZGss.yyq'></a>&nbsp;<a id="aDZSS[BZ.yz]['余']['全']"></a></span></td>
<td><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.rbqys'><a id='aZGss.rbq'></a>&nbsp;<a id="aDZSS[BZ.rz]['本']['全']"></a></span><span id='aBZcolor.rzqys'><a id='aZGss.rzq'></a>&nbsp;<a id="aDZSS[BZ.rz]['中']['全']"></a></span><span id='aBZcolor.ryqys'><a id='aZGss.ryq'></a>&nbsp;<a id="aDZSS[BZ.rz]['余']['全']"></a></span></td>
<td><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.sbqys'><a id='aZGss.sbq'></a>&nbsp;<a id="aDZSS[BZ.sz]['本']['全']"></a></span><span id='aBZcolor.szqys'><a id='aZGss.szq'></a>&nbsp;<a id="aDZSS[BZ.sz]['中']['全']"></a></span><span id='aBZcolor.syqys'><a id='aZGss.syq'></a>&nbsp;<a id="aDZSS[BZ.sz]['余']['全']"></a></span></td>
<td id='wxianyin5'><span style='flex:1;display:flex;flex-direction:column;'><span id='aBZcolor.Kbqys'><a id='aZGss.Kbq'></a>&nbsp;<a id="aDZSS[BZ.Kz]['本']['全']"></a></span><span id='aBZcolor.Kzqys'><a id='aZGss.Kzq'></a>&nbsp;<a id="aDZSS[BZ.Kz]['中']['全']"></a></span><span id='aBZcolor.Kyqys'><a id='aZGss.Kyq'></a>&nbsp;<a id="aDZSS[BZ.Kz]['余']['全']"></a></span></td>
</tr>
<tr style='background-color:#CCC'>
<td><b style='white-space:nowrap;clear:both;'>纳音:&nbsp;</b></td>
<td id='shenxianyin6'><a id='aDYNY[BZ.Sg+BZ.Sz]'></a></td>
<td id='mingxianyin6'><a id='aDYNY[BZ.mg+BZ.mz]'></a></td>
<td id='taixianyin6'><a id='aDYNY[BZ.tg+BZ.tz]'></a></td>
<td id='xxianyin6'><a id='aDYNY[BZ.Tg+BZ.Tz]'></a></td>
<td><a id='aDYNY[BZ.ng+BZ.nz]'></a></td>
<td><a id='aDYNY[BZ.yg+BZ.yz]'></a></td>
<td><a id='aDYNY[BZ.rg+BZ.rz]'></a></td>
<td><a id='aDYNY[BZ.sg+BZ.sz]'></a></td>
<td id='wxianyin6'><a id='aDYNY[BZ.Kg+BZ.Kz]'></a></td>
</tr>
<tr style='background-color:#999'>
<td><b style='white-space:nowrap;clear:both;'>空亡:&nbsp;</b></td>
<td id='shenxianyin7'><div id='aDYKW[BZ.Sg+BZ.Sz]'></div></td>
<td id='mingxianyin7'><div id='aDYKW[BZ.mg+BZ.mz]'></div></td>
<td id='taixianyin7'><div id='aDYKW[BZ.tg+BZ.tz]'></div></td>
<td id='xxianyin7'><div id='aDYKW[BZ.Tg+BZ.Tz]'></div></td>
<td><div id='aDYKW[BZ.ng+BZ.nz]'></div></td>
<td><div id='aDYKW[BZ.yg+BZ.yz]'></div></td>
<td><div id='aDYKW[BZ.rg+BZ.rz]'></div></td>
<td><div id='aDYKW[BZ.sg+BZ.sz]'></div></td>
<td id='wxianyin7'><div id='aDYKW[BZ.Kg+BZ.Kz]'></div></td>
</tr>
<tr style='background-color:#ccc'>
<td><b style='white-space:nowrap;clear:both;'>神煞:&nbsp;</b></td>
<td id='shenxianyin8'>
<div class='item'>
<div>
<div id='aSgSS'></div>
</div>
</div>
</td>
<td id='mingxianyin8'>
<div class='item'>
<div>
<div id='amgSS'></div>
</div>
</div>
</td>
<td id='taixianyin8'>
<div class='item'>
<div>
<div id='atgSS'></div>
</div>
</div>
</td>
<td id='xxianyin8'>
<div class='item'>
<div>
<div id='aTgSS'></div>
</div>
</div>
</td>
<td>
<div class='item'>
<div>
<div id='aNZSS'></div>
</div>
</div>
</td>
<td>
<div class='item'>
<div>
<div id='aYZSS'></div>
</div>
</div>
</td>
<td>
<div class='item'>
<div>
<div id='aRZSS'></div>
</div>
</div>
</td>
<td>
<div class='item'>
<div>
<div id='aSZSS'></div>
</div>
</div>
</td>
<td id='wxianyin8'>
<div class='item'>
<div>
<div id='aKgSS'></div>
</div>
</div>
</td>
</tr>
<tr style='background-color:#999'>
<td><b style='white-space:nowrap;clear:both;'>星运:&nbsp;</b></td>
<td id='shenxianyin9'><a id='aDYWS[BZ.Sz]'></a></td>
<td id='mingxianyin9'><a id='aDYWS[BZ.mz]'></a></td>
<td id='taixianyin9'><a id='aDYWS[BZ.tz]'></a></td>
<td id='xxianyin9'><a id='aDYWS[BZ.Tz]'></a></td>
<td><a id='aDYWS[BZ.nz]'></a></td>
<td><a id='aDYWS[BZ.yz]'></a></td>
<td><a id='aDYWS[BZ.rz]'></a></td>
<td><a id='aDYWS[BZ.sz]'></a></td>
<td id='wxianyin9'><a id='aDYWS[BZ.Kz]'></a></td>
</tr>
<tr style='background-color:#CCC'>
<td><b style='white-space:nowrap;clear:both;'>自座:&nbsp;</b></td>
<td id='shenxianyin10'><a id='aDYZZ[BZ.Sg+BZ.Sz]'></a></td>
<td id='mingxianyin10'><a id='aDYZZ[BZ.mg+BZ.mz]'></a></td>
<td id='taixianyin10'><a id='aDYZZ[BZ.tg+BZ.tz]'></a></td>
<td id='xxianyin10'><a id='aDYZZ[BZ.Tg+BZ.Tz]'></a></td>
<td><a id='aDYZZ[BZ.ng+BZ.nz]'></a></td>
<td><a id='aDYZZ[BZ.yg+BZ.yz]'></a></td>
<td><a id='aDYZZ[BZ.rg+BZ.rz]'></a></td>
<td><a id='aDYZZ[BZ.sg+BZ.sz]'></a></td>
<td id='wxianyin10'><a id='aDYZZ[BZ.Kg+BZ.Kz]'></a></td>
</tr>
</table>

<table class='table' id='qitacankaocs'>
<tr style='background-color:#999'>
<td width='60'>天干关系:</td>
<td id='bm_tgliuyi' style='text-align:left'></td>
</tr>
<tr style='background-color:#ccc'>
<td width='60'>地支关系:</td>
<td id='bm_dzliuyi' style='text-align:left'></td>
</tr>
<tr style='background-color:#999'>
<td width='60'>八字包含:</td>
<td style='text-align:left'>
<div id='BZBH1'></div>
</td>
</tr>
<tr style='background-color:#ccc'>
<td width='60'>八字包含:</td>
<td id='bm_dzlii' style='text-align:left'>
<div id='BZBH2'>
</td>
</tr>
<tr style='background-color:#ccc'>
<td width='60'>五行阴阳:</td>
<td id='bm_dzlii' style='text-align:left'>
<div id='WXYY'>
</td>
</tr>
<tr style='background-color:#999'>
<td width='60'>藏干包含:</td>
<td style='text-align:left'>
<div id='BZBH3'>
</td>
</tr>

<tr style='background-color:#ccc'>
<td width='60'>藏干包含:</td>
<td style='text-align:left'>
<div id='BZBH4'>
</td>
</tr>

<tr style='background-color:#999'>
<td width='60'>无敌律数:</td>
<td style='text-align:left'>
<div id='BZBH6'>
</td>
</tr>

<tr style='background-color:#ccc'>
<td width='60'>无敌律数:</td>
<td style='text-align:left'>
<div id='BZBH7'>
</td>
</tr>

<tr style='background-color:#999'>
<td width='60'>月度量化:</td>
<td style='text-align:left'>
<div id='BZBH8'>
</td>
</tr>

<tr style='background-color:#ccc'>
<td width='60'>月度量化:</td>
<td style='text-align:left'>
<div id='BZBH9'>
</td>
</tr>

<tr style='background-color:#999'>
<td width='60'>平衡用神:</td>
<td style='text-align:left'>
<div id='BZBH10'>
</td>
</tr>

<tr style='background-color:#ccc'>
<td width='60'>平衡用神:</td>
<td style='text-align:left'>
<div id='BZBH11'>
</td>
</tr>

<tr style='background-color:#999'>
<td width='60' onclick=sc('wd','燥湿分析') >燥湿分析:</td>
<td style='text-align:left'>
<div id='BZBH5'>
</td>
</tr>

<tr style='background-color:#ccc'>
<td width='60'>用神参考:</td>
<td style='text-align:left'>
<div id='YSCK'>
</td>
</tr>
<tr style='background-color:#999'>
<td width='60'>五行旺衰:</td>
<td style='text-align:left'><b id='chusheng.WXWS'></b></td>
</tr>
<tr style='background-color:#ccc'>
<td width='60'>称骨重量:</td>
<td id='bm_dzliui' style='text-align:left'><b id='FX.gz'></b></td>
</tr>
<tr style='background-color:#999'>
<td width='60'>称骨评语:</td>
<td style='text-align:left'><b id='FX.cgg'></b></td>
</tr>
<tr style='background-color:#ccc'>
<td width='60'>程序分析:</td>
<td id='bm_dzlii' style='text-align:left'>
<select class="js-example-basic-single" style="width: 25%;" id='FX1'></select><select class="js-example-basic-single" style="width: 45%;" id='FX2' onchange='show()'><option value='请选择'>请选择</option></select>
</td>
</tr>
</table>
<div id="heading" style="font-size: 3.4vw; font-size: clamp(8px, 3.4vw, 23px);background-color: #ccc; color: #000000;"></div>
<div class='smnr'>
<!--细盘-->
<table class='table'>
<colgroup>
<col style='border-right: 1px solid #999;' id='col1'/>
<col style='border-right: 1px solid #999;' id='col2'/>
<col style='border-right: 1px solid #999;' id='col3'/>
<col style='border-right: 1px solid #999;' id='col4'/>
<col style='border-right: 1px solid #999;' id='col5'/>
<col style='border-right: 1px solid #999;' />

</colgroup>
<tbody>
<tr style='background-color:#999'>
<td>日期</td>
<td id='liushibt'>流时</td>
<td id='liuribt'>流日</td>
<td id='liuyuebt'>流月</td>
<td id='liunianbt'>流年</td>
<td id='liuyunbt'>大运</td>
<td>年柱</td>
<td>月柱</td>
<td>日柱</td>
<td>时柱</td>
</tr>
<tr>
<td>岁年</td>
<td id='liushiage'></td>
<td id='liuriage'></td>
<td id='liuyueage'></td>
<td id='liunianage'><br></td>
<td id='dayunage'><br></td>
<td>*</td>
<td>*</td>
<td>*</td>
<td>*</td>
</tr>
<tr id='tgline'>
<td>天干</td>
<td id='liushitgs'>
<div class='bz' id='liushitg'><span class='big'></span><span class='small'></span></div>
</td>
<td id='liuritgs'>
<div class='bz' id='liuritg'><span class='big'></span><span class='small'></span></div>
</td>
<td id='liuyuetgs'>
<div class='bz' id='liuyuetg'><span class='big'></span><span class='small'></span></div>
</td>
<td id='liuniantgs'>
<div class='bz' id='liuniantg'><span class='big'></span><span class='small'></span></div>
</td>
<td id='dayuntgs'>
<div class='bz' id='dayuntg'><span class='big'></span><span class='small'></span></div>
</td>
<td>
<div class='bz'>
<div id='BZNG'></div>
</div>
</td>
<td>
<div class='bz'>
<div id='BZYG'></div>
</div>
</td>
<td>
<div class='bz'>
<div id='BZRG'></div>
</div>
</td>
<td>
<div class='bz'>
<div id='BZSG'></div>
</div>
</td>
</tr>
<tr id='dzline'>
<td>地支</td>
<td id='liushidzs'>
<div class='bz' id='liushidz'><span class='big'></span><span class='small'></span></div>
</td>
<td id='liuridzs'>
<div class='bz' id='liuridz'><span class='big'></span><span class='small'></span></div>
</td>
<td id='liuyuedzs'>
<div class='bz' id='liuyuedz'><span class='big'></span><span class='small'></span></div>
</td>
<td id='liuniandzs'>
<div class='bz' id='liuniandz'><span class='big'></span><span class='small'></span></div>
</td>
<td id='dayundzs'>
<div class='bz' id='dayundz'><span class='big'></span><span class='small'></span></div>
</td>
<td>
<div class='bz'>
<div id='BZNZ'></div>
</div>
</td>
<td>
<div class='bz'>
<div id='BZYZ'></div>
</div>
</td>
<td>
<div class='bz'>
<div id='BZRZ'></div>
</div>
</td>
<td>
<div class='bz'>
<div id='BZSZ'></div>
</div>
</td>
</tr>
<!--空亡-->
<tr style='background-color:#DDD;'>
<td>空亡</td>
<td id='liushi_kongwang'></td>
<td id='liuri_kongwang'></td>
<td id='liuyue_kongwang'></td>
<td id='liunian_kongwang'></td>
<td id='dayun_kongwang'></td>
<td id='DaYunKWa'></td>
<td id='DaYunKWb'></td>
<td id='DaYunKWc'></td>
<td id='DaYunKWd'></td>
</tr>
<!--星运-->
<tr style='background-color:#ccc;'>
<td>星运</td>
<td id='liushi_xingyun'></td>
<td id='liuri_xingyun'></td>
<td id='liuyue_xingyun'></td>
<td id='liunian_xingyun'></td>
<td id='dayun_xingyun'></td>
<td><a id='DYWSnz'></a></td>
<td><a id='DYWSyz'></a></td>
<td><a id='DYWSrz'></a></td>
<td><a id='DYWSsz'></a></td>
</tr>
<!--自座-->
<tr style='background-color:#DDD;'>
<td>自座</td>
<td id='liushi_zizuo'></td>
<td id='liuri_zizuo'></td>
<td id='liuyue_zizuo'></td>
<td id='liunian_zizuo'></td>
<td id='dayun_zizuo'></td>
<td><a id='DYZZnz'></a></td>
<td><a id='DYZZyz'></a></td>
<td><a id='DYZZrz'></a></td>
<td><a id='DYZZsz'></a></td>
</tr>
<!--纳音-->
<tr style='background-color:#ccc;'>
<td>纳音</td>
<td id='liushi_nayin'></td>
<td id='liuri_nayin'></td>
<td id='liuyue_nayin'></td>
<td id='liunian_nayin'></td>
<td id='dayun_nayin'></td>
<td><a id='DYNYnz'></a></td>
<td><a id='DYNYyz'></a></td>
<td><a id='DYNYrz'></a></td>
<td><a id='DYNYsz'></a></td>
</tr>
</tbody>
</table>
<!--大运-->
<table class='table'>
<tbody>
<tr style='background-color:#999'>
<td>专业</td>
<td>流年:<input id='liuyinian' type='checkbox' onclick=tiangandizhiliuyi() checked/></td>
<td>流月:<input id='liuyiyue' type='checkbox' onclick=tiangandizhiliuyi() /></td>
<td>流日:<input id='liuyiri' type='checkbox' onclick=tiangandizhiliuyi() /></td>
<td>流时:<input id='liuyishi' type='checkbox' onclick=tiangandizhiliuyi() /></td>
<td>流刻:<input id='liuyike' type='checkbox' onclick=tiangandizhiliuyi() /></td>


</tr>
</tbody>
</table>
<table class='table'>
<tbody>
<tr style='background-color:#EEEEEE' id='zytdyqr'>

</tr>
</tbody>
</table>

<table class='table' id='xipanliuyun'>
<tbody>
<tr id='LNDYQY'></tr>
<tr id='xipandayungz'></tr>
</tbody>
</table>
<!--流年-->
<table class='table' id='dayunliunian'>
<tbody>
<tr>
<td>岁年</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td>流年</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
<table class='table' id='dayunliunianc'>
<tbody>
<tr>
<td>小运</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tbody>
</table>
<!--流月-->
<table class='table' id='xipanliuyue'>
<tbody>
<tr>
<td>节气</td>
<td onclick=alert('立春：立是开始的意思，习惯把它作为春季开始。\n雨水：雨水开始润下，雨量渐增，农村开始备耕生产。')>立春</td>
<td onclick=alert('惊蛰：春雷乍动，蛰伏在土中冬眠的动物开始苏醒。过了惊蛰节，春耕不停歇。\n春分：春分表示昼夜平分，阳光直照赤道，南北半球得阳光平均。')>惊蛰</td>
<td onclick=alert('清明：天气晴朗，雨量增多，草木繁茂，春暖花开。春游踏青好时节，祭祀扫墓忙。\n谷雨：雨生百谷，雨量充足，是春作物播种、出苗的季节。')>清明</td>
<td onclick=alert('立夏：夏季的开始。\n小满：夏熟作物籽粒开始饱满。小麦就要熟了。')>立夏</td>
<td onclick=alert('\n芒种：麦类等有芒作物成熟。\n夏至：炎热的夏天来临，一年中白天最长的一天。')>芒种</td>
<td onclick=alert('小暑：一年最炎热的季节开始了。\n大暑：一年中最热的时候。')>小暑</td>
<td onclick=alert('立秋：秋季的开始。\n处暑：炎热的暑天结束，气温由热向冷转变。')>立秋</td>
<td onclick=alert('白露：天气转凉，露凝而白。\n秋分：秋分秋分，日夜平分。')>白露</td>
<td onclick=alert('寒露：露水以寒，将要结冰。\n霜降：天气渐冷，开始有霜。')>寒露</td>
<td onclick=alert('立冬：冬季的开始。\n小雪：开始下雪。')>立冬</td>
<td onclick=alert('大雪：降雪量增多，小麦进入了休眠期。\n冬至：寒冷的冬天来临，昼最短夜最长。')>大雪</td>
<td onclick=alert('小寒：气候开始寒冷。\n大寒：一年中最严寒的时候。')>小寒</td>
</tr>
<tr>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
<td>流月</td>
</tr>
</tbody>
</table>
<!--流日-->
<div class='table line bg-tr' id='xipanliuri'>
<div class='nowrap'>流日</div>
<div class='swiper-container'>
<div class='nowrap liuri-box swiper-wrapper'><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span><span class='swiper-slide kong'>流日</span></div>
</div>
</div>

<!--流时-->
<table class='table' id='xipanliushi'>
<tbody>
<tr>
<td>时间</td>
<td>00</td>
<td>01</td>
<td>03</td>
<td>05</td>
<td>07</td>
<td>09</td>
<td>11</td>
<td>13</td>
<td>15</td>
<td>17</td>
<td>19</td>
<td>21</td>
<td>23</td>
</tr>
<tr>
<td>流时</td>
<td id='xiangxiliushi1'>流时</td>
<td id='xiangxiliushi2'>流时</td>
<td id='xiangxiliushi3'>流时</td>
<td id='xiangxiliushi4'>流时</td>
<td id='xiangxiliushi5'>流时</td>
<td id='xiangxiliushi6'>流时</td>
<td id='xiangxiliushi7'>流时</td>
<td id='xiangxiliushi8'>流时</td>
<td id='xiangxiliushi9'>流时</td>
<td id='xiangxiliushi10'>流时</td>
<td id='xiangxiliushi11'>流时</td>
<td id='xiangxiliushi12'>流时</td>
<td id='xiangxiliushi13'>流时</td>

</tr>
</tbody>
</table>

<!--流刻-->
<table class='table' id='xipanliuke'>
<tbody>
<tr>
<td>刻时</td>
<td>0分</td>
<td>12分</td>
<td>24分</td>
<td>36分</td>
<td>48分</td>
<td>60分</td>
<td>72分</td>
<td>84分</td>
<td>96分</td>
<td>108分</td>
</tr>
<tr>
<td>流刻</td>
<td id='xiangxiliuke1'>流刻</td>
<td id='xiangxiliuke2'>流刻</td>
<td id='xiangxiliuke3'>流刻</td>
<td id='xiangxiliuke4'>流刻</td>
<td id='xiangxiliuke5'>流刻</td>
<td id='xiangxiliuke6'>流刻</td>
<td id='xiangxiliuke7'>流刻</td>
<td id='xiangxiliuke8'>流刻</td>
<td id='xiangxiliuke9'>流刻</td>
<td id='xiangxiliuke10'>流刻</td>
</tr>
</tbody>
</table>
<table class='table'>
<tbody>

<tr>
<td width='60' valign='top'>天干留意:</td>
<td id='tgliuyi' style='text-align:left'></td>
</tr>
<tr>
<td width='60' valign='top'>地支留意:</td>
<td id='dzliuyi' style='text-align:left'></td>
</tr>
<tr id='dayunshenshaa'>
<td width='60' valign='top'>大运神煞:</td>
<td id='dayunshensha' style='text-align:left'></td>
</tr>
<tr id='liunianshenshaa'>
<td width='60' valign='top'>流年神煞:</td>
<td id='liunianshensha' style='text-align:left'></td>
</tr>
<tr id='liuyueshenshaa'>
<td width='60' valign='top'>流月神煞:</td>
<td id='liuyueshensha' style='text-align:left'></td>
</tr>
<tr id='liurishenshaa'>
<td width='60' valign='top'>流日神煞:</td>
<td id='liurishensha' style='text-align:left'></td>
</tr>
<tr id='liushishenshaa'>
<td width='60' valign='top'>流时神煞:</td>
<td id='liushishensha' style='text-align:left'></td>
</tr>
<tr id='liukeshenshaa'>
<td width='60' valign='top'>流刻神煞:</td>
<td id='liukeshensha' style='text-align:left'></td>
</tr>

<tr id='liunianyunshi'>
<td width='60' valign='top'>本年运势:</td>
<td id='dtlnys' style='text-align:left'></td>
</tr>

</tbody>
</table>
<input type='hidden' id='ld'>
<input type='hidden' id='ln'>
<input type='hidden' id='ly'>
<input type='hidden' id='lr'>
<input type='hidden' id='ls'>
<input type='hidden' id='lk'>
<input type='hidden' id='imgewm'>
<!--细盘-->
</div><input type='hidden' id='yzx' name='yzx' value='2' /><input type='hidden' id='bz_sx' name='bz_sx' value='0' /><input type='hidden' id='rzx' name='rzx' value='0' />
<script type='text/javascript' id='dayunliuniancData'></script>
<script type='text/javascript' id='dayunliunianccData'></script>

<script type='text/javascript' src='date/date/lunar1.6.7.js'></script>
<div id='jblndyjz'></div>
<div id='zwdshxjz'></div>


<script type='text/javascript'>

var $jiazi=['甲子','乙丑','丙寅','丁卯','戊辰','己巳','庚午','辛未','壬申','癸酉','甲戌','乙亥','丙子','丁丑','戊寅','己卯','庚辰','辛巳','壬午','癸未','甲申','乙酉','丙戌','丁亥','戊子','己丑','庚寅','辛卯','壬辰','癸巳','甲午','乙未','丙申','丁酉','戊戌','己亥','庚子','辛丑','壬寅','癸卯','甲辰','乙巳','丙午','丁未','戊申','己酉','庚戌','辛亥','壬子','癸丑','甲寅','乙卯','丙辰','丁巳','戊午','己未','庚申','辛酉','壬戌','癸亥'];
href=window.location.href;
function show(){
originalText=document.getElementById('FX2').value;
document.getElementById('heading').innerHTML='　　'+originalText.replace(/<br>/g, '<br>　　');

}
function silish(){document.getElementById('system.SiLing').innerHTML=document.getElementById('system.SiLingFangshi').value;}
let tgdzColor={'甲':'green','乙':'green','丙':'red','丁':'red','戊':'#995001','己':'#995001','庚':'#FD7C04','辛':'#FD7C04','壬':'blue','癸':'blue','寅':'green','卯':'green','辰':'#995001','巳':'red','午':'red','未':'#995001','申':'#FD7C04','酉':'#FD7C04','戌':'#995001','亥':'blue','子':'blue','丑':'#995001'}

function createXmlHttp(){
if (window.XMLHttpRequest){
xmlHttp=new XMLHttpRequest()
}else{
xmlHttp=new ActiveXObject('Microsoft.XMLHTTP')}}
let urlbb=new URL(window.location.href);
let para=urlbb.search;

writeSource('','<?php echo file_get_contents($URL.http_build_query($_GET)."&api=1&APPID=".$APPID."&APPKEY=".$APPKEY);?>');

function isJson(str) {
try {
JSON.parse(str);
return true;
} catch (e) {
return false;
}
}



function writeSource(cs,ms){
try{
obg=JSON.parse(ms==null?xmlHttp.responseText:ms);
}catch(error){
alert('排盘异常，请换其他姓名或反馈到群');
}

with(obg){
document.write(cs);
var BZWZ=BZ.ng+BZ.nz+BZ.yg+BZ.yz+BZ.rg+BZ.rz+BZ.sg+BZ.sz;
sex=0;
if(system.sexx=='男'){sex=1;}
if(fanhui==0){alert('不存在此八字');}


document.getElementById('system.XingZuo').innerHTML=system.XingZuo;
document.getElementById('system.WuHou').innerHTML=system.WuHou+' '+system.Hou;
document.getElementById('system.getYueXiang').innerHTML=system.getYueXiang+'月';
document.getElementById('system.getZheng').innerHTML=system.getZheng+'曜日';

document.getElementById('system.sexxx').innerHTML=system.sexx;

document.getElementById('system.shengxiao').innerHTML=system.shengxiao;

var search=window.location.search;


if(system.PPFS=='八字反推'){
document.getElementById("ftrq").innerHTML="<button id='openPopup'>双击切换日期</button>";

var style=document.createElement('style');
style.innerText=`
.popup{
display:none;
position:fixed;
top:30%;
left:30%;
transform:translate(-20%,-10%);
padding:10px;
background-color:#fff;
border:1px solid #ccc;
box-shadow:0 0 10px rgba(0,0,0,0.1);
z-index:1000;
}
`;
var popup=document.createElement('div');
popup.id='popup';
popup.className='popup';
var h2=document.createElement('h2');
h2.innerText='该八字反推出如下日期：';
popup.appendChild(h2);
var options=bzftlb;
options.forEach((option,index)=>{
var input=document.createElement('input');
input.type='radio';
input.name='ftid';
input.value=index;
var label=document.createElement('label');
label.innerText=option;
popup.appendChild(input);
popup.appendChild(label);
popup.appendChild(document.createElement('br'));
if(index==ftid){
input.checked=true;
}
});
var selectButton=document.createElement('button');
selectButton.id='selectOption';
selectButton.innerText='选定此日期重新排盘';
popup.appendChild(selectButton);
document.head.appendChild(style);
document.body.appendChild(popup);

document.addEventListener('click', function (event) {
if (!popup.contains(event.target)) {
popup.style.display = 'none';
}
});
$(document).ready(function(){
$('#openPopup').click(function(){
$('#popup').fadeIn();
});
$('#selectOption').click(function(){
var selectedOption=$('input[name="ftid"]:checked').val();
if(selectedOption){

if(ftid!=selectedOption){
window.location.href=href+'&ftid='+selectedOption;return;
}

}
$('#popup').fadeOut();
});
});



}

document.getElementById('system.getXiuSong').innerHTML="<a onclick=alert('"+system.getXiuSong+"')>"+system.getXiu+system.getAnimal+system.getXiuLuck+'</a>';

document.getElementById('system.name').innerHTML=system.name;

document.getElementById('imgewm').value=system.KLFX;

document.getElementById('system.xmwx').innerHTML=system.xmwx;
document.getElementById('system.nylm').innerHTML="<a onclick=sc('wd','"+system.nylm+"')>"+system.nylm+"</a>";
document.getElementById("JSFW.zg").innerHTML="<a onclick=alert('风水喜忌：\\n北："+JSFW.b+"，东北："+JSFW.db+"，东："+JSFW.d+"，东南："+JSFW.dn+"，南："+JSFW.n+"，西南："+JSFW.xn+"，西："+JSFW.x+"，西北："+JSFW.xb+"\\n基本参考："+JSFW.jbk+"\\n风水参考："+JSFW.fsk+"')>"+JSFW.zg+"</a>";
ESJQB='出生当年24节气时间表\\n';
for (var k in chusheng['QH']){
ESJQB+=k+'：'+chusheng['QH'][k]+"\\n";
}
ESJQB=ESJQB.replace(/\s/g, '');
document.getElementById("chusheng.QH").innerHTML="<a onclick=alert('"+ESJQB+"')>"+chusheng.DL2+' '+chusheng.DL1+' '+chusheng.CL2+' '+chusheng.CL1+"</a>";
document.getElementById("chusheng.DCXC").innerHTML="<a>出生于"+chusheng.DL1+'后'+chusheng.DCXC[0]+'天'+chusheng.DCXC[1]+'小时，'+chusheng.CL1+'前'+chusheng.DCXC[2]+'天'+chusheng.DCXC[3]+"小时</a>";
for (var i = 0; i < system.SiLing.length; i++) {
demoP = document.getElementById("system.SiLingFangshi");
demoP.innerHTML = demoP.innerHTML + "<option value='"+system.SiLing[i][1]+"'>"+system.SiLing[i][0]+"</option>"; 
}
silish();

document.getElementById("system.SCWG").innerHTML=system.SCWG;
document.getElementById("chusheng.QY").innerHTML=chusheng.QY;
document.getElementById("system.PPFS").innerHTML=system.PPFS;
document.getElementById("system.JYRQ").innerHTML=system.JYRQ;
document.getElementById("chusheng.HYWS").innerHTML=chusheng.HYWS;
document.getElementById("ZTYS").innerHTML="<b>真太阳时地区：</b><font color='#993300'>"+system.city+"</font><br><b>真太阳时前日期：</b><font color='#993300'>"+system.Z_QRQ+"</font><br>";
document.getElementById("ZTYSS").innerHTML="<b>真太阳时经纬：</b><font color='#993300'>东经"+system.ZTYdj+" 北纬"+system.ZTYbw+" "+system.ZTYSC+"</font><br>";
if(system.bjhs=='1'){
document.getElementById("bjhs").innerHTML="<font color='#993300'>(换算北京时间开)</font>";
}

if(system.xls=='1'){
document.getElementById("XLS").innerHTML="<b>夏令时规则：</b><font color='#993300'>已启用</font>";
}
document.getElementById("chusheng.gongli").innerHTML=chusheng.gongli;
document.getElementById("chusheng.nongli").innerHTML="<a onclick=alert('"+bazixinxi.bazishengyue+"')>"+chusheng.nongli+"</a>";
document.getElementById("bazixinxi.liujiakongwangluokong").innerHTML="<a onclick=alert('相传，若六甲空亡落空，父母、本人和儿女当中，最少会有一人要离婚，如果没人离婚，会有人身体有缺陷或病痛缠身；若六甲空亡没有落空，将会家庭美满，万事顺利。')>"+bazixinxi.zh[6]+"</a>";

document.getElementById("bzgj").innerHTML="<a onclick=alert('共七种强弱状态:\\n均衡:喜忌比较麻烦,随着流年大运变化\\n偏弱:喜生助,忌克泄耗\\n偏强:喜克泄耗,忌生助\\n强:喜克泄耗变偏强,大忌生助变从强\\n弱:喜生助变偏弱,大忌克泄耗变从弱\\n从强:物极必反反倒为弱,喜生助,大忌流年破格合化克泄耗\\n从弱:物极必反反倒为强,喜克泄耗,大忌流年破格合化生助\\n综上所述供格局取用参考')>"+deling[5]+"</a>";
document.getElementById("bzgj2").innerHTML="<a onclick=alert('共三种强弱状态:\\n均衡:喜忌比较麻烦,随着流年大运变化\\n强:喜克泄耗变偏强,大忌生助\\n弱:喜生助变偏弱,大忌克泄耗\\n综上所述供格局取用参考')>"+bazixinxi.PHYongShen[10]+"</a>";
document.getElementById("bzgj3").innerHTML="<a onclick=alert('共五种平衡状态:\\n极阳\\n偏阳\\n均衡\\n偏阴\\n极阴\\n以上分析仅供学术参考')>气含:"+bazixinxi.THYongShen[0]+" "+bazixinxi.THYongShen[1]+"</a>";
document.getElementById("xyszl").innerHTML="<a onclick=alert('内测中功能，平衡法&调候法&传统强弱&千里命稿格局法混合分析\\n融合六大体系持续更新中')>"+bazixinxi.PDXiYongShen[1]+"</a>";

gejua='';
geju.forEach((item)=>{
gejua+="<a onclick=sc('wd','"+item+"')>"+item+"</a> ";
});
document.getElementById("bzgjj").innerHTML=gejua;

document.getElementById("keywords").content=BZ.ng+BZ.nz+','+BZ.yg+BZ.yz+','+BZ.rg+BZ.rz+','+BZ.sg+BZ.sz+','+system.sexx+','+system.XingZuo+','+'八字排盘,四柱排盘,八字排盘系统,在线八字排盘,排八字,在线排八字,八字,命理,国学,算卦,排盘,易经,六十四卦,命运,运势,测算,婚姻';
document.getElementById("Description").content=FX.sanmingtonghui3+FX.sanmingtonghui4;
document.getElementById("Descriptiona").innerHTML=BZ.ng+BZ.nz+' '+BZ.yg+BZ.yz+' '+BZ.rg+BZ.rz+' '+BZ.sg+BZ.sz+' '+system.sexx+' '+system.XingZuo+'-墨家国学';

tgSS="";mgSS="";SgSS="";NZSS="";YZSS="";RZSS="";SZSS="";TgSS="";KgSS="";
for (var i=0; i < LLSS[BZ.Tg+BZ.Tz].length; i++){TgSS+="<a onclick=sc('wd','"+LLSS[BZ.Tg+BZ.Tz][i]+"')>"+LLSS[BZ.Tg+BZ.Tz][i]+"</a></div><div>"}
for (var i=0; i < LLSS[BZ.Kg+BZ.Kz].length; i++){KgSS+="<a onclick=sc('wd','"+LLSS[BZ.Kg+BZ.Kz][i]+"')>"+LLSS[BZ.Kg+BZ.Kz][i]+"</a></div><div>"}
for (var i=0; i < LLSS[BZ.Sg+BZ.Sz].length; i++){SgSS+="<a onclick=sc('wd','"+LLSS[BZ.Sg+BZ.Sz][i]+"')>"+LLSS[BZ.Sg+BZ.Sz][i]+"</a></div><div>"}
for (var i=0; i < LLSS[BZ.mg+BZ.mz].length; i++){mgSS+="<a onclick=sc('wd','"+LLSS[BZ.mg+BZ.mz][i]+"')>"+LLSS[BZ.mg+BZ.mz][i]+"</a></div><div>"}
for (var i=0; i < LLSS[BZ.tg+BZ.tz].length; i++){tgSS+="<a onclick=sc('wd','"+LLSS[BZ.tg+BZ.tz][i]+"')>"+LLSS[BZ.tg+BZ.tz][i]+"</a></div><div>"}
for (var i=0; i < SS.NZSC.length; i++){
NZSS+="<a onclick=sc('wd','"+SS.NZSC[i]+"')>"+SS.NZSC[i]+"</a></div><div>"}
for (var i=0; i < SS.YZSC.length; i++){
YZSS+="<a onclick=sc('wd','"+SS.YZSC[i]+"')>"+SS.YZSC[i]+"</a></div><div>"}
for (var i=0; i < SS.RZSC.length; i++){
RZSS+="<a onclick=sc('wd','"+SS.RZSC[i]+"')>"+SS.RZSC[i]+"</a></div><div>"}
for (var i=0; i < SS.SZSC.length; i++){
SZSS+="<a onclick=sc('wd','"+SS.SZSC[i]+"')>"+SS.SZSC[i]+"</a></div><div>"}
document.getElementById("aTgSS").innerHTML=TgSS;
document.getElementById("aKgSS").innerHTML=KgSS;
document.getElementById("atgSS").innerHTML=tgSS;
document.getElementById("amgSS").innerHTML=mgSS;
document.getElementById("aSgSS").innerHTML=SgSS;
document.getElementById("aNZSS").innerHTML=NZSS;
document.getElementById("aYZSS").innerHTML=YZSS;
document.getElementById("aRZSS").innerHTML=RZSS;
document.getElementById("aSZSS").innerHTML=SZSS;

document.getElementById("chusheng.WXWS").innerHTML=chusheng.WXWS;
document.getElementById("FX.gz").innerHTML=FX.cgg[0]+'&nbsp;&nbsp;格局:'+FX.cgg[2];
document.getElementById("FX.cgg").innerHTML="<a onclick=alert('"+FX.cgg[3]+"')>"+FX.cgg[1]+"</a>";




document.getElementById("YSCK").innerHTML=deling[0]+'，得'+deling[1]+'强气根，得'+deling[2]+'中气根，得'+deling[3]+'余气根，得'+deling[4]+'势';
ZNCS="";
RZFX="";
Arr_XingZuo="";
KWCS="";
GDLM="";
SCWG="";
GXSM="";
GGXTH="";
SWZX="";
SanShi="";
sanmingtonghui="";
bazitiyao="";
shenfengtongkao="";
wuxingjingji="";
lixuzhongmingshu="";
xiyongshencankao="";
ShoShengZhai="";
for (var i=0; i < FX.zncs.length; i++){ZNCS+=FX.zncs[i]+"<br>"}

for(var i in FX.rizhufenxi){RZFX+=i+"："+FX.rizhufenxi[i]+"<br>";}
for(var i in FX.XingZuo){Arr_XingZuo+=i+"："+FX.XingZuo[i]+"<br>";}
for (var i=0; i < FX.KWSC2.length; i++){KWCS+=FX.KWSC2[i]+"<br>"}
for (var i=0; i < FX.SanShi.length; i++){SanShi+=FX.SanShi[i]+"<br>"}
for(var i in FX.GDLM){GDLM+=FX.GDLM[i]+"<br>";}
for(var i in FX.SCWG){SCWG+=FX.SCWG[i]+"<br>";}
for(var i in FX.GXSM){GXSM+=FX.GXSM[i]+"<br>";}
for(var i in FX.GGXTH){GGXTH+=FX.GGXTH[i]+"<br>";}
for(var i in FX.XWSC){SWZX+=FX.XWSC[i]+"<br>";}
for(var i in FX.sanmingtonghui){sanmingtonghui+=FX.sanmingtonghui[i]+"<br>";}
for(var i in FX.bazitiyao){bazitiyao+=FX.bazitiyao[i]+"<br>";}
for(var i in FX.shenfengtongkao){shenfengtongkao+=FX.shenfengtongkao[i]+"<br>";}
for(var i in FX.wuxingjingji){wuxingjingji+=FX.wuxingjingji[i]+"<br>";}
for(var i in FX.lixuzhongmingshu){lixuzhongmingshu+=FX.lixuzhongmingshu[i]+"<br>";}
for(var i in FX.xiyongshencankao){xiyongshencankao+=FX.xiyongshencankao[i]+"<br>";}
for(var i in FX.ShoShengZhai){ShoShengZhai+=FX.ShoShengZhai[i]+"<br>";}
var proData = {'隐藏':['请选择'],'调试分析':['调试分析'],'通用参考':['日主分析','星座分析','综合分析','宫度论命','三才五格','喜用神参考','月日精参','骨相算命','鬼谷子论姻缘','失物找寻','三世'],'古籍参考':['穷通宝鉴','滴天髓','三命通会','八字提要','神峰通考','天元巫咸','五行经纪','李虚中命书','鬼谷子两头钳','格物至言','万公论命','地母经','道家受生债']};

var proDatac = {'请选择':'','调试分析':ZNCS,'日主分析':RZFX,'星座分析':Arr_XingZuo,'综合分析':KWCS,'宫度论命':GDLM,'三才五格':SCWG,'喜用神参考':xiyongshencankao,'月日精参':FX.YRJPFX,'骨相算命':GXSM,'鬼谷子论姻缘':GGXTH,'失物找寻':SWZX,'三世':SanShi,'穷通宝鉴':FX.qiongtongbaojian,'滴天髓':FX.ditiansui,'三命通会':sanmingtonghui,'八字提要':bazitiyao,'神峰通考':shenfengtongkao,'天元巫咸':FX.tianwuwuxian,'五行经纪':wuxingjingji,'李虚中命书':lixuzhongmingshu,'鬼谷子两头钳':FX.liangtoqian,'格物至言':FX.gewuzhiyan,'万公论命':FX.WGLM,'地母经':'诗曰<br>'+FX.DiMuJing[0]+'卜曰<br>'+FX.DiMuJing[1],'道家受生债':ShoShengZhai};
for( var key in proData ){
demoP = document.getElementById("FX1");
demoP.innerHTML = demoP.innerHTML + "<option value='"+key+"'>"+key+"</option>"; 
}
var oSelectPro = document.getElementById('FX1');
var oSelectCity = document.getElementById('FX2');
oSelectPro.onchange = function () {
var aRrayCity = proData[this.value];
oSelectCity.options.length=0;for (var i=0;i<aRrayCity.length;i++){
var oOption = document.createElement('option');
oOption.innerHTML = aRrayCity[i];oOption.value = proDatac[aRrayCity[i]];oSelectCity.appendChild(oOption)
}
show();
}
document.cookie='nz='+BZ.nz+';';
document.cookie='rg='+BZ.rg+';';
document.cookie='gj='+deling[5]+';';
document.cookie='rz='+BZ.rz+';';
document.getElementById("BZBH1").innerHTML="金"+bazixinxi.zh[0][0]+'个，木'+bazixinxi.zh[0][1]+'个，水'+bazixinxi.zh[0][2]+'个，火'+bazixinxi.zh[0][3]+'个，土'+bazixinxi.zh[0][4]+"个";
document.getElementById("BZBH2").innerHTML="阴"+bazixinxi.zh[1][1]+'个，阳'+bazixinxi.zh[1][0]+'个，阴占比'+bazixinxi.zh[2][0]+"％，阳占比"+bazixinxi.zh[2][1]+"％";


document.getElementById("WXYY").innerHTML="阴"+bazixinxi.zh[7][1]+'个，阳'+bazixinxi.zh[7][0]+'个，阴占比'+bazixinxi.zh[8][0]+"％，阳占比"+bazixinxi.zh[8][1]+"％";
document.getElementById("BZBH3").innerHTML="金"+bazixinxi.zh[3][0]+'个，木'+bazixinxi.zh[3][1]+'个，水'+bazixinxi.zh[3][2]+'个，火'+bazixinxi.zh[3][3]+'个，土'+bazixinxi.zh[3][4]+"个";
document.getElementById("BZBH4").innerHTML="阴"+bazixinxi.zh[4][1]+'个，阳'+bazixinxi.zh[4][0]+'个，阴占比'+bazixinxi.zh[5][0]+"％，阳占比"+bazixinxi.zh[5][1]+"％";
document.getElementById("BZBH5").innerHTML=bazixinxi.ZaoShi;

document.getElementById("BZBH6").innerHTML="金"+bazixinxi.WDLSSF[0][0]+'分,木'+bazixinxi.WDLSSF[0][1]+'分,水'+bazixinxi.WDLSSF[0][2]+'分,火'+bazixinxi.WDLSSF[0][3]+'分,土'+bazixinxi.WDLSSF[0][4]+"分";
document.getElementById("BZBH7").innerHTML="金"+bazixinxi.WDLSSF[1][0]+'%,木'+bazixinxi.WDLSSF[1][1]+'%,水'+bazixinxi.WDLSSF[1][2]+'%,火'+bazixinxi.WDLSSF[1][3]+'%,土'+bazixinxi.WDLSSF[1][4]+"%";

document.getElementById("BZBH8").innerHTML="金"+bazixinxi.YDWXSF[0][0]+'分,木'+bazixinxi.YDWXSF[0][1]+'分,水'+bazixinxi.YDWXSF[0][2]+'分,火'+bazixinxi.YDWXSF[0][3]+'分,土'+bazixinxi.YDWXSF[0][4]+"分";
document.getElementById("BZBH9").innerHTML="金"+bazixinxi.YDWXSF[1][0]+'%,木'+bazixinxi.YDWXSF[1][1]+'%,水'+bazixinxi.YDWXSF[1][2]+'%,火'+bazixinxi.YDWXSF[1][3]+'%,土'+bazixinxi.YDWXSF[1][4]+"%";

document.getElementById("BZBH10").innerHTML="金"+bazixinxi.PHYongShen[0]+'分,木'+bazixinxi.PHYongShen[1]+'分,水'+bazixinxi.PHYongShen[2]+'分,火'+bazixinxi.PHYongShen[3]+'分,土'+bazixinxi.PHYongShen[4]+"分";
document.getElementById("BZBH11").innerHTML="同党"+bazixinxi.PHYongShen[5]+'分,异党'+bazixinxi.PHYongShen[6]+'分,同党'+bazixinxi.PHYongShen[8]+'%,异党'+bazixinxi.PHYongShen[9]+'%';

document.getElementById("BZNG").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.ng]+"'>"+BZ.ng+"</span><span class='small'>"+DZSS[BZ.ng]['半']+"</span>";
document.getElementById("BZYG").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.yg]+"'>"+BZ.yg+"</span><span class='small'>"+DZSS[BZ.yg]['半']+"</span>";
document.getElementById("BZRG").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.rg]+"' id='rigan'>"+BZ.rg+"</span><span class='small'>"+system.sexx+"</span>";
document.getElementById("BZSG").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.sg]+"'>"+BZ.sg+"</span><span class='small'>"+DZSS[BZ.sg]['半']+"</span>";
document.getElementById("BZNZ").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.nz]+"'>"+BZ.nz+"</span><span class='small'>"+DZSS[BZ.nz]['本']['半']+DZSS[BZ.nz]['中']['半']+DZSS[BZ.nz]['余']['半']+"</span>";
document.getElementById("BZYZ").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.yz]+"'>"+BZ.yz+"</span><span class='small'>"+DZSS[BZ.yz]['本']['半']+DZSS[BZ.yz]['中']['半']+DZSS[BZ.yz]['余']['半']+"</span>";
document.getElementById("BZRZ").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.rz]+"'>"+BZ.rz+"</span><span class='small'>"+DZSS[BZ.rz]['本']['半']+DZSS[BZ.rz]['中']['半']+DZSS[BZ.rz]['余']['半']+"</span>";
document.getElementById("BZSZ").innerHTML="<span class='big' style='color:"+tgdzColor[BZ.sz]+"'>"+BZ.sz+"</span><span class='small'>"+DZSS[BZ.sz]['本']['半']+DZSS[BZ.sz]['中']['半']+DZSS[BZ.sz]['余']['半']+"</span>";
document.getElementById("DaYunKWa").innerHTML=DYKW[[BZ.ng]+[BZ.nz]];
document.getElementById("DaYunKWb").innerHTML=DYKW[[BZ.yg]+[BZ.yz]];
document.getElementById("DaYunKWc").innerHTML=DYKW[[BZ.rg]+[BZ.rz]];
document.getElementById("DaYunKWd").innerHTML=DYKW[[BZ.sg]+[BZ.sz]];
document.getElementById("DYWSnz").innerHTML="<a onclick=sc('wd','"+DYWS[BZ.nz]+"')>"+DYWS[BZ.nz]+"</a>";
document.getElementById("DYWSyz").innerHTML="<a onclick=sc('wd','"+DYWS[BZ.yz]+"')>"+DYWS[BZ.yz]+"</a>";
document.getElementById("DYWSrz").innerHTML="<a onclick=sc('wd','"+DYWS[BZ.rz]+"')>"+DYWS[BZ.rz]+"</a>";
document.getElementById("DYWSsz").innerHTML="<a onclick=sc('wd','"+DYWS[BZ.sz]+"')>"+DYWS[BZ.sz]+"</a>";
document.getElementById("DYZZnz").innerHTML="<a onclick=sc('wd','"+DYZZ[[BZ.ng]+[BZ.nz]]+"')>"+DYZZ[[BZ.ng]+[BZ.nz]]+"</a>";
document.getElementById("DYZZyz").innerHTML="<a onclick=sc('wd','"+DYZZ[[BZ.yg]+[BZ.yz]]+"')>"+DYZZ[[BZ.yg]+[BZ.yz]]+"</a>";
document.getElementById("DYZZrz").innerHTML="<a onclick=sc('wd','"+DYZZ[[BZ.rg]+[BZ.rz]]+"')>"+DYZZ[[BZ.rg]+[BZ.rz]]+"</a>";
document.getElementById("DYZZsz").innerHTML="<a onclick=sc('wd','"+DYZZ[[BZ.sg]+[BZ.sz]]+"')>"+DYZZ[[BZ.sg]+[BZ.sz]]+"</a>";
document.getElementById("DYNYnz").innerHTML="<a onclick=sc('wd','"+DYNY[[BZ.ng]+[BZ.nz]]+"')>"+DYNY[[BZ.ng]+[BZ.nz]]+"</a>";
document.getElementById("DYNYyz").innerHTML="<a onclick=sc('wd','"+DYNY[[BZ.yg]+[BZ.yz]]+"')>"+DYNY[[BZ.yg]+[BZ.yz]]+"</a>";
document.getElementById("DYNYrz").innerHTML="<a onclick=sc('wd','"+DYNY[[BZ.rg]+[BZ.rz]]+"')>"+DYNY[[BZ.rg]+[BZ.rz]]+"</a>";
document.getElementById("DYNYsz").innerHTML="<a onclick=sc('wd','"+DYNY[[BZ.sg]+[BZ.sz]]+"')>"+DYNY[[BZ.sg]+[BZ.sz]]+"</a>";

LNDYQY="<td>运年</td>";
xipandayungz="<td>大运</td>";
for (i=0; i <=27; ){
if(system.PPFS=='名人案例'){
LNDYQY+='<td>'+LNDY[i+1]+'岁<br>*</td>';
}else{LNDYQY+='<td>'+LNDY[i+1]+'岁<br>'+LNDY[i]+'</td>';}

xipandayungz+="<td data-age='"+LNDY[i+1]+"' data-year='"+LNDY[i]+"' data-yearr='"+LNDY[i+2]+"'>"+LNDY[i+2]+"</td>";i=i+3;}
document.getElementById("LNDYQY").innerHTML=LNDYQY;
document.getElementById("xipandayungz").innerHTML=xipandayungz;


ddssxx='';
let G8=['Sg','mg','tg','ng','yg','rg','sg','Tg','Kg'];
let BQ8=['Sbq','mbq','tbq','nbq','ybq','rbq','sbq','Tbq','Kbq'];
let Z8=['Sz','mz','tz','nz','yz','rz','sz','Tz','Kz'];
let Q21=['Sbq','Szq','Syq','tbq','tzq','tyq','mbq','mzq','myq','nbq','nzq','nyq','ybq','yzq','yyq','rbq','rzq','ryq','sbq','szq','syq','Tbq','Tzq','Tyq','Kbq','Kzq','Kyq'];
for (let i=0;i<27;i++){
ddssxx+="document.getElementById('aBZcolor."+Q21[i]+"ys').style='color:"+tgdzColor[ZGss[Q21[i]]]+"';";
if(ZGss[Q21[i]]!=null){ddssxx+="document.getElementById(\"aZGss."+Q21[i]+"\").innerHTML=\"<a onclick=sc('wd','"+ZGss[Q21[i]]+"')>"+ZGss[Q21[i]]+"</a>\";";}
if(i<9){
ddssxx+="document.getElementById('aBZcolor."+G8[i]+"ys').style='flex:1;color:"+tgdzColor[BZ[G8[i]]]+"';";
ddssxx+="document.getElementById('aBZcolor."+G8[i]+"ysa').style='font-size:24px;font-weight:700;color:"+tgdzColor[BZ[G8[i]]]+"';";
ddssxx+="document.getElementById('aBZcolor."+BQ8[i]+"ysa').style='font-size:24px;font-weight:700;color:"+tgdzColor[ZGss[BQ8[i]]]+"';";
ddssxx+="document.getElementById(\"aBZ."+G8[i]+"\").innerHTML=\"<a onclick=sc('wd','"+BZ[G8[i]]+"')>"+BZ[G8[i]]+"</a>\";";
ddssxx+="document.getElementById(\"aBZ."+Z8[i]+"\").innerHTML=\"<a onclick=sc('wd','"+BZ[Z8[i]]+"')>"+BZ[Z8[i]]+"</a>\";";
ddssxx+="document.getElementById(\"aDZSS[BZ."+Z8[i]+"]['本']['全']\").innerHTML=\"<a onclick=sc('wd','"+DZSS[BZ[Z8[i]]]['本']['全']+"')>"+DZSS[BZ[Z8[i]]]['本']['全']+"</a>\";";
if(DZSS[BZ[Z8[i]]]['中']['全']!=null){ddssxx+="document.getElementById(\"aDZSS[BZ."+Z8[i]+"]['中']['全']\").innerHTML=\"<a onclick=sc('wd','"+DZSS[BZ[Z8[i]]]['中']['全']+"')>"+DZSS[BZ[Z8[i]]]['中']['全']+"</a>\";";}
if(DZSS[BZ[Z8[i]]]['余']['全']!=null){ddssxx+="document.getElementById(\"aDZSS[BZ."+Z8[i]+"]['余']['全']\").innerHTML=\"<a onclick=sc('wd','"+DZSS[BZ[Z8[i]]]['余']['全']+"')>"+DZSS[BZ[Z8[i]]]['余']['全']+"</a>\";";}
ddssxx+="document.getElementById(\"aDYNY[BZ."+G8[i]+"+BZ."+Z8[i]+"]\").innerHTML=\"<a onclick=sc('wd','"+DYNY[BZ[G8[i]]+BZ[Z8[i]]]+"')>"+DYNY[BZ[G8[i]]+BZ[Z8[i]]]+"</a>\";";
ddssxx+="document.getElementById(\"aDYWS[BZ."+Z8[i]+"]\").innerHTML=\"<a onclick=sc('wd','"+DYWS[BZ[Z8[i]]]+"')>"+DYWS[BZ[Z8[i]]]+"</a>\";";
ddssxx+="document.getElementById(\"aDYZZ[BZ."+G8[i]+"+BZ."+Z8[i]+"]\").innerHTML=\"<a onclick=sc('wd','"+DYZZ[BZ[G8[i]]+BZ[Z8[i]]]+"')>"+DYZZ[BZ[G8[i]]+BZ[Z8[i]]]+"</a>\";";
ddssxx+="document.getElementById(\"aDYKW[BZ."+G8[i]+"+BZ."+Z8[i]+"]\").innerHTML='"+DYKW[BZ[G8[i]]+BZ[Z8[i]]]+"';";

if(i==5){
ddssxx+="document.getElementById('asystem.sexx').innerHTML=\"<a onclick=sc('wd','元"+system.sexx+"')>元"+system.sexx+"</a>\";";
}else{
ddssxx+="document.getElementById(\"aDZSS[BZ."+G8[i]+"]['全']\").innerHTML=\"<a onclick=sc('wd','"+DZSS[BZ[G8[i]]]['全']+"')>"+DZSS[BZ[G8[i]]]['全']+"</a>\";";
}
}
}

var $jia=[1204,1264,1324,1384,1444,1504,1564,1624,1684,1744,1804,1864,1924,1984,2044,2104,2164,2224,2284,2344,2404,2464,2524,2584,2644,2704,2764,2824,2884,2944];
function findCloseNum(arr, num) {
var index=0;
var old_value=Number.MAX_VALUE;
for (var i=0; i < arr.length; i++) {
var new_value=Math.abs(arr[i]-num);
if (new_value <=old_value) { 
if (new_value===old_value && arr[i] < arr[index]) {
continue;
}
index=i;
old_value=new_value;
}
}
return [arr[index-1],arr[index],arr[index+1]];
}

findClose=findCloseNum($jia,system.GNF);


liunianSY='var dayunliunianData={';
for(e=0;e<=2;e++){
for(i=0;i<=59;i++){

liunianSY+=findClose[e]+i;
liunianSY+=":'"+$jiazi[i]+"'";
liunianSY+=',';
}
}
liunianSY+='};';

DYkongwang=liunianSY+"var kongwang={";
DYshensha='var shensha={';
DYxingyun='var xingyun={';
DYzizuo='var zizuo={';
DYnayin='var nayin={';
dayunliuniancData="var dayunliuniancData={};";
for (var i in DYKW){
DYkongwang+="'"+i+"':\""+DYKW[i]+"\","}
for (var i in LLSS){
DYshensha+="'"+i+"':\"";
for (var ii in LLSS[i]){
DYshensha+="<a onclick=sc('wd','"+LLSS[i][ii]+"')>"+LLSS[i][ii]+"</a> "}
DYshensha+="\","}
for (var i in DYWS){
DYxingyun+="'"+i+"':\"<a onclick=sc('wd','"+DYWS[i]+"')>"+DYWS[i]+"</a>\","}
for (var i in DYZZ){
DYzizuo+="'"+i+"':\"<a onclick=sc('wd','"+DYZZ[i]+"')>"+DYZZ[i]+"</a>\","}
for (var i in DYNY){
DYnayin+="'"+i+"':\"<a onclick=sc('wd','"+DYNY[i]+"')>"+DYNY[i]+"</a>\","}
for (var x=0; x < 100; x++){
d=Number(system.GNF)+Number(x);
dayunliuniancData+="dayunliuniancData['"+d+"']=\""+LNXY[d]+"\";"}
cookie=document.cookie;

XcHcP="var liuyi=[['甲戊','相克'],['乙己','相克'],['丙庚','相克'],['丁辛','相克'],['戊壬','相克'],['己癸','相克'],['甲己','合土'],['乙庚','合金'],['丙辛','合水'],['丁壬','合木'],['戊癸','合火'],['甲庚','冲'],['乙辛','冲'],['丙壬','冲'],['丁癸','冲'],['巳申','合化水'],['辰酉','合化金'],['卯戌','合化火'],['寅亥','合化木'],['子丑','合化土'],['午未','合化火或土'],['申子辰','合化水'],['寅午戌','合化火'],['亥卯未','合化木'],['巳酉丑','合化金'],['亥子丑','汇聚北方水'],['寅卯辰','汇聚东方木'],['巳午未','汇聚南方火'],['申酉戌','汇聚西方金'],['子卯','为无礼之刑'],['丑未戌','为恃势之刑'],['寅巳申','为无恩之刑'],['辰辰','为自刑'],['午午','为自刑'],['酉酉','为自刑'],['亥亥','为自刑'],['子午','相冲'],['卯酉','相冲'],['寅申','相冲'],['巳亥','相冲'],['辰戌','相冲'],['丑未','相冲'],['子未','相穿'],['丑午','相穿'],['寅巳','相穿'],['卯辰','相穿'],['申亥','相穿'],['酉戌','相穿'],['寅午','暗合土'],['子巳','暗合火'],['巳酉','暗合水'],['卯申','暗合金'],['亥午','暗合木'],['寅丑','暗合'],['子戌','暗合'],['子辰','暗合'],['寅未','暗合'],['子酉','相破'],['寅亥','相破'],['卯午','相破'],['辰丑','相破'],['巳申','相破'],['未戌','相破'],['巳丑','拱合'],['辰申','拱合'],['寅戌','拱合'],['亥未','拱合'],['卯未', '半合木局'],['亥卯', '半合木局'],['亥未', '半合木局'],['寅午', '半合火局'],['寅戌', '半合火局'],['午戌', '半合火局'],['申辰', '半合水局'],['申子', '半合水局'],['子辰', '半合水局'],['巳酉', '半合金局'],['丑酉', '半合金局'],['巳丑', '半合金局'],['寅酉','相绝'],['子巳','相绝'],['申卯','相绝'],['午亥','相绝'],];";
var LNTDY = JSON.stringify(LNTDY);
LNTDY="var LNTDY='"+LNTDY+"';";

document.getElementById("dayunliuniancData").innerHTML=XcHcP+LNTDY+ddssxx+dayunliuniancData+DYnayin+"};"+DYzizuo+"};"+DYxingyun+"};"+DYshensha+"};"+DYkongwang+"};function addScriptTag(src){var script=document.createElement('script');script.setAttribute('type','text/javascript');script.src=src;document.body.appendChild(script);}function sc(wd,mm){addScriptTag('<?php echo $URL;?>SYLX='+wd+'&id='+mm);}function copyToClipboard(s){if(window.clipboardData){window.clipboardData.setData('text',s);}else{(function(s){document.oncopy=function(e){e.clipboardData.setData('text',s);e.preventDefault();document.oncopy=null;}})(s);document.execCommand('Copy')}alert('已复制到剪贴板！');}DYKSNF="+LNDY[3]+";XYKSNF="+LNDY[0]+";";
return;
}
}


var LNTDY = JSON.parse(LNTDY);

var $tiangan=["癸","甲","乙","丙","丁","戊","己","庚","辛","壬"];
var $dizhi=["亥","子","丑","寅","卯","辰","巳","午","未","申","酉","戌"];
var $yuegan1911=["庚","辛","壬","癸","甲","乙","丙","丁","戊","己"];
var $yibaiesk={"亥":50,"子":0,"丑":10,"寅":20,"卯":30,"辰":40,"巳":50,"午":0,"未":10,"申":20,"酉":30,"戌":40};
var $jie=['立春','惊蛰','清明','立夏','芒种','小暑','立秋','白露','寒露','立冬','大雪','XIAO_HAN','LI_CHUN'];
var $ssShorter={'比肩':'比','劫财':'劫','正印':'印','偏印':'枭','正官':'官','七杀':'杀','正财':'财','偏财':'才','伤官':'伤','食神':'食',};
XYKSNF=dayunliuniancData[XYKSNF];
var $liuri=[[9,0,1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8,9,0],[3,4,5,6,7,8,9,0,1,2],[5,6,7,8,9,0,1,2,3,4],[7,8,9,0,1,2,3,4,5,6],[9,0,1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8,9,0],[3,4,5,6,7,8,9,0,1,2],[5,6,7,8,9,0,1,2,3,4],[7,8,9,0,1,2,3,4,5,6]];
function SZWZ(SZ,ZF){
sy=-1;
for(var i=0;i<SZ.length;i++){
if(SZ[i]==ZF){
return i;}}}

var currentYear=(new Date()).getFullYear();

//流时清空
function liushiqingkong(){
for (let i=1;i<14;i++){
document.getElementById('xiangxiliushi'+i).style.backgroundColor='';}}

//流刻清空
function liukeqingkong(){
for (let i=1;i<11;i++){
document.getElementById('xiangxiliuke'+i).style.backgroundColor='';}}

//流刻事件

function liukeshijian(bbb,aaa,ggg,ddd){
liukeqingkong();
document.getElementById(bbb).style.backgroundColor='#999999';
$("#liukeshensha").html(shensha[aaa]);
document.getElementById('lk').value=aaa;
tiangandizhiliuyi();


dtgjtjhq(5);
}

function dtgjtjhq(a) {
let isCalled = false;
document.getElementById('nbtsc').innerHTML = '稍等';
document.getElementById('dtlnys').innerHTML = '运算中请稍后';

return new Promise((resolve, reject) => {
setTimeout(() => {
if (!isCalled) {
isCalled = true;

ld = document.getElementById('ld').value;
if(a>=1){ln = document.getElementById('ln').value;}
if(a>=2){ly = document.getElementById('ly').value;}
if(a>=3){lr = document.getElementById('lr').value;}
if(a>=4){ ls = document.getElementById('ls').value;}
if(a>=5){lk = document.getElementById('lk').value;}

sc('dtgj', ln + '-' + ld + ln + ly + lr + ls + lk);
 
}
}, 1000);
});
}


//流时事件
function liushishijian(bbb,aaa,ccc,ggg,ddd){
liushiqingkong();
document.getElementById(bbb).style.backgroundColor='#999999';
$("#liushishensha").html(shensha[aaa+ccc]);
document.getElementById('ls').value=aaa+ccc;
$("#liushiage").html(ccc+"时<br>"+ggg+"时");
$("#liushitg .big").html(aaa).css('color',tgdzColor[aaa]);
$("#liushidz .big").html(ccc).css('color',tgdzColor[ccc]);
$("#liushitg .small").html($ssShorter[getShishen(
$tiangan.indexOf(aaa),
$tiangan.indexOf($("#rigan").html())
)]);
$("#liushidz .small").html(getDzSS(ccc,$("#rigan").html()));
$("#liushi_kongwang").html(kongwang[aaa+ccc]);
$("#liushi_xingyun").html(xingyun[ccc]);
$("#liushi_zizuo").html(zizuo[aaa+ccc]);
$("#liushi_nayin").html(nayin[aaa+ccc]);
document.getElementById("xiangxiliuke1").innerHTML="<a onclick=liukeshijian('xiangxiliuke1','"+$jiazi[$yibaiesk[ccc]]+"','23','01')>"+$jiazi[$yibaiesk[ccc]]+"</a>";
document.getElementById("xiangxiliuke2").innerHTML="<a onclick=liukeshijian('xiangxiliuke2','"+$jiazi[$yibaiesk[ccc]+1]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+1]+"</a>";
document.getElementById("xiangxiliuke3").innerHTML="<a onclick=liukeshijian('xiangxiliuke3','"+$jiazi[$yibaiesk[ccc]+2]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+2]+"</a>";
document.getElementById("xiangxiliuke4").innerHTML="<a onclick=liukeshijian('xiangxiliuke4','"+$jiazi[$yibaiesk[ccc]+3]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+3]+"</a>";
document.getElementById("xiangxiliuke5").innerHTML="<a onclick=liukeshijian('xiangxiliuke5','"+$jiazi[$yibaiesk[ccc]+4]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+4]+"</a>";
document.getElementById("xiangxiliuke6").innerHTML="<a onclick=liukeshijian('xiangxiliuke6','"+$jiazi[$yibaiesk[ccc]+5]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+5]+"</a>";
document.getElementById("xiangxiliuke7").innerHTML="<a onclick=liukeshijian('xiangxiliuke7','"+$jiazi[$yibaiesk[ccc]+6]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+6]+"</a>";
document.getElementById("xiangxiliuke8").innerHTML="<a onclick=liukeshijian('xiangxiliuke8','"+$jiazi[$yibaiesk[ccc]+7]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+7]+"</a>";
document.getElementById("xiangxiliuke9").innerHTML="<a onclick=liukeshijian('xiangxiliuke9','"+$jiazi[$yibaiesk[ccc]+8]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+8]+"</a>";
document.getElementById("xiangxiliuke10").innerHTML="<a onclick=liukeshijian('xiangxiliuke10','"+$jiazi[$yibaiesk[ccc]+9]+"','23','01')>"+$jiazi[$yibaiesk[ccc]+9]+"</a>";
liukeshijian('xiangxiliuke2',$jiazi[$yibaiesk[ccc]+1],'23','01');
dtgjtjhq(4);
}


//刑冲合穿破
function tgdzly(tg1,tg2){
var tglineArr=tg1;
for(var item of liuyi){
let tmpArr=[...tglineArr],result='';
for(let j=0;j<item[0].length;j++){
let iArr=tmpArr.indexOf(item[0][j]);
if(iArr>=0)
result+=tmpArr.splice(iArr,1)[0];}
if(result==item[0])
document.querySelector(tg2).innerHTML+="<a onclick=sc('wd','"+item[0]+item[1]+"')>"+item[0]+item[1]+"</a>;";}}

//本命动态刑冲
function yjxianyin(a){
let arr=['wxianyin','xxianyin','shenxianyin','taixianyin','mingxianyin'];
for(let b of arr){
for (let i=1;i<11;i++){$("#"+b+i).hide();
}}
if(a!='sxianyin'){
for (let i=1;i<11;i++){
$("#"+a+i).show();
}}
$("#bm_tgliuyi").html('');
$("#bm_dzliuyi").html('');
$vvttss=$("#bm_tglines .big").map((i,v)=>v.innerText).get();
$vvttsss=$("#bm_dzlines .big").map((i,v)=>v.innerText).get();
acc=[];
accc=[];
if(a=='shenxianyin'){
acc[0]=$vvttss[0];
accc[0]=$vvttsss[0];}
if(a=='mingxianyin'){
acc[1]=$vvttss[1];
accc[1]=$vvttsss[1];}
if(a=='taixianyin'){
acc[2]=$vvttss[2];
accc[2]=$vvttsss[2];}
if(a=='xxianyin'){
acc[3]=$vvttss[3];
accc[3]=$vvttsss[3];}
if(a=='wxianyin'){
acc[8]=$vvttss[8];
accc[8]=$vvttsss[8];}
acc[4]=$vvttss[4];
accc[4]=$vvttsss[4];
acc[5]=$vvttss[5];
accc[5]=$vvttsss[5];
acc[6]=$vvttss[6];
accc[6]=$vvttsss[6];
acc[7]=$vvttss[7];
accc[7]=$vvttsss[7];




tgdzly(acc,"#bm_tgliuyi");
tgdzly(accc,"#bm_dzliuyi");
}
yjxianyin('sxianyin');


//流运留意变化
function tiangandizhiliuyi(){
$("#tgliuyi").html('');
$("#dzliuyi").html('');
$vvttss=$("#tgline .big").map((i,v)=>v.innerText).get();
$vvttsss=$("#dzline .big").map((i,v)=>v.innerText).get();
acc=[];
accc=[];
let arr=['liunianshenshaa','liunianyunshi','dayunshenshaa','liuyueshenshaa','liurishenshaa','liushishenshaa','liukeshenshaa','dayunliunian','xipanliuyue','xipanliuri','xipanliushi','xipanliuyun','xipanliuke','dayunliunianc','dayunage','liunianage','liuyueage','liuriage','liushiage','dayundzs','liuniandzs','liuyuedzs','liuridzs','liushidzs','dayun_kongwang','liunian_kongwang','liuyue_kongwang','liuri_kongwang','liushi_kongwang','dayun_xingyun','liunian_xingyun','liuyue_xingyun','liuri_xingyun','liushi_xingyun','dayun_zizuo','liunian_zizuo','liuyue_zizuo','liuri_zizuo','liushi_zizuo','dayun_nayin','liunian_nayin','liuyue_nayin','liuri_nayin','liushi_nayin','dayuntgs','liuniantgs','liuyuetgs','liuritgs','liushitgs','liuyunbt','liunianbt','liuyuebt','liuribt','liushibt','col1','col2','col3','col4','col5'];
for(let b of arr){
$("#"+b).hide();
}


acc[4]=$vvttss[4];
accc[4]=$vvttsss[4];
$("#dayunshenshaa").show();
$("#xipanliuyun").show();
$("#dayunage").show();
$("#dayuntgs").show();
$("#dayundzs").show();
$("#dayun_kongwang").show();
$("#dayun_xingyun").show();
$("#dayun_zizuo").show();
$("#dayun_nayin").show();
$("#liuyunbt").show();
$("#col1").show();


if($("#liuyinian").get(0).checked){
acc[3]=$vvttss[3];
accc[3]=$vvttsss[3];
$("#liunianshenshaa").show();
$("#liunianyunshi").show();
$("#dayunliunian").show();
$("#liunianage").show();
$("#liuniantgs").show();
$("#liuniandzs").show();
$("#liunian_kongwang").show();
$("#liunian_xingyun").show();
$("#liunian_zizuo").show();
$("#liunian_nayin").show();

$("#liunianbt").show();
$("#col2").show();
$("#dayunliunianc").show();
document.getElementById("liuyiyue").disabled=false;
}else{document.getElementById('ln').value='';
document.getElementById("liuyiyue").checked=false;
document.getElementById("liuyiyue").disabled=true;
document.getElementById("liuyiri").checked=false;
document.getElementById("liuyiri").disabled=true;
document.getElementById("liuyishi").checked=false;
document.getElementById("liuyishi").disabled=true;
document.getElementById("liuyike").checked=false;
document.getElementById("liuyike").disabled=true;
}

if($("#liuyiyue").get(0).checked){
acc[2]=$vvttss[2];
accc[2]=$vvttsss[2];
$("#liuyueshenshaa").show();
$("#xipanliuyue").show();
$("#liuyueage").show();
$("#liuyuetgs").show();
$("#liuyuedzs").show();
$("#liuyue_kongwang").show();
$("#liuyue_xingyun").show();
$("#liuyue_zizuo").show();
$("#liuyue_nayin").show();

$("#liuyuebt").show();
$("#col3").show();
document.getElementById("liuyiri").disabled=false;
}else{document.getElementById('ly').value='';
document.getElementById("liuyiri").checked=false;
document.getElementById("liuyiri").disabled=true;
document.getElementById("liuyishi").checked=false;
document.getElementById("liuyishi").disabled=true;
document.getElementById("liuyike").checked=false;
document.getElementById("liuyike").disabled=true;
}

if($("#liuyiri").get(0).checked){
acc[1]=$vvttss[1];
accc[1]=$vvttsss[1];
$("#liurishenshaa").show();
$("#xipanliuri").show();
$("#liuriage").show();
$("#liuritgs").show();
$("#liuridzs").show();
$("#liuri_kongwang").show();
$("#liuri_xingyun").show();
$("#liuri_zizuo").show();
$("#liuri_nayin").show();

$("#liuribt").show();
$("#col4").show();
document.getElementById("liuyishi").disabled=false;
}else{document.getElementById('lr').value='';
document.getElementById("liuyishi").checked=false;
document.getElementById("liuyishi").disabled=true;
document.getElementById("liuyike").checked=false;
document.getElementById("liuyike").disabled=true;
}

if($("#liuyishi").get(0).checked){
acc[0]=$vvttss[0];
accc[0]=$vvttsss[0];
$("#liushishenshaa").show();
$("#xipanliushi").show();
$("#liushiage").show();
$("#liushitgs").show();
$("#liushidzs").show();
$("#liushi_kongwang").show();
$("#liushi_xingyun").show();
$("#liushi_zizuo").show();
$("#liushi_nayin").show();

$("#liushibt").show();
$("#col5").show();
$('#liuyike').attr('disabled',false);
}else{document.getElementById('ls').value='';
document.getElementById("liuyike").checked=false;
document.getElementById("liuyike").disabled=true;


}

if($("#liuyike").get(0).checked){
$("#liukeshenshaa").show();
$("#xipanliuke").show();
}else{document.getElementById('lk').value='';}



acc[5]=$vvttss[5];
acc[6]=$vvttss[6];
acc[7]=$vvttss[7];
acc[8]=$vvttss[8];
accc[5]=$vvttsss[5];
accc[6]=$vvttsss[6];
accc[7]=$vvttsss[7];
accc[8]=$vvttsss[8];
tgdzly(acc,"#tgliuyi");
tgdzly(accc,"#dzliuyi");
}

tgdzly("#bm_tglines .big","#bm_tgliuyi");
tgdzly("#bm_dzlines .big","#bm_dzliuyi");


//细盘流日干支点击事件
$(".liuri-box").on("click","span",function(e){
$(this).css('backgroundColor','#999').siblings().css('backgroundColor','');
var d=Lunar.fromDate(new Date($(e.target).attr("date")));
var _tiangan=$(this).html()[0]
var _dizhi=$(this).html()[1]
$("#liuritg .big").html(_tiangan).css('color',tgdzColor[_tiangan]);
$("#liuridz .big").html(_dizhi).css('color',tgdzColor[_dizhi]);
//流日空亡
$("#liuri_kongwang").html(kongwang[_tiangan+_dizhi]);
$("#liuri_xingyun").html(xingyun[_dizhi]);
$("#liuri_zizuo").html(zizuo[_tiangan+_dizhi]);
$("#liuri_nayin").html(nayin[_tiangan+_dizhi]);
$("#liuritg .small").html($ssShorter[getShishen(
$tiangan.indexOf(_tiangan),
$tiangan.indexOf($("#rigan").html())
)]);
$("#liuridz .small").html(getDzSS(_dizhi,$("#rigan").html()));
$("#liuriage").html(d.getDayInChinese()+"<br>"+d.getSolar().getDay()+"日");
$("#liuyueage").html(d.getMonthInChinese()+"月<br>"+Math.abs(d.getSolar().getMonth())+"月");//修复月份变化
var liunianageValue = $("#liunianage").html();
var extractedNumber = parseInt(liunianageValue);
$("#liunianage").html(extractedNumber+"岁<br>"+d.getSolar().getYear());
//流日神煞
$("#liurishensha").html(shensha[_tiangan+_dizhi]);
document.getElementById('lr').value=_tiangan+_dizhi;

document.getElementById("xiangxiliushi1").innerHTML="<a onclick=liushishijian('xiangxiliushi1','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][0]]+"','子','23','01')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][0]]+'子'+"</a>";
document.getElementById("xiangxiliushi2").innerHTML="<a onclick=liushishijian('xiangxiliushi2','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][1]]+"','丑','01','03')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][1]]+'丑'+"</a>";
document.getElementById("xiangxiliushi3").innerHTML="<a onclick=liushishijian('xiangxiliushi3','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][2]]+"','寅','03','05')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][2]]+'寅'+"</a>";
document.getElementById("xiangxiliushi4").innerHTML="<a onclick=liushishijian('xiangxiliushi4','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][3]]+"','卯','05','07')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][3]]+'卯'+"</a>";
document.getElementById("xiangxiliushi5").innerHTML="<a onclick=liushishijian('xiangxiliushi5','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][4]]+"','辰','07','09')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][4]]+'辰'+"</a>";
document.getElementById("xiangxiliushi6").innerHTML="<a onclick=liushishijian('xiangxiliushi6','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][5]]+"','巳','09','11')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][5]]+'巳'+"</a>";
document.getElementById("xiangxiliushi7").innerHTML="<a onclick=liushishijian('xiangxiliushi7','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][6]]+"','午','11','13')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][6]]+'午'+"</a>";
document.getElementById("xiangxiliushi8").innerHTML="<a onclick=liushishijian('xiangxiliushi8','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][7]]+"','未','13','15')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][7]]+'未'+"</a>";
document.getElementById("xiangxiliushi9").innerHTML="<a onclick=liushishijian('xiangxiliushi9','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][8]]+"','申','15','17')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][8]]+'申'+"</a>";
document.getElementById("xiangxiliushi10").innerHTML="<a onclick=liushishijian('xiangxiliushi10','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][9]]+"','酉','17','19')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][9]]+'酉'+"</a>";
document.getElementById("xiangxiliushi11").innerHTML="<a onclick=liushishijian('xiangxiliushi11','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][0]]+"','戌','19','21')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][0]]+'戌'+"</a>";
document.getElementById("xiangxiliushi12").innerHTML="<a onclick=liushishijian('xiangxiliushi12','"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][1]]+"','亥','21','23')>"+$tiangan[$liuri[SZWZ($tiangan,_tiangan)][1]]+'亥'+"</a>";
xiangxiliushi13d=SZWZ($tiangan,_tiangan)==9?SZWZ($tiangan,_tiangan)-9:SZWZ($tiangan,_tiangan)+1;
document.getElementById("xiangxiliushi13").innerHTML="<a onclick=liushishijian('xiangxiliushi13','"+$tiangan[$liuri[xiangxiliushi13d][0]]+"','子','23','01')>"+$tiangan[$liuri[xiangxiliushi13d][0]]+'子'+"</a>";
liushishijian('xiangxiliushi1',$tiangan[$liuri[SZWZ($tiangan,_tiangan)][0]],'子','23','01');//流日改变变更流时
dtgjtjhq(3);
})

//细盘流月干支点击事件
$("#xipanliuyue tr:eq(1) td").click(function(e){
var start=end=''
if(!e.target.getAttribute("jieqi-start")){
if(!$(e.target).parent().attr("jieqi-start")){
return}
start=$(e.target).parent().attr("jieqi-start")
end=$(e.target).parent().attr("jieqi-end")
$(e.target).parent().css('backgroundColor','#999').siblings().css('backgroundColor','');
}else{
start=e.target.getAttribute("jieqi-start")
end=e.target.getAttribute("jieqi-end")
$(e.target).css('backgroundColor','#999').siblings().css('backgroundColor','');}
var _tiangan=$(this).find('span:eq(0)').html()
var _dizhi=$(this).find('span:eq(1)').html()
$("#liuyuetg .big").html(_tiangan).css('color',tgdzColor[_tiangan]);
$("#liuyuedz .big").html(_dizhi).css('color',tgdzColor[_dizhi]);
//流月空亡
$("#liuyue_kongwang").html(kongwang[_tiangan+_dizhi]);
$("#liuyue_xingyun").html(xingyun[_dizhi]);
$("#liuyue_zizuo").html(zizuo[_tiangan+_dizhi]);
$("#liuyue_nayin").html(nayin[_tiangan+_dizhi]);
$("#liuyuetg .small").html($ssShorter[getShishen(
$tiangan.indexOf(_tiangan),
$tiangan.indexOf($("#rigan").html())
)]);
$("#liuyuedz .small").html(getDzSS(_dizhi,$("#rigan").html()));
var d=Lunar.fromDate(new Date(start))
$("#liuyueage").html(d.getMonthInChinese()+"月<br>"+Math.abs(d.getSolar().getMonth())+"月");
//流月神煞
$("#liuyueshensha").html(shensha[_tiangan+_dizhi]);
document.getElementById('ly').value=_tiangan+_dizhi;

//更换当月的流日
$(".swiper-slide").html("&nbsp;");
$(".swiper-slide").removeClass("kong");
var i=0;
var dateTime=new Date(start);
while(dateTime.getTime()<new Date(end).getTime()){
var d=Lunar.fromDate(dateTime);
$(".swiper-slide:eq("+i+")").html(d.getDayInGanZhi()).attr("date",d.getSolar().toYmd());
i++;
dateTime=new Date(dateTime.setDate(dateTime.getDate()+1));}
var swiper=new Swiper('.swiper-container',{
slidesPerView:'auto',
});
$(".swiper-wrapper").css("transform","translate3d(0px,0px,0px)");

//根据所选择的流月，自动选择对应的流日，以触发流日点击事件
var d=Solar.fromDate(new Date());
day=$(".liuri-box").find('[date='+d.toYmd()+']');
if(day.length>0){
day.click();
}else{
$(".liuri-box").find('span:eq(0)').click();}
dtgjtjhq(2);
})

//细盘流年干支点击事件
$("#dayunliunian tr:eq(1) td").click(function(e){
if(!e.target.getAttribute("year"))
return;
$(e.target).css('backgroundColor','#999').siblings().css('backgroundColor','');
$("#liuniantg .big").html(e.target.innerHTML[0]).css('color',tgdzColor[e.target.innerHTML[0]]);
$("#liuniandz .big").html(e.target.innerHTML[1]).css('color',tgdzColor[e.target.innerHTML[1]]);
//流年空亡
$("#liunian_kongwang").html(kongwang[e.target.innerHTML]);
var sesx=e.target.innerHTML.slice(1);
$("#liunian_xingyun").html(xingyun[sesx]);
$("#liunian_zizuo").html(zizuo[e.target.innerHTML]);
$("#liunian_nayin").html(nayin[e.target.innerHTML]);
$("#liuniantg .small").html($ssShorter[getShishen(
$tiangan.indexOf(e.target.innerHTML[0]),
$tiangan.indexOf($("#rigan").html())
)]);
$("#liuniandz .small").html(getDzSS(e.target.innerHTML[1],$("#rigan").html()));
$("#liunianage").html($(e.target).attr("age")+"岁<br>"+$(e.target).attr("year"));
//更换当年的流月干
var i=(parseInt($(e.target).attr("year"))-1911)%5;
var yuegan=[];
yuegan.push(...$yuegan1911.slice(2*i));
yuegan.push(...$yuegan1911.slice(0,2*i));
yuegan.push(...yuegan.slice(0,2));
$("#liuyuegan").children(":gt(0)").each(function(i,v){
$(v).find(".vl span:eq(1)").html(yuegan[i]).css('color',tgdzColor[yuegan[i]]);
$(v).find(".vl span:eq(0)").html($ssShorter[getShishen(
$tiangan.indexOf(yuegan[i]),
$tiangan.indexOf($("#rigan").html())
)]);
})
//流年神煞
$("#liunianshensha").html(shensha[e.target.innerHTML]);
document.getElementById('ln').value=e.target.innerHTML;

//显示流年对应的流月
var year=parseInt($(e.target).attr("year"));
document.getElementById("zytdyqr").innerHTML='<td>天运：'+LNTDY[year][0]+'</td><td>地运：'+LNTDY[year][1]+"</td><td>动态强弱分析：<font color='#993300'><a id='nbtsc' onclick=alert('共七种强弱状态:\\n均衡:喜忌比较麻烦,随着流年大运变化\\n偏弱:喜生助,忌克泄耗\\n偏强:喜克泄耗,忌生助\\n强:喜克泄耗变偏强,大忌生助变从强\\n弱:喜生助变偏弱,大忌克泄耗变从弱\\n从强:物极必反反倒为弱,喜生助,大忌流年破格合化克泄耗\\n从弱:物极必反反倒为强,喜克泄耗,大忌流年破格合化生助\\n综上所述供格局取用参考')></a></font></td>";
var jieqi=Lunar.fromYmd(year,6,1).getJieQiTable();
$("#xipanliuyue tr:eq(1) td:gt(0)").each(function(i,v){
var spanTian=$("<span>"+yuegan[i]+"</span>").css('color',tgdzColor[yuegan[i]]);
if((i+3)>11){
var spanDi=$("<span>"+$dizhi[i+3-12]+"</span>").css('color',tgdzColor[$dizhi[i+3-12]]);
}else{
var spanDi=$("<span>"+$dizhi[i+3]+"</span>").css('color',tgdzColor[$dizhi[i+3]]);}
$("#xipanliuyue tr:eq(1) td:eq("+(i+1)+")").attr('jieqi-start',jieqi[$jie[i]].toYmd()).attr('jieqi-end',jieqi[$jie[i+1]].toYmd()).empty().append(spanTian).append(spanDi);
})

//根据所选择的流年，自动选择对应的流月，以触发流月点击事件
var d=Lunar.fromDate(new Date());
var oJie=d.getCurrentJie()?d.getCurrentJie():d.getPrevJie();
month=$("#xipanliuyue").find('[jieqi-start='+oJie.getSolar().toYmd()+']');
if(month.length>0){
month.click();
}else{
$("#xipanliuyue").find('tr:eq(1) td:eq(1)').click();}
dtgjtjhq(1);
})
//细盘大运干支点击事件
ggs=0;
$("#xipandayungz td").click(function(e){
if(!e.target.dataset['year'])
return;
//显示大运对应的流年
var year=parseInt(e.target.dataset['year']);
var yearr=e.target.dataset['yearr'];



$(this).css('backgroundColor','#999').siblings().css('backgroundColor','');



for(var i=0;i<10;i++){
$("#dayunliunian tr:eq(0) td:eq("+(i+1)+")").html(year+i);
$("#dayunliunian tr:eq(1) td:eq("+(i+1)+")")
.html(dayunliunianData[(year+i)]).attr('year',year+i)
.attr('age',parseInt(e.target.dataset["age"])+i);
$("#dayunliunianc tr:eq(0) td:eq("+(i+1)+")").html(dayunliuniancData[(year+i)]).attr('year',year+i).attr('age',parseInt(e.target.dataset["age"])+i);

if(yearr=='小运'){
ccc=DYKSNF-year;
if(ccc<i){
$("#dayunliunian tr:eq(0) td:eq("+(i+1)+")").html('');
$("#dayunliunian tr:eq(1) td:eq("+(i+1)+")")
.html('').attr('year','')
.attr('age','');
$("#dayunliunianc tr:eq(0) td:eq("+(i+1)+")").html('').attr('year','').attr('age','');
}
}
}
document.getElementById('liuyunbt').innerHTML='大运';
zdyddtd=e.target.innerHTML;
if(yearr=='小运'){
document.getElementById('liuyunbt').innerHTML='小运';
zdyddtd=XYKSNF;
}


$("#dayuntg .big").html(zdyddtd[0]).css('color',tgdzColor[zdyddtd[0]]);
$("#dayundz .big").html(zdyddtd[1]).css('color',tgdzColor[zdyddtd[1]]);
//大运空亡

$("#dayun_kongwang").html(kongwang[zdyddtd]);
var sesx=zdyddtd.slice(1);
$("#dayun_xingyun").html(xingyun[sesx]);
$("#dayun_zizuo").html(zizuo[zdyddtd]);
$("#dayun_nayin").html(nayin[zdyddtd]);
//显示大运天干地支


$("#dayuntg .small").html($ssShorter[getShishen(
$tiangan.indexOf(zdyddtd[0]),
$tiangan.indexOf($("#rigan").html())
)]);
$("#dayundz .small").html(getDzSS(zdyddtd[1],$("#rigan").html()));



//显示大运岁数
if(document.getElementById('system.PPFS').innerText=='名人案例'){$("#dayunage").html(e.target.dataset["age"]+"岁<br>*");
}else{$("#dayunage").html(e.target.dataset["age"]+"岁<br>"+e.target.dataset["year"]);}
//大运神煞
$("#dayunshensha").html(shensha[zdyddtd]);
document.getElementById('ld').value=zdyddtd;

//根据所选择的大运，自动选择对应的流年，以触发流年点击事件
$year=$("#dayunliunian").find('[year='+currentYear+']');
if($year.length>0){
$year.click();
}else{
$s=$("#dayunliunian").find('tr:eq(1) td:eq(1)').click();}

}).each(function(i){
//找到今年命主所处的大运

if(currentYear >=parseInt(this.dataset['year']) && currentYear-parseInt(this.dataset['year']) < 10) {
this.click();
ggs=1;
}else{
if(i==9&&ggs==0){
this.click();
}
}
//自动获取当前时间作为大运靶点
})


//获取十神
function getShishen($tgans,$ritgs){
if($ritgs==0)$ritgs=10;
if($tgans==0)$tgans=10;
var $cha=$ritgs-$tgans,$str='';
if($cha>=0){
switch($cha){
case 0:$str="比肩";break;
case 1:
if($ritgs%2==0){$str="劫财";}else{$str="正印";}
break;
case 2:$str="偏印";break;
case 3:
if($ritgs%2==0){$str="正印";}else{$str="正官";}
break;
case 4:$str="七杀";break;
case 5:
if($ritgs%2==0){$str="正官";}else{$str="正财";}
break;
case 6:$str="偏财";break;
case 7:
if($ritgs%2==0){$str="正财";}else{$str="伤官";}
break;
case 8:$str="食神";break;
case 9:$str="伤官";break;}
}else{
switch(Math.abs($cha)){
case 1:
if($ritgs%2==1){$str="劫财";}else{$str="伤官";}
break;
case 2:$str="食神";break;
case 3:
if($ritgs%2==1){$str="伤官";}else{$str="正财";}
break;
case 4:$str="偏财";break;
case 5:
if($ritgs%2==1){$str="正财";}else{$str="正官";}
break;
case 6:$str="七杀";break;
case 7:
if($ritgs%2==1){$str="正官";}else{$str="正印";}
break;
case 8:$str="偏印";break;
case 9:$str="正印";break;}}
return $str;}

//获取地支藏干十神
function getDzSS($dz,$rg){
var $arr=["壬甲","癸","己癸辛","甲丙戊","乙","戊乙癸","丙戊庚","丁己","己丁乙","庚壬戊","辛","戊辛丁"];
var $cgs=$arr[$dizhi.indexOf($dz)];
var $ss='';
var $i=0;
while(true){
var $cg=$cgs[$i++];
if(!$cg)
break;
$ss+=$ssShorter[getShishen($tiangan.indexOf($cg),$tiangan.indexOf($rg))];}
return $ss;}



$(document).ready(function() {
 $('.js-example-basic-single').select2({
minimumResultsForSearch: Infinity
});
});
</script>


<style type="text/css">
data:text/css,html,body,a,div,p,img,textarea{-webkit-touch-callout:text!important;-webkit-user-select:text!important;user-select:text!important}
iframe { width: 100%; height:100%; border: 0; overflow: hidden; flex: 1; }
</style>