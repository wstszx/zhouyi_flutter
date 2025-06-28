import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:zhouyi/models/divination_result.dart';
import 'package:zhouyi/screens/divination_result_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新建排盘', style: TextStyle(color: Color(0xFF8B4513))),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B4513)),
      ),
      body: Container(
        color: const Color(0xFFFDEBEB).withOpacity(0.5),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildTextField(context, '姓名', '请输入姓名', _nameController),
            _buildDropdownField(context, '性别', ['男', '女']),
            _buildDateField(context, '生辰', '年、月、日、时'),
            const SizedBox(height: 40),
            _buildActionButton(context, '排盘', () async {
              if (_nameController.text.isNotEmpty && _selectedDate != null) {
                try {
                  final jsonString = await rootBundle.loadString('divination_response.json');
                  final jsonResponse = json.decode(jsonString);
                  final result = DivinationResult.fromJson(jsonResponse);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DivinationResultScreen(result: result)),
                  );
                } catch (e, s) {
                  print('排盘失败: $e');
                  print('堆栈跟踪: $s');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('排盘失败: $e')),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('请输入完整的姓名和生辰')),
                );
              }
            }),
          ],
        ),
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
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
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
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
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
              onTap: () => _showDatePicker(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
                child: Text(
                  _selectedDate == null
                      ? hint
                      : DateFormat('yyyy-MM-dd HH:mm').format(_selectedDate!),
                  style: TextStyle(
                      color: _selectedDate == null
                          ? Colors.grey.shade600
                          : Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    DateTime initialDate = _selectedDate ?? DateTime.now();
    DateTime tempDate = initialDate;
    bool isGregorian = _isGregorian;

    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 2.5,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Text('取消', style: TextStyle(color: Colors.grey)),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CupertinoButton(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('公历', style: TextStyle(color: isGregorian ? Colors.brown : Colors.grey)),
                                onPressed: () {
                                  setModalState(() {
                                    isGregorian = true;
                                  });
                                },
                              ),
                              CupertinoButton(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text('农历', style: TextStyle(color: !isGregorian ? Colors.brown : Colors.grey)),
                                onPressed: () {
                                  setModalState(() {
                                    isGregorian = false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: const Text('今天', style: TextStyle(color: Colors.brown)),
                          onPressed: () {
                            setState(() {
                              _selectedDate = DateTime.now();
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.dateAndTime,
                      initialDateTime: initialDate,
                      onDateTimeChanged: (DateTime newDate) {
                        tempDate = newDate;
                      },
                      use24hFormat: true,
                      minuteInterval: 1,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: Colors.black,
                      child: const Text('确定'),
                      onPressed: () {
                        setState(() {
                          _selectedDate = tempDate;
                          _isGregorian = isGregorian;
                        });
                        Navigator.pop(context);
                      },
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
}