import 'package:flutter/material.dart';
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/app_models.dart';
import 'package:zhouyi/main.dart';
import 'package:zhouyi/services/api_service.dart';
import 'package:zhouyi/models/paginated_response.dart';

class MyQuestionsScreen extends StatefulWidget {
  const MyQuestionsScreen({super.key});

  @override
  State<MyQuestionsScreen> createState() => _MyQuestionsScreenState();
}

class _MyQuestionsScreenState extends State<MyQuestionsScreen> {
  late Future<PaginatedResponse<Question>?> _questionsFuture;
  final ApiService _apiService = apiService; // Use the global instance

  @override
  void initState() {
    super.initState();
    _questionsFuture = _apiService.getMyQuestions().then((response) => response.data);
  }

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
        child: FutureBuilder<PaginatedResponse<Question>?>(
          future: _questionsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.items.isEmpty) {
              return const Center(child: Text('没有找到问询记录'));
            }

            final questions = snapshot.data!.items;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                return _buildQuestionCard(context, question: question);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuestionCard(BuildContext context, {required Question question}) {
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
                Text(question.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                Text(question.status, style: TextStyle(fontSize: 16, color: _getStatusColor(question.status), fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('用户: ${question.user?.nickname ?? '匿名用户'}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    const SizedBox(height: 4),
                    Text(question.createdAt, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
                Text('${question.answerCount}人回答', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case '进行中':
        return Colors.green;
      case '已结束':
        return Colors.grey;
      default:
        return const Color(0xFF8B4513);
    }
  }
}