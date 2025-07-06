function city(gg){
if(gg=='yg'){
var ng=document.getElementById("ng").value;
ng=ng.substring(0,1);
yz=["寅","卯","辰","巳","午","未","申","酉","戌","亥","子","丑"];
var lng={
"甲":["丙","丁","戊","己","庚","辛","壬","癸","甲","乙","丙","丁"],
"己":["丙","丁","戊","己","庚","辛","壬","癸","甲","乙","丙","丁"],
"乙":["戊","己","庚","辛","壬","癸","甲","乙","丙","丁","戊","己"],
"庚":["戊","己","庚","辛","壬","癸","甲","乙","丙","丁","戊","己"],
"丙":["庚","辛","壬","癸","甲","乙","丙","丁","戊","己","庚","辛"],
"辛":["庚","辛","壬","癸","甲","乙","丙","丁","戊","己","庚","辛"],
"丁":["壬","癸","甲","乙","丙","丁","戊","己","庚","辛","壬","癸"],
"壬":["壬","癸","甲","乙","丙","丁","戊","己","庚","辛","壬","癸"],
"戊":["甲","乙","丙","丁","戊","己","庚","辛","壬","癸","甲","乙"],
"癸":["甲","乙","丙","丁","戊","己","庚","辛","壬","癸","甲","乙"]
};
document.getElementById("yg").options.length=0;
for(var i=0;i< lng[ng].length;i++){var opt=new Option(lng[ng][i]+yz[i],lng[ng][i]+yz[i]);
document.getElementById("yg").options.add(opt);}
}
if(gg=='sg'){
var ng=document.getElementById("rg").value;
ng=ng.substring(0,1);
sz=["子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"];
var lrg={
"甲":["甲","乙","丙","丁","戊","己","庚","辛","壬","癸","甲","乙"],
"己":["甲","乙","丙","丁","戊","己","庚","辛","壬","癸","甲","乙"],
"乙":["丙","丁","戊","己","庚","辛","壬","癸","甲","乙","丙","丁"],
"庚":["丙","丁","戊","己","庚","辛","壬","癸","甲","乙","丙","丁"],
"丙":["戊","己","庚","辛","壬","癸","甲","乙","丙","丁","戊","己"],
"辛":["戊","己","庚","辛","壬","癸","甲","乙","丙","丁","戊","己"],
"丁":["庚","辛","壬","癸","甲","乙","丙","丁","戊","己","庚","辛"],
"壬":["庚","辛","壬","癸","甲","乙","丙","丁","戊","己","庚","辛"],
"戊":["壬","癸","甲","乙","丙","丁","戊","己","庚","辛","壬","癸"],
"癸":["壬","癸","甲","乙","丙","丁","戊","己","庚","辛","壬","癸"]
};
document.getElementById("sg").options.length=0;
for(var i=0;i< lrg[ng].length;i++){var opt=new Option(lrg[ng][i]+sz[i],lrg[ng][i]+sz[i]);
document.getElementById("sg").options.add(opt);}
}
}

window.onload = function () {
//界面加载完成事件
function bzft(id,lj){
demoP=document.getElementById(id);
let list=['甲子','甲戌','甲申','甲午','甲辰','甲寅','乙丑','乙亥','乙酉','乙未','乙巳','乙卯','丙寅','丙子','丙戌','丙申','丙午','丙辰','丁卯','丁丑','丁亥','丁酉','丁未','丁巳','戊辰','戊寅','戊子','戊戌','戊申','戊午','己巳','己卯','己丑','己亥','己酉','己未','庚午','庚辰','庚寅','庚子','庚戌','庚申','辛未','辛巳','辛卯','辛丑','辛亥','辛酉','壬申','壬午','壬辰','壬寅','壬子','壬戌','癸酉','癸未','癸巳','癸卯','癸丑','癸亥'];
list.some(item=>{
if(item===lj){
demoP.innerHTML=demoP.innerHTML+"<option value='"+item+"' selected>"+item+"</option>";
}else{
demoP.innerHTML=demoP.innerHTML+"<option value='"+item+"'>"+item+"</option>";
}
})
}
bzft('ng','己卯');
bzft('rg','庚寅');


city('yg');
city('sg');
//八字反推



	city1.innerHTML = threeLevelLinkage();
	city2.innerHTML = threeLevelLinkage('未知地');
	city3.innerHTML = threeLevelLinkage('未知地','北京时间');

	city1.onchange = function(){
		city2.innerHTML = threeLevelLinkage(city1.value);
		city3.innerHTML = threeLevelLinkage(city1.value,city2.value);
	}
	city2.onchange = function(){
		city3.innerHTML = threeLevelLinkage(city1.value,city2.value);
	}

	function threeLevelLinkage(city1,city2){
		var city1 = city1 || '';
		var city2 = city2 || '';
		var str = '';
		if(city1 && city2){
			for(var i = 0 ; i < city2Obj[city1][city2].length ; i++){
				str += '<option value='+city2Obj[city1][city2][i]+'>'+city2Obj[city1][city2][i]+'</option>';
			}
			return str;
		}
		if(city1){
			for(var attr in city2Obj[city1]){
				str += '<option value='+attr+'>'+attr+'</option>';
			}
			return str;
		}
		for(var attr in city2Obj){
			str += '<option value='+attr+'>'+attr+'</option>';
		}
		return str;
	}
//真太阳时

var pcx = pcx || {};
pcx.dc = new Lunar(); 
var date2 = new ruiDatepicker().init('#demo2');
function tagLunarCal(d,i,w,k,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13) {
this.BaseDays = d; 
this.Intercalation = i; 
this.BaseWeekday = w; 
this.BaseKanChih = k; 
this.MonthDays = [m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,m13]; }
//日期选择
}