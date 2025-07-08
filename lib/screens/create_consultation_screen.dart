import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart';

class CreateConsultationScreen extends StatefulWidget {
  final String scholarId;
  final String scholarName;
  final String price;

  const CreateConsultationScreen({
    super.key,
    required this.scholarId,
    required this.scholarName,
    required this.price,
  });

  @override
  State<CreateConsultationScreen> createState() => _CreateConsultationScreenState();
}

class _CreateConsultationScreenState extends State<CreateConsultationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  
  String _selectedGender = '男';
  String _selectedConsultationType = 'choice'; // choice 或 essay
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  bool _isGregorian = true; // true为公历，false为农历
  
  // 选择题选项
  final List<TextEditingController> _optionControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _questionController.dispose();
    for (var controller in _optionControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF8B4513),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF8B4513),
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submitConsultation() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedDate == null || _selectedTime == null) {
      _showErrorMessage('请选择出生日期和时间');
      return;
    }

    if (_selectedConsultationType == 'choice') {
      // 检查选择题选项
      bool hasEmptyOption = false;
      for (var controller in _optionControllers) {
        if (controller.text.trim().isEmpty) {
          hasEmptyOption = true;
          break;
        }
      }
      if (hasEmptyOption) {
        _showErrorMessage('请填写所有选项');
        return;
      }
    }

    // 构建生辰信息
    final birthDateTime = DateTime(
      _selectedDate!.year,
      _selectedDate!.month,
      _selectedDate!.day,
      _selectedTime!.hour,
      _selectedTime!.minute,
    );

    // 格式化日期
    final dateFormat = _isGregorian ? '公历' : '农历';
    final formattedDate = '$dateFormat${DateFormat('yyyy年MM月dd日 HH时mm分').format(birthDateTime)}';

    // 显示加载对话框
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8B4513)),
        ),
      ),
    );

    try {
      final apiService = ApiService();

      // 准备选项数据
      List<String>? options;
      if (_selectedConsultationType == 'choice') {
        options = _optionControllers.map((controller) => controller.text.trim()).toList();
      }

      // 调用API发起咨询
      // 构建问题列表
      List<Map<String, dynamic>> questions = [
        {
          'content': _questionController.text.trim(),
          'options': options,
        }
      ];

      // 构建生辰信息
      Map<String, dynamic> birthInfo = {
        'name': _nameController.text.trim(),
        'gender': _selectedGender,
        'birth_datetime': formattedDate,
      };

      final result = await apiService.createNewConsultation(
        scholarId: int.parse(widget.scholarId),
        consultationType: _selectedConsultationType,
        birthInfo: birthInfo,
        questions: questions,
      );

      // 关闭加载对话框
      if (mounted) Navigator.pop(context);

      if (result.success) {
        _showSuccessMessage(result.message ?? '咨询发起成功，等待学者回复');
        // 返回上一页
        if (mounted) Navigator.pop(context);
      } else {
        _showErrorMessage(result.message ?? '发起咨询失败');
      }
    } catch (e) {
      // 关闭加载对话框
      if (mounted) Navigator.pop(context);
      _showErrorMessage('网络错误，请稍后重试');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发起1v1咨询'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: Stack(
        children: [
          // 背景图片
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // 内容
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildScholarInfo(),
                  const SizedBox(height: 20),
                  _buildBirthInfoSection(),
                  const SizedBox(height: 20),
                  _buildConsultationTypeSection(),
                  const SizedBox(height: 20),
                  _buildQuestionSection(),
                  const SizedBox(height: 30),
                  _buildSubmitButton(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScholarInfo() {
    return Card(
      color: Colors.white.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.person, color: Color(0xFF8B4513), size: 40),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '学者：${widget.scholarName}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '咨询费用：¥${widget.price}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8B4513),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBirthInfoSection() {
    return Card(
      color: Colors.white.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '生辰信息',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B4513),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '姓名',
                hintText: '请输入姓名',
                prefixIcon: Icon(Icons.person_outline, color: Color(0xFF8B4513)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8B4513)),
                ),
                labelStyle: TextStyle(color: Color(0xFF8B4513)),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入姓名';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('性别：', style: TextStyle(color: Color(0xFF8B4513))),
                const SizedBox(width: 10),
                _buildGenderToggle('男'),
                const SizedBox(width: 10),
                _buildGenderToggle('女'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('历法：', style: TextStyle(color: Color(0xFF8B4513))),
                const SizedBox(width: 10),
                _buildCalendarToggle('公历'),
                const SizedBox(width: 10),
                _buildCalendarToggle('农历'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _selectDate,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today, color: Color(0xFF8B4513)),
                          const SizedBox(width: 8),
                          Text(
                            _selectedDate != null
                                ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                                : '选择日期',
                            style: const TextStyle(color: Color(0xFF8B4513)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: _selectTime,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.access_time, color: Color(0xFF8B4513)),
                          const SizedBox(width: 8),
                          Text(
                            _selectedTime != null
                                ? _selectedTime!.format(context)
                                : '选择时间',
                            style: const TextStyle(color: Color(0xFF8B4513)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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

  Widget _buildCalendarToggle(String type) {
    bool isSelected = (type == '公历') == _isGregorian;
    return GestureDetector(
      onTap: () {
        setState(() {
          _isGregorian = type == '公历';
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

  Widget _buildConsultationTypeSection() {
    return Card(
      color: Colors.white.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '咨询类型',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B4513),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildConsultationTypeToggle('选择题', 'choice'),
                const SizedBox(width: 20),
                _buildConsultationTypeToggle('问答题', 'essay'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConsultationTypeToggle(String label, String type) {
    bool isSelected = type == _selectedConsultationType;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedConsultationType = type;
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
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF8B4513),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionSection() {
    return Card(
      color: Colors.white.withValues(alpha: 0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '问题内容',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B4513),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _questionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: '请详细描述您的问题...',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8B4513)),
                ),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '请输入问题内容';
                }
                return null;
              },
            ),
            if (_selectedConsultationType == 'choice') ...[
              const SizedBox(height: 16),
              const Text(
                '选项设置',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B4513),
                ),
              ),
              const SizedBox(height: 8),
              ...List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: TextFormField(
                    controller: _optionControllers[index],
                    decoration: InputDecoration(
                      labelText: '选项${String.fromCharCode(65 + index)}',
                      hintText: '请输入选项内容',
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF8B4513)),
                      ),
                      labelStyle: const TextStyle(color: Color(0xFF8B4513)),
                    ),
                    validator: (value) {
                      if (_selectedConsultationType == 'choice' &&
                          (value == null || value.trim().isEmpty)) {
                        return '请输入选项内容';
                      }
                      return null;
                    },
                  ),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _submitConsultation,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8B4513),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          '发起咨询 - ¥${widget.price}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
