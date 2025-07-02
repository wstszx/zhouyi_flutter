import 'package:flutter/material.dart';

class NewQuestionScreen extends StatefulWidget {
  const NewQuestionScreen({super.key});

  @override
  _NewQuestionScreenState createState() => _NewQuestionScreenState();
}

class _NewQuestionScreenState extends State<NewQuestionScreen> {
  String _questionType = '选择题';
  String _selectedGender = '男';
  String _selectedCalendar = '新历';
  String? _selectedOption1; // 改为单选
  String? _selectedOption2; // 改为单选

  // 问答题的答案
  final TextEditingController _essayAnswer1Controller = TextEditingController();
  final TextEditingController _essayAnswer2Controller = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  Set<int> _selectedScholarAnswers = {}; // 用于存储选中的学者回答索引

  @override
  void dispose() {
    _essayAnswer1Controller.dispose();
    _essayAnswer2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发起新问题', style: TextStyle(color: Color(0xFF8B4513))),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B4513)),
      ),
      body: Container(
        color: const Color(0xFFFDEBEB).withAlpha(76),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildTopBar(),
            const SizedBox(height: 16),
            _buildGenderAndCalendarSelector(),
            const SizedBox(height: 16),
            _buildBirthInfo(),
            const SizedBox(height: 16),
            _buildQuestionTypeSelector(),
            const SizedBox(height: 16),
            _buildMyQuestions(),
            const SizedBox(height: 16),
            _buildSubmitButton(),
            const SizedBox(height: 16),
            _buildScholarAnswers(),
            const SizedBox(height: 16),
            _buildRewardButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoChip('限时: 72小时'),
        _buildInfoChip('回答人数: 最多100人'),
      ],
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFDEBEB),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF8B4513).withAlpha(100)),
      ),
      child: Text(text, style: const TextStyle(color: Color(0xFF8B4513), fontSize: 12)),
    );
  }

  Widget _buildGenderAndCalendarSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildGenderToggle('男'),
        _buildGenderToggle('女'),
        const SizedBox(width: 40),
        _buildCalendarTypeToggle('新历'),
        _buildCalendarTypeToggle('农历'),
      ],
    );
  }

  Widget _buildBirthInfo() {
    String displayText = _getDisplayText();

    return GestureDetector(
      onTap: _showDateTimePicker,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Text('生辰', style: TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
            const Spacer(),
            Text(
              displayText,
              style: TextStyle(
                color: (_selectedDate != null && _selectedTime != null) ? const Color(0xFF8B4513) : Colors.grey,
                fontSize: 12,
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  String _getDisplayText() {
    if (_selectedDate != null && _selectedTime != null) {
      return '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')} ${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}';
    }
    return '请输入年月日时 2025-01-01 10:30';
  }

  Future<void> _showDateTimePicker() async {
    DateTime tempDate = _selectedDate ?? DateTime(1990, 1, 1);
    TimeOfDay tempTime = _selectedTime ?? const TimeOfDay(hour: 8, minute: 0);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('选择生辰时间', style: TextStyle(color: Color(0xFF8B4513))),
              content: SizedBox(
                width: double.maxFinite,
                height: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('请选择出生日期和时间', style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 20),
                    // 年份选择
                    Row(
                      children: [
                        const Text('年份: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: DropdownButton<int>(
                            value: tempDate.year,
                            items: List.generate(125, (index) => 1900 + index)
                                .map((year) => DropdownMenuItem(
                                      value: year,
                                      child: Text(year.toString()),
                                    ))
                                .toList(),
                            onChanged: (year) {
                              if (year != null) {
                                setDialogState(() {
                                  tempDate = DateTime(year, tempDate.month, tempDate.day);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    // 月份选择
                    Row(
                      children: [
                        const Text('月份: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: DropdownButton<int>(
                            value: tempDate.month,
                            items: List.generate(12, (index) => index + 1)
                                .map((month) => DropdownMenuItem(
                                      value: month,
                                      child: Text('${month}月'),
                                    ))
                                .toList(),
                            onChanged: (month) {
                              if (month != null) {
                                setDialogState(() {
                                  tempDate = DateTime(tempDate.year, month, tempDate.day);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    // 日期选择
                    Row(
                      children: [
                        const Text('日期: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: DropdownButton<int>(
                            value: tempDate.day,
                            items: List.generate(DateTime(tempDate.year, tempDate.month + 1, 0).day, (index) => index + 1)
                                .map((day) => DropdownMenuItem(
                                      value: day,
                                      child: Text('${day}日'),
                                    ))
                                .toList(),
                            onChanged: (day) {
                              if (day != null) {
                                setDialogState(() {
                                  tempDate = DateTime(tempDate.year, tempDate.month, day);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    // 时间选择
                    Row(
                      children: [
                        const Text('时间: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Expanded(
                          child: DropdownButton<int>(
                            value: tempTime.hour,
                            items: List.generate(24, (index) => index)
                                .map((hour) => DropdownMenuItem(
                                      value: hour,
                                      child: Text('${hour.toString().padLeft(2, '0')}时'),
                                    ))
                                .toList(),
                            onChanged: (hour) {
                              if (hour != null) {
                                setDialogState(() {
                                  tempTime = TimeOfDay(hour: hour, minute: tempTime.minute);
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DropdownButton<int>(
                            value: tempTime.minute,
                            items: List.generate(60, (index) => index)
                                .map((minute) => DropdownMenuItem(
                                      value: minute,
                                      child: Text('${minute.toString().padLeft(2, '0')}分'),
                                    ))
                                .toList(),
                            onChanged: (minute) {
                              if (minute != null) {
                                setDialogState(() {
                                  tempTime = TimeOfDay(hour: tempTime.hour, minute: minute);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '${tempDate.year}-${tempDate.month.toString().padLeft(2, '0')}-${tempDate.day.toString().padLeft(2, '0')} ${tempTime.hour.toString().padLeft(2, '0')}:${tempTime.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('取消', style: TextStyle(color: Colors.grey)),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedDate = tempDate;
                      _selectedTime = tempTime;
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('确定'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildGenderToggle(String gender) {
    bool isSelected = gender == _selectedGender;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedGender = gender;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B4513) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF8B4513)),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarTypeToggle(String type) {
    bool isSelected = type == _selectedCalendar;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCalendar = type;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B4513) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF8B4513)),
        ),
        child: Text(
          type,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionTypeSelector() {
    return Row(
      children: [
        Radio<String>(
          value: '选择题',
          groupValue: _questionType,
          onChanged: (value) {
            setState(() {
              _questionType = value!;
            });
          },
          activeColor: const Color(0xFF8B4513),
        ),
        const Text('选择题', style: TextStyle(color: Color(0xFF8B4513))),
        const SizedBox(width: 20),
        Radio<String>(
          value: '问答题',
          groupValue: _questionType,
          onChanged: (value) {
            setState(() {
              _questionType = value!;
            });
          },
          activeColor: const Color(0xFF8B4513),
        ),
        const Text('问答题', style: TextStyle(color: Color(0xFF8B4513))),
      ],
    );
  }

  Widget _buildMyQuestions() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('我的问题', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
          const SizedBox(height: 16),
          // 根据问题类型显示不同内容
          if (_questionType == '选择题') ...[
            _buildQuestionItem('问题1', '您认为哪些因素对事业发展最重要？', 1, [
              'A. 个人能力和努力',
              'B. 人际关系和社交网络',
              'C. 机遇和时机把握',
              'D. 家庭背景和资源'
            ]),
            const SizedBox(height: 16),
            _buildQuestionItem('问题2', '在人生重要决策时，您最看重什么？', 2, [
              'A. 理性分析和逻辑思考',
              'B. 直觉感受和内心声音',
              'C. 他人建议和经验分享',
              'D. 传统文化和价值观念'
            ]),
          ] else if (_questionType == '问答题') ...[
            _buildEssayQuestions(),
          ],
        ],
      ),
    );
  }

  Widget _buildQuestionItem(String label, String question, int questionNumber, List<String> options) {
    String? selectedOption = questionNumber == 1 ? _selectedOption1 : _selectedOption2;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
        const SizedBox(height: 8),
        Text(question, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 12),
        // 显示选项内容
        ...options.asMap().entries.map((entry) {
          int index = entry.key;
          String optionText = entry.value;
          String optionLetter = String.fromCharCode(65 + index); // A, B, C, D

          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                _buildOptionButton(optionLetter, selectedOption == optionLetter, questionNumber),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (questionNumber == 1) {
                          _selectedOption1 = optionLetter;
                        } else {
                          _selectedOption2 = optionLetter;
                        }
                      });
                    },
                    child: Text(
                      optionText,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildEssayQuestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEssayQuestionItem('问题1', '请详细描述您目前面临的主要困惑或问题？', _essayAnswer1Controller),
        const SizedBox(height: 16),
        _buildEssayQuestionItem('问题2', '您希望通过周易占卜获得什么样的指导和建议？', _essayAnswer2Controller),
      ],
    );
  }

  Widget _buildEssayQuestionItem(String label, String question, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
        const SizedBox(height: 8),
        Text(question, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF8B4513), width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText: '请在此输入您的回答...',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(12),
            ),
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionButton(String option, bool isSelected, int questionNumber) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (questionNumber == 1) {
            _selectedOption1 = option;
          } else {
            _selectedOption2 = option;
          }
        });
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8B4513) : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF8B4513), width: 2),
        ),
        child: Center(
          child: Text(
            option,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF8B4513),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          // Handle submit
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B4513),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: const Text('提交答案', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildScholarAnswers() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('学者回答', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
          const SizedBox(height: 8),
          const Text('已有答案 6/100 人', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 8),
          const Text('正确答案：A,B,C,D', style: TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 16),
          _buildScholarAnswerItem('学者：187****2568', 'A,B,C,B,A', 0),
          _buildScholarAnswerItem('学者：187****2568', 'A,B,C,C,D', 1),
          _buildScholarAnswerItem('学者：187****2568', 'A,B,C,B,D', 2),
          _buildScholarAnswerItem('学者：187****2568', 'A,B,C,C,D', 3),
          _buildScholarAnswerItem('学者：187****2568', 'A,B,C,C,D', 4),
        ],
      ),
    );
  }

  Widget _buildScholarAnswerItem(String scholar, String answers, int index) {
    bool isSelected = _selectedScholarAnswers.contains(index);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedScholarAnswers.remove(index);
          } else {
            _selectedScholarAnswers.add(index);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFDEBEB).withAlpha(100),
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: const Color(0xFF8B4513), width: 2) : null,
        ),
        child: Row(
          children: [
            if (isSelected)
              Container(
                width: 20,
                height: 20,
                margin: const EdgeInsets.only(right: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFF8B4513),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: Colors.white, size: 14),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(scholar, style: const TextStyle(fontSize: 12, color: Color(0xFF8B4513))),
                  const SizedBox(height: 4),
                  Text(answers, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        onPressed: () {
          _showRewardDialog();
        },
        icon: const Icon(Icons.card_giftcard, size: 20),
        label: const Text('打赏', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B4513),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
    );
  }

  void _showRewardDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('打赏学者', style: TextStyle(color: Color(0xFF8B4513))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('选择打赏金额：'),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRewardAmountButton('5元'),
                  _buildRewardAmountButton('10元'),
                  _buildRewardAmountButton('20元'),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRewardAmountButton('50元'),
                  _buildRewardAmountButton('100元'),
                  _buildRewardAmountButton('自定义'),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                // 处理打赏逻辑
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('打赏成功！感谢您的支持')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B4513),
                foregroundColor: Colors.white,
              ),
              child: const Text('确认打赏'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildRewardAmountButton(String amount) {
    return ElevatedButton(
      onPressed: () {
        // 处理金额选择
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF8B4513),
        side: const BorderSide(color: Color(0xFF8B4513)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(amount, style: const TextStyle(fontSize: 14)),
    );
  }
}