import 'package:flutter/material.dart';

class NewQuestionScreen extends StatefulWidget {
  const NewQuestionScreen({super.key});

  @override
  _NewQuestionScreenState createState() => _NewQuestionScreenState();
}

class _NewQuestionScreenState extends State<NewQuestionScreen> {
  String _questionType = '选择题';

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
        color: const Color(0xFFFDEBEB).withOpacity(0.5),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildTopBar(),
            const SizedBox(height: 16),
            _buildBirthInfo(),
            const SizedBox(height: 16),
            _buildQuestionTypeSelector(),
            const SizedBox(height: 16),
            if (_questionType == '选择题') _buildMultipleChoiceSection(),
            if (_questionType == '问答题') _buildOpenQuestionSection(),
            const SizedBox(height: 32),
            _buildConfirmButton(),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(color: Color(0xFF8B4513))),
    );
  }

  Widget _buildBirthInfo() {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text('生辰', style: TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
                const Spacer(),
                const Text('请输入年月日时', style: TextStyle(color: Colors.grey)),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              ],
            ),
            const Divider(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildGenderToggle('男'),
                _buildGenderToggle('女'),
                const Spacer(),
                _buildCalendarTypeToggle('新历'),
                _buildCalendarTypeToggle('农历'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildGenderToggle(String gender) {
    // Simplified toggle
    return ChoiceChip(
      label: Text(gender),
      selected: gender == '男',
      onSelected: (selected) {},
      backgroundColor: Colors.grey.shade200,
      selectedColor: const Color(0xFF8B4513),
      labelStyle: TextStyle(color: gender == '男' ? Colors.white : Colors.black),
    );
  }

  Widget _buildCalendarTypeToggle(String type) {
    // Simplified toggle
    return ChoiceChip(
      label: Text(type),
      selected: type == '新历',
      onSelected: (selected) {},
      backgroundColor: Colors.grey.shade200,
      selectedColor: const Color(0xFF8B4513),
      labelStyle: TextStyle(color: type == '新历' ? Colors.white : Colors.black),
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
        const Text('选择题'),
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
        const Text('问答题'),
      ],
    );
  }

  Widget _buildMultipleChoiceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('设置问题', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildTextField('问题1', '请输入问题，保持在20字以内'),
        _buildTextField('A', '五字以内'),
        _buildTextField('B', '五字以内'),
        _buildTextField('C', '五字以内'),
        _buildTextField('D', '五字以内', isVip: true),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('新增问题'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF8B4513),
            side: const BorderSide(color: Color(0xFF8B4513)),
          ),
        )
      ],
    );
  }

  Widget _buildOpenQuestionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('设置问题', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _buildTextField('问题', '请输入问题，保持在20字以内'),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, {bool isVip = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text(label)),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          if (isVip)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Icon(Icons.lock, size: 16, color: Colors.orange),
                  Text('仅限会员', style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildConfirmButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B4513),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Text('确定', style: TextStyle(fontSize: 18)),
    );
  }
}