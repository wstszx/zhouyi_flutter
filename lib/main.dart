import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zhouyi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SelectMajorScreen(),
    );
  }
}

class SelectMajorScreen extends StatefulWidget {
  const SelectMajorScreen({super.key});

  @override
  _SelectMajorScreenState createState() => _SelectMajorScreenState();
}

class _SelectMajorScreenState extends State<SelectMajorScreen> {
  final List<String> _majorOptions = [
    '奇门遁甲', '易经64卦', '堪舆', '大六壬', '小六壬', '六爻',
    '梅花易数', '紫微斗数', '七政四余', '太乙神术', '四柱八字', '其他'
  ];

  final List<String> _minorOptions = [
    '奇门遁甲', '易经64卦', '堪舆', '大六壬', '小六壬', '六爻',
    '梅花易数', '紫微斗数', '七政四余', '太乙神术', '四柱八字', '其他'
  ];

  String? _selectedMajor;
  final List<String> _selectedMinors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  _buildSection(
                    title: '主修学术（必选）',
                    options: _majorOptions,
                    isMajor: true,
                  ),
                  const SizedBox(height: 20),
                  _buildSection(
                    title: '辅修学术（必选）',
                    options: _minorOptions,
                    isMajor: false,
                  ),
                  const SizedBox(height: 16),
                  _buildTextFieldSection('从什么渠道发现该软件（必填）', '请输入发现渠道（最多8字）'),
                  const SizedBox(height: 16),
                  _buildTextFieldSection('请设置【1v1问答】赏金（必填）', '0-999（用户APP内可修改）', suffixText: '元'),
                  const SizedBox(height: 32),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: SvgPicture.asset(
                        'assets/images/button_background.svg',
                        width: 340,
                        height: 78,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required List<String> options, required bool isMajor}) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/section_background.svg',
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: options.map((option) {
                  final isSelected = isMajor ? _selectedMajor == option : _selectedMinors.contains(option);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isMajor) {
                          _selectedMajor = option;
                        } else {
                          if (_selectedMinors.contains(option)) {
                            _selectedMinors.remove(option);
                          } else {
                            if (_selectedMinors.length < 2) {
                              _selectedMinors.add(option);
                            }
                          }
                        }
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          isSelected ? 'assets/images/checkbox_checked.svg' : 'assets/images/checkbox_unchecked.svg',
                          width: 24,
                          height: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(option, style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextFieldSection(String title, String hint, {String? suffixText}) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/section_background.svg',
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  suffixText: suffixText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
