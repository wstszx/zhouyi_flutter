import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:zhouyi/screens/paipan_result_screen.dart';
import 'package:zhouyi/services/api_service.dart';

class ChartingScreen extends StatefulWidget {
  const ChartingScreen({super.key});

  @override
  State<ChartingScreen> createState() => _ChartingScreenState();
}

class _ChartingScreenState extends State<ChartingScreen> {
  final TextEditingController _nameController = TextEditingController();

  String _selectedGender = '男';
  DateTime? _selectedDate;
  bool _isGregorian = true;

  // 地理位置选择
  String? _selectedProvince;
  String? _selectedCity;
  String? _selectedDistrict;

  // 地理位置数据
  final Map<String, List<String>> _provinces = {
    '北京': ['北京市'],
    '天津': ['天津市'],
    '上海': ['上海市'],
    '重庆': ['重庆市'],
    '河北': ['石家庄市', '唐山市', '秦皇岛市', '邯郸市', '邢台市', '保定市', '张家口市', '承德市', '沧州市', '廊坊市', '衡水市'],
    '山西': ['太原市', '大同市', '阳泉市', '长治市', '晋城市', '朔州市', '晋中市', '运城市', '忻州市', '临汾市', '吕梁市'],
    '内蒙古': ['呼和浩特市', '包头市', '乌海市', '赤峰市', '通辽市', '鄂尔多斯市', '呼伦贝尔市', '巴彦淖尔市', '乌兰察布市'],
    '辽宁': ['沈阳市', '大连市', '鞍山市', '抚顺市', '本溪市', '丹东市', '锦州市', '营口市', '阜新市', '辽阳市', '盘锦市', '铁岭市', '朝阳市', '葫芦岛市'],
    '吉林': ['长春市', '吉林市', '四平市', '辽源市', '通化市', '白山市', '松原市', '白城市'],
    '黑龙江': ['哈尔滨市', '齐齐哈尔市', '鸡西市', '鹤岗市', '双鸭山市', '大庆市', '伊春市', '佳木斯市', '七台河市', '牡丹江市', '黑河市', '绥化市'],
    '江苏': ['南京市', '无锡市', '徐州市', '常州市', '苏州市', '南通市', '连云港市', '淮安市', '盐城市', '扬州市', '镇江市', '泰州市', '宿迁市'],
    '浙江': ['杭州市', '宁波市', '温州市', '嘉兴市', '湖州市', '绍兴市', '金华市', '衢州市', '舟山市', '台州市', '丽水市'],
    '安徽': ['合肥市', '芜湖市', '蚌埠市', '淮南市', '马鞍山市', '淮北市', '铜陵市', '安庆市', '黄山市', '滁州市', '阜阳市', '宿州市', '六安市', '亳州市', '池州市', '宣城市'],
    '福建': ['福州市', '厦门市', '莆田市', '三明市', '泉州市', '漳州市', '南平市', '龙岩市', '宁德市'],
    '江西': ['南昌市', '景德镇市', '萍乡市', '九江市', '新余市', '鹰潭市', '赣州市', '吉安市', '宜春市', '抚州市', '上饶市'],
    '山东': ['济南市', '青岛市', '淄博市', '枣庄市', '东营市', '烟台市', '潍坊市', '济宁市', '泰安市', '威海市', '日照市', '临沂市', '德州市', '聊城市', '滨州市', '菏泽市'],
    '河南': ['郑州市', '开封市', '洛阳市', '平顶山市', '安阳市', '鹤壁市', '新乡市', '焦作市', '濮阳市', '许昌市', '漯河市', '三门峡市', '南阳市', '商丘市', '信阳市', '周口市', '驻马店市'],
    '湖北': ['武汉市', '黄石市', '十堰市', '宜昌市', '襄阳市', '鄂州市', '荆门市', '孝感市', '荆州市', '黄冈市', '咸宁市', '随州市'],
    '湖南': ['长沙市', '株洲市', '湘潭市', '衡阳市', '邵阳市', '岳阳市', '常德市', '张家界市', '益阳市', '郴州市', '永州市', '怀化市', '娄底市'],
    '广东': ['广州市', '韶关市', '深圳市', '珠海市', '汕头市', '佛山市', '江门市', '湛江市', '茂名市', '肇庆市', '惠州市', '梅州市', '汕尾市', '河源市', '阳江市', '清远市', '东莞市', '中山市', '潮州市', '揭阳市', '云浮市'],
    '广西': ['南宁市', '柳州市', '桂林市', '梧州市', '北海市', '防城港市', '钦州市', '贵港市', '玉林市', '百色市', '贺州市', '河池市', '来宾市', '崇左市'],
    '海南': ['海口市', '三亚市', '三沙市', '儋州市'],
    '四川': ['成都市', '自贡市', '攀枝花市', '泸州市', '德阳市', '绵阳市', '广元市', '遂宁市', '内江市', '乐山市', '南充市', '眉山市', '宜宾市', '广安市', '达州市', '雅安市', '巴中市', '资阳市'],
    '贵州': ['贵阳市', '六盘水市', '遵义市', '安顺市', '毕节市', '铜仁市'],
    '云南': ['昆明市', '曲靖市', '玉溪市', '保山市', '昭通市', '丽江市', '普洱市', '临沧市'],
    '西藏': ['拉萨市', '日喀则市', '昌都市', '林芝市', '山南市', '那曲市'],
    '陕西': ['西安市', '铜川市', '宝鸡市', '咸阳市', '渭南市', '延安市', '汉中市', '榆林市', '安康市', '商洛市'],
    '甘肃': ['兰州市', '嘉峪关市', '金昌市', '白银市', '天水市', '武威市', '张掖市', '平凉市', '酒泉市', '庆阳市', '定西市', '陇南市'],
    '青海': ['西宁市', '海东市'],
    '宁夏': ['银川市', '石嘴山市', '吴忠市', '固原市', '中卫市'],
    '新疆': ['乌鲁木齐市', '克拉玛依市', '吐鲁番市', '哈密市'],
  };

  final Map<String, List<String>> _districts = {
    // 北京市区县
    '北京市': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '门头沟区', '房山区', '通州区', '顺义区', '昌平区', '大兴区', '怀柔区', '平谷区', '密云区', '延庆区'],
    // 天津市区县
    '天津市': ['和平区', '河东区', '河西区', '南开区', '河北区', '红桥区', '东丽区', '西青区', '津南区', '北辰区', '武清区', '宝坻区', '滨海新区', '宁河区', '静海区', '蓟州区'],
    // 上海市区县
    '上海市': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '虹口区', '杨浦区', '闵行区', '宝山区', '嘉定区', '浦东新区', '金山区', '松江区', '青浦区', '奉贤区', '崇明区'],
    // 重庆市区县
    '重庆市': ['万州区', '涪陵区', '渝中区', '大渡口区', '江北区', '沙坪坝区', '九龙坡区', '南岸区', '北碚区', '綦江区', '大足区', '渝北区', '巴南区', '黔江区', '长寿区', '江津区', '合川区', '永川区', '南川区', '璧山区', '铜梁区', '潼南区', '荣昌区', '开州区', '梁平区', '武隆区'],
    // 主要城市的区县（示例）
    '广州市': ['荔湾区', '越秀区', '海珠区', '天河区', '白云区', '黄埔区', '番禺区', '花都区', '南沙区', '从化区', '增城区'],
    '深圳市': ['罗湖区', '福田区', '南山区', '宝安区', '龙岗区', '盐田区', '龙华区', '坪山区', '光明区', '大鹏新区'],
    '杭州市': ['上城区', '拱墅区', '西湖区', '滨江区', '萧山区', '余杭区', '临平区', '钱塘区', '富阳区', '临安区', '桐庐县', '淳安县', '建德市'],
    '南京市': ['玄武区', '秦淮区', '建邺区', '鼓楼区', '浦口区', '栖霞区', '雨花台区', '江宁区', '六合区', '溧水区', '高淳区'],
    '成都市': ['锦江区', '青羊区', '金牛区', '武侯区', '成华区', '龙泉驿区', '青白江区', '新都区', '温江区', '双流区', '郫都区', '新津区'],
    '西安市': ['新城区', '碑林区', '莲湖区', '灞桥区', '未央区', '雁塔区', '阎良区', '临潼区', '长安区', '高陵区', '鄠邑区', '蓝田县', '周至县'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景图片
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              const SizedBox(height: 80),
              const Center(
                child: Text(
                  '新建排盘',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513)),
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField(context, '姓名', '请输入姓名', _nameController),
              _buildDropdownField(context, '性别', ['男', '女']),
              _buildDateField(context, '生辰', '年、月、日、时'),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.only(bottom: 4.0, left: 4.0),
                child: Text(
                  '地理位置（用于真太阳时计算）',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF8B4513),
                  ),
                ),
              ),
              _buildLocationDropdown('省/市', _selectedProvince, _provinces.keys.toList(), (value) {
                setState(() {
                  _selectedProvince = value;
                  _selectedCity = null;
                  _selectedDistrict = null;
                });
              }),
              if (_selectedProvince != null)
                _buildLocationDropdown('城市', _selectedCity, _provinces[_selectedProvince!] ?? [], (value) {
                  setState(() {
                    _selectedCity = value;
                    _selectedDistrict = null;
                  });
                }),
              if (_selectedCity != null && _districts.containsKey(_selectedCity!))
                _buildLocationDropdown('区/县', _selectedDistrict, _districts[_selectedCity!] ?? [], (value) {
                  setState(() {
                    _selectedDistrict = value;
                  });
                }),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Text(
                  '提示：选择地理位置可提高时间计算精度',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildActionButton(context, '排盘', () async {
                if (_nameController.text.isNotEmpty && _selectedDate != null) {
                  try {
                    // 显示加载对话框
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                    final apiService = ApiService();

                    // 格式化日期
                    final dateFormat = _isGregorian ? '公历' : '农历';
                    final formattedDate = '$dateFormat${DateFormat('yyyy年MM月dd日 HH时mm分').format(_selectedDate!)}';

                    // 1. 调用API获取原始JSON数据
                    final rawJsonData = await apiService.getPaipanRawData(
                      name: _nameController.text,
                      sex: _selectedGender == '男' ? 0 : 1,
                      inputDate: formattedDate,
                      city1: _selectedProvince,
                      city2: _selectedCity,
                      city3: _selectedDistrict,
                      sect: 2,
                      maxts: 5,
                      siling: 0,
                    );

                    // 2. 加载本地 show.php 模板
                    final phpTemplate = await rootBundle.loadString('assets/paipan/show.php');

                    // 3. 将JSON数据注入到模板中
                    final escapedJson = rawJsonData
                        .replaceAll('\\', '\\\\')
                        .replaceAll("'", "\\'")
                        .replaceAll('\n', '\\n')
                        .replaceAll('\r', '');
                    
                    final replacementTarget = r'<?php echo file_get_contents($URL.http_build_query($_GET)."&api=1&APPID=".$APPID."&APPKEY=".$APPKEY);?>';
                    
                    final finalHtml = phpTemplate.replaceFirst(
                      replacementTarget,
                      "'$escapedJson'"
                    );

                    // 关闭加载对话框
                    if (mounted) Navigator.pop(context);

                    // 4. 跳转到WebView结果页面
                    if (mounted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaipanResultScreen(htmlContent: finalHtml)),
                      );
                    }

                  } catch (e, s) {
                    // 关闭加载对话框
                    if (mounted) Navigator.pop(context);

                    debugPrint('排盘失败: $e');
                    debugPrint('堆栈跟踪: $s');
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('排盘失败: $e')),
                      );
                    }
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('请输入完整的姓名和生辰')),
                  );
                }
              }),
            ],
          ),
          // 返回按钮
          Positioned(
            top: 40,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF8B4513)),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513)))),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hint,
                filled: true,
                fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xFF8B4513), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, String label, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513)))),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xFF8B4513), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              value: items.first,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(BuildContext context, String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 80, child: Text(label, style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513)))),
          Expanded(
            child: InkWell(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: TextEditingController(
                    text: _selectedDate == null
                        ? ''
                        : DateFormat('yyyy-MM-dd HH:mm').format(_selectedDate!),
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    filled: true,
                    fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(color: Color(0xFF8B4513), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = _selectedDate ?? DateTime(1990, 1, 1);
    int tempCalendar = _isGregorian ? 0 : 1;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SizedBox(
              height: 350,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CupertinoButton(
                          child: const Text('取消'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Expanded(
                          child: CupertinoSlidingSegmentedControl<int>(
                            groupValue: tempCalendar,
                            children: const <int, Widget>{
                              0: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text('公历')),
                              1: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: Text('农历')),
                            },
                            onValueChanged: (int? value) {
                              if (value != null) {
                                setModalState(() {
                                  tempCalendar = value;
                                });
                              }
                            },
                          ),
                        ),
                        CupertinoButton(
                          child: const Text('确定'),
                          onPressed: () {
                            setState(() {
                              _selectedDate = pickedDate;
                              _isGregorian = tempCalendar == 0;
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: pickedDate,
                      minimumDate: DateTime(1900),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        pickedDate = newDate;
                      },
                      use24hFormat: true,
                      minuteInterval: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildActionButton(BuildContext context, String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B4513),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildLocationDropdown(String label, String? selectedValue, List<String> items, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513)),
            ),
          ),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color(0xFF8B4513), width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
              ),
              value: selectedValue,
              hint: Text('请选择$label'),
              isExpanded: true,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, overflow: TextOverflow.ellipsis),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}