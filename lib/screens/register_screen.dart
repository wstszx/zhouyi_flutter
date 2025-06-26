import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('注册新用户',
            style: TextStyle(color: Color(0xFF8B4513))),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B4513)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
              _buildTextField('(手机号) 18511111111'),
              const SizedBox(height: 20),
              _buildTextField('(密码) 88888888', obscureText: true),
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
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF8B4513)),
        filled: true,
        fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF8B4513)),
        ),
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
            labelStyle: const TextStyle(color: Color(0xFF8B4513)),
            filled: true,
            fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Color(0xFF8B4513)),
            ),
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
        labelStyle: const TextStyle(color: Color(0xFF8B4513)),
        filled: true,
        fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF8B4513)),
        ),
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
        Expanded(child: _buildTextField('验证码')),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B4513),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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