import 'package:flutter/material.dart';

class OneOnOneScreen extends StatelessWidget {
  const OneOnOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionHeader(context, '2025-08-08 选择题'),
          _buildScholarCard(context, '187****2568', 'XXXXXXXXXX', '50'),
          _buildScholarCard(context, '187****2568', 'XXXXXXXXXX', '50'),
          _buildScholarCard(context, '187****2568', 'XXXXXXXXXX', '50'),
          _buildExpandButton(context),
          const SizedBox(height: 20),
          _buildSectionHeader(context, '2025-08-08 问答题'),
          _buildScholarCard(context, '187****2568', 'XXXXXXXXXX', '50'),
          _buildScholarCard(context, '187****2568', 'XXXXXXXXXX', '50'),
          _buildScholarCard(context, '187****2568', 'XXXXXXXXXX', '50'),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
      ),
    );
  }

  Widget _buildScholarCard(BuildContext context, String name, String expertise, String price) {
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
                Text('学者：$name', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
                const SizedBox(height: 8),
                Text('学术：$expertise', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Show scholar details dialog
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('发起1v1'),
                ),
                const SizedBox(height: 4),
                Text('¥ $price', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513), fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.expand_more, color: Color(0xFF8B4513)),
      label: const Text('展开全部', style: TextStyle(color: Color(0xFF8B4513))),
    );
  }
}