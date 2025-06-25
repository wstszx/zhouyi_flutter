import 'package:flutter/material.dart';
import 'package:zhouyi/screens/charting_screen.dart';

class AstrolabeScreen extends StatelessWidget {
  const AstrolabeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBarAndNewButton(context),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 4, // Example count
                itemBuilder: (context, index) {
                  return _buildAstrolabeCard(context, '张三 (男)', '2025-08-08');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBarAndNewButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入关键词搜索',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF8B4513)),
              filled: true,
              fillColor: const Color(0xFFFDEBEB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChartingScreen()),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('新建'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B4513),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildAstrolabeCard(BuildContext context, String name, String birthDate) {
    return Card(
      color: const Color(0xFFFDEBEB),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('姓名：$name', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
                const SizedBox(height: 8),
                Text('生辰：$birthDate', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
              ],
            ),
            const Text(
              '辛 乙 甲 庚\n已 卯 午 申',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 16, color: Color(0xFF8B4513), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}