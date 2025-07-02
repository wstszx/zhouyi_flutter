import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _birthDateController = TextEditingController();
  DateTime? _selectedDate;
  int _selectedCalendar = 0; // 0 for Gregorian, 1 for Lunar
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = _selectedDate ?? DateTime(1990, 1, 1);

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
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
                            groupValue: _selectedCalendar,
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
                                  _selectedCalendar = value;
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
                              if (_selectedDate != null) {
                                // TODO: Handle Lunar date conversion
                                _birthDateController.text =
                                    DateFormat('yyyy-MM-dd')
                                        .format(_selectedDate!);
                              }
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 250,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: pickedDate,
                      minimumDate: DateTime(1900),
                      maximumDate: DateTime.now(),
                      onDateTimeChanged: (DateTime newDate) {
                        pickedDate = newDate;
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

  @override
  void dispose() {
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册新用户',
            style: TextStyle(color: Color(0xFF8B4513))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B4513)),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 背景图片
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // 注册内容
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 120.0, 24.0, 24.0), // 顶部留出AppBar空间
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const SizedBox(height: 20),
              const Text(
                '欢迎加入易理问询',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B4513)),
              ),
              const SizedBox(height: 40),
              _buildTextField('手机号', hintText: '请输入手机号', prefixIcon: Icons.phone),
              const SizedBox(height: 20),
              _buildTextField('密码', hintText: '请输入密码', prefixIcon: Icons.lock, obscureText: true),
              const SizedBox(height: 20),
              _buildDateField(),
              const SizedBox(height: 20),
              _buildGenderDropdown(),
              const SizedBox(height: 20),
              _buildVerificationCodeField(),
              const SizedBox(height: 40),
              _buildPrimaryButton('确定', () {
                Navigator.pop(context);
              }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false, String? hintText, IconData? prefixIcon}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: const Color(0xFF8B4513)) : null,
        labelStyle: const TextStyle(color: Color(0xFF8B4513)),
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: const Color(0xFFFDEBEB).withValues(alpha: 0.5),
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  Widget _buildDateField() {
    return InkWell(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextField(
          controller: _birthDateController,
          decoration: InputDecoration(
            labelText: '出生年月日',
            hintText: '请选择出生日期',
            prefixIcon: const Icon(Icons.calendar_today, color: Color(0xFF8B4513)),
            labelStyle: const TextStyle(color: Color(0xFF8B4513)),
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: const Color(0xFFFDEBEB).withValues(alpha: 0.5),
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
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedGender,
      decoration: InputDecoration(
        labelText: '性别',
        hintText: '请选择性别',
        prefixIcon: const Icon(Icons.person, color: Color(0xFF8B4513)),
        labelStyle: const TextStyle(color: Color(0xFF8B4513)),
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: const Color(0xFFFDEBEB).withValues(alpha: 0.5),
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
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      items: <String>['男', '女']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedGender = newValue;
        });
      },
    );
  }

  Widget _buildVerificationCodeField() {
    return Row(
      children: [
        Expanded(child: _buildTextField('验证码', hintText: '请输入6位验证码', prefixIcon: Icons.sms)),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B4513),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            minimumSize: const Size(100, 50),
          ),
          child:
              const Text('获取验证码', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B4513),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}