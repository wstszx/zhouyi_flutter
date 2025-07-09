import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:zhouyi/screens/paipan_result_screen.dart';
import 'package:zhouyi/services/api_service.dart';
import 'package:zhouyi/services/divination_service.dart';

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
  Map<String, dynamic> _locations = {};
  List<String> _provinces = [];
  Map<String, List<String>> _cities = {};
  Map<String, List<String>> _districts = {};

  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  Future<void> _loadLocations() async {
    final String response = await rootBundle.loadString('assets/locations.json');
    final data = await json.decode(response);
    setState(() {
      _locations = data;
      _provinces = data.keys.toList();
      _provinces.forEach((province) {
        final cityData = data[province];
        if (cityData is Map) {
          _cities[province] = cityData.keys.toList().cast<String>();
          cityData.forEach((city, districtData) {
            if (districtData is List) {
              _districts[city] = districtData.cast<String>();
            }
          });
        }
      });
    });
  }

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
              _buildLocationDropdown('省/市', _selectedProvince, _provinces, (value) {
                setState(() {
                  _selectedProvince = value;
                  _selectedCity = null;
                  _selectedDistrict = null;
                });
              }),
              if (_selectedProvince != null)
                _buildLocationDropdown('城市', _selectedCity, _cities[_selectedProvince] ?? [], (value) {
                  setState(() {
                    _selectedCity = value;
                    _selectedDistrict = null;
                  });
                }),
              if (_selectedCity != null)
                _buildLocationDropdown('区/县', _selectedDistrict, _districts[_selectedCity] ?? [], (value) {
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

                    final divinationService = DivinationService();

                    // 格式化日期
                    final dateFormat = _isGregorian ? '公历' : '农历';
                    final formattedDate = '$dateFormat${DateFormat('yyyy年MM月dd日 HH时mm分').format(_selectedDate!)}';

                    // 1. 调用API获取原始JSON数据
                    final rawJsonData = await divinationService.getPaipanRawData(
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