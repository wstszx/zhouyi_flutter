<meta name='keywords' content='八字排盘,四柱排盘,八字排盘系统,在线八字排盘,排八字,在线排八字,八字,命理,国学,算卦,排盘,易经,六十四卦,奇门,命运,运势,测算,姻缘,婚姻'/><meta charset='UTF-8'>
<meta name='Description' content='墨家国学可提供八字排盘免费详批，八字排盘算命是一种根据八字用天干地支表示人出生的年、月、日、时，依照查四柱间之五行生克制化、刑冲会合为推命重点，生辰八字排盘免费查询，小到性格、大到发展都能够从这上面看出端倪一二，八字在线排盘，让你提前知晓一生命格。'/>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>八字排盘v3.0</title>
<a href='/' style='text-decoration:none;' target='_blank'><h2 style='text-align:center;color:#CC0000;'>八字排盘v3.0</h2></a>


<link type='text/css' href='date/smcsss.css' rel='stylesheet' />
<link rel='stylesheet' href='date/rui_date2.css'>
<script type='text/javascript' src='date/date/jquery.min3.7.1.js'></script>
<link href="date/date/select2.min4.0.8.css" rel="stylesheet" />
<script src="date/date/select2.min4.0.8.js"></script>
<script type="text/javascript" src='date/chooseDate.js'></script>
<script type="text/javascript" src='date/rui_date4.js'></script>
<script type="text/javascript" language='javascript' src='date/diqu.js'></script>
<script type="text/javascript" language='javascript' src='date/diqu160.js'></script>
<style>
demoInput{
width: 100%;
max-width: 255px;
height: 18px;
border:1px solid #ccc;
text-align: center;
border-radius: 5px;
padding:5px 10px;
box-sizing: border-box;
-webkit-box-sizing: border-box;}
.div1 {float: left;}.div2 {float: left;}
</style>

<div class='smnr'>
<form name='theform' method='get' action='show.php'>
<input type='hidden' name='act' value='ok' />
<table class='form-table' border='0' align='center' cellpadding='1' cellspacing='1'>
<tr>
<td class='tdleft tdbg'>命主信息：</td>
<td class='bghuang'>姓名：<input name='name' autocomplete='off' type='text' id='name' size='18' ></td>
</tr>
<tr>
<td class='tdleft tdbg'>起盘方式：</td>
<td class='bghuang'>
<input id=DateType1 type='radio' name='DateType' value='5' onClick="JavaScript:bazi.style.display='none';gongli.style.display='block';supaia.style.display='none';" checked/>
<label for='DateType1' style='cursor:hand;'>日期排盘</label>
<input id=DateType2 type='radio' name='DateType' value='4' onClick="JavaScript:gongli.style.display='none';bazi.style.display='block';supaia.style.display='none';">
<label for='DateType2' style='cursor:hand;'>八字反推</label>
<input id=DateType3 type='radio' name='DateType' value='7' onClick="JavaScript:gongli.style.display='none';bazi.style.display='none';supaia.style.display='block';" >
<label for='DateType3' style='cursor:hand;'>公历速排</label>
</td>
</tr>
<tr>
<td class='tdleft tdbg'>出生时间：</td>
<td class='bghuang'>
<div id='gongli' style='display:block'>
<div class='date_input'>
<!-- <p class='input pinput'></p> -->
<input id='demo2' class='demoInput' type='text' data-toid-date='date1' data-toid-hour='hour1' data-toid-minute='minute1'
name='inputdate' placeholder='请选择时间' readonly='readonly' style='width:70%' />
<input type='hidden' id='date1'>
<input type='hidden' id='hour1'>
<input type='hidden' id='minute1'>

</div>
<div class='desc'></div>
</div>
<div id='bazi' style='display:none'>
<select name='ng' class="js-example-basic-single" style='font-size: 9pt' id='ng' style='width:20%' onchange="city('yg')"></select><select name='yg' class="js-example-basic-single" style='width:20%' style='font-size: 9pt' id='yg'></select><select name='rg' class="js-example-basic-single" style='font-size: 9pt' id='rg' style='width:20%' onchange="city('sg')"></select><select name='sg' class="js-example-basic-single" style='font-size: 9pt' id='sg' style='width:20%'></select>
</div>
<div id='supaia' style='display:none'>
<input name='supai' autocomplete='off' type='number' size='12' placeholder='格式 199904240230'>
</div>
</td>
</tr>
<tr>
<td class='tdleft tdbg'>命主性别:</td>
<td class='bghuang'>
<input name='sex' type='radio' value='0' checked>男
<input type='radio' name='sex' value='1'>女 （
<font color='red'>排盘结果男女有别，请正确选择</font>）
</td>
</tr>
<tr>
<td class='tdleft tdbg'>出生地：</td>
<td class='bghuang'>
<select name='city1' style='width:25%' style='font-size: 3pt' class="js-example-basic-single" id='city1'></select>
<select id='city2' style='width:30%' style='font-size: 3pt' class="js-example-basic-single" name='city2'></select>
<select id='city3' style='width:30%' style='font-size: 3pt' class="js-example-basic-single" name='city3'></select>
</td>
</tr>
<tr>
<td class='tdleft tdbg'>夏令时:</td>
<td class='bghuang'>
<input type='radio' name='xls' id='xlsy' value='1'>是
<input name='xls' type='radio' id='xlsn' value='0' checked>否 <a onclick=alert('夏令时，又称日光节约时制，是国家为了节约能源人为规定的时间制度，在制度的实行期间所采用的时间称之为“夏令时”。也就是在夏季到来前时间多加1小时，冬季到来之前恢复原来时间。目前全球有110多个国家使用夏令时制，大多集中在欧美地区，我国只实行了6年夏令时，于1986年—1991年结束。')>
<font color='red'>？</font></a>
</td>
</tr>
<tr>
<td class='tdleft tdbg'>晚子时:</td>
<td class='bghuang'>
<input type='radio' name='Sect' value='1' checked>按明天(默认)
<input name='Sect' type='radio' value='2'>按当天<a onclick=alert('我国古代流传下来的八字预测术（包括紫微斗数、奇门等）是以日子、时辰作为原始信息载体进行输入并参与演算、分析和推理的，由于存在着子时归属不确定而导致测不准的问题，因此在八字预测领域存在不少关于“子时”的争议，便有了“早子时”和“晚子时”，以及“神仙难断子时命”的说法，延伸出了关于界定分日起点的争论性问题：究竟是以子时之初（即晚上23点整）作为一日之始，还是按照现代历法所规定的那样将子时一分为二，以子半（即凌晨0点整）作为一日之始？所以推出了手动选择，供详细参考。')>
<font color='red'>？</font></a>
</td>
</tr>
<tr>
<td class='tdleft tdbg'>京时换算:</td>
<td class='bghuang'>
<input type='radio' name='bjhs' id='bjhsy' value='1'>是
<input name='bjhs' type='radio' id='bjhsn' value='0' checked>否 <a onclick=alert('国外出生的人，八字用北京时间还是当地时间来排？目前持有有两种观点：\n第一种观点，是以邵先生为首的一派：\n认同国外出生的时间需要换算成北京时间。因为四柱干支是中国人发明的，所以不管是国内还是国外，一律以北京时间为准。\n第二种观点，是以徐乐吾、韦千里等前辈为首的一派：\n认为古人利用太阳的投影来测定并划分时刻，并没有时区和统一时区的概念，而在运用四柱八字等术数时，都是以太阳定时。所以即便在国外出生，也应当要沿用地方真太阳时才合理，这符合自然界的真实时间。\n若结合现代来说，第二种观点更合乎天文地理学科的理论和逻辑，因此，当下无论出生于哪个国家（北半球），大家都主流使用当地真太阳时。这里为了配合爱好者的使用，默认“关闭”换算北京时间按钮。')>（
<font color='red'>仅在海外地区生效</font>）</a>
</td>
</tr>
</table>
<table class='form-table' border='0' align='center' cellpadding='1' cellspacing='1'>
<td class='bghuang'>
<div align='center'>
<input type='submit' value='开始排盘' class='sub_m' onclick="return _submit()" />
</div>
</td>
<input type='hidden' name='bcxx' value='0'>
</form>
</table>

</div>

<script type="text/javascript">
function _submit(){return document.getElementById("DateType1").checked && document.getElementById("demo2").value==''?(alert("日期选择不正确，请重新选择！"),false):true;}
</script>

