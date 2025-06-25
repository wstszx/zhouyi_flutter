import 'package:flutter/material.dart';

class MyQuestionsScreen extends StatelessWidget {
  const MyQuestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的问询', style: TextStyle(color: Color(0xFF8B4513))),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B4513)),
      ),
      body: Container(
        color: const Color(0xFFFDEBEB).withOpacity(0.5),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildQuestionCard(
              context,
              title: '5道选择题',
              status: '剩余 71 : 22 : 08',
              statusColor: Colors.green,
              user: '187****2568',
              date: '2025-08-08',
              answerCount: '72人回答',
            ),
            _buildQuestionCard(
              context,
              title: '问答题',
              status: '已结束',
              statusColor: Colors.grey,
              user: '187****2568',
              date: '2025-08-08',
              answerCount: '0人回答',
            ),
            _buildQuestionCard(
              context,
              title: '问答题',
              status: '查看详情',
              statusColor: const Color(0xFF8B4513),
              user: '187****2568',
              date: '2025-08-08',
              answerCount: '100人回答',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionCard(BuildContext context, {
    required String title,
    required String status,
    required Color statusColor,
    required String user,
    required String date,
    required String answerCount,
  }) {
    return Card(
      color: const Color(0xFFFDEBEB),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                Text(status, style: TextStyle(fontSize: 16, color: statusColor, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('用户: $user', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(date, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                Text(answerCount, style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}