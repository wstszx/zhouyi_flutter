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
        title: const Text('注册新用户'),
        backgroundColor: const Color(0xFF971B00),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '易理问询',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const TextField(
              decoration: InputDecoration(
                labelText: '(手机号) 18511111111',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: '(密码) 88888888',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextField(
                  controller: _birthDateController,
                  decoration: const InputDecoration(
                    labelText: '出生年月日',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: '性别',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '验证码',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF971B00),
                  ),
                  child: const Text('获取验证码', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF971B00),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('确定', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}