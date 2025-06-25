import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zhouyi/screens/my_questions_screen.dart';
import 'package:zhouyi/screens/new_question_screen.dart';

class QaMarketplaceScreen extends StatelessWidget {
  const QaMarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildHeader(context),
              const SizedBox(height: 30),
              _buildMainButtons(context),
              const SizedBox(height: 30),
              _buildInfoBox(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDEBEB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.5)),
      ),
      child: const Column(
        children: [
          Text(
            '问询集市',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
          ),
          SizedBox(height: 8),
          Text(
            '/ 来者皆是客 /',
            style: TextStyle(fontSize: 16, color: Color(0xFF8B4513)),
          ),
        ],
      ),
    );
  }

  Widget _buildMainButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(context, '我的问询', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyQuestionsScreen()),
          );
        }),
        _buildActionButton(context, '发起新问询', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewQuestionScreen()),
          );
        }, isPrimary: true),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String text, VoidCallback onPressed, {bool isPrimary = false}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? const Color(0xFF8B4513) : const Color(0xFFFDEBEB),
        foregroundColor: isPrimary ? Colors.white : const Color(0xFF8B4513),
        minimumSize: const Size(150, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfoBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDEBEB).withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '提示:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
          ),
          const SizedBox(height: 10),
          _buildInfoText('1. 您可以免费【发起新问询】，设置2-4个选择题或问答题，让易学学者/爱好者作答。'),
          _buildInfoText('2. 问询有效时间是【72小时】，发起后在【我的问询】查看进度。'),
          _buildInfoText('3. 如果发起者未采纳，将从【签约】币进行实名认证后您来支付（回帖无悬赏要求）'),
          _buildInfoText('4. 一次的问询未结束，将不能发起新的问询'),
        ],
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, color: Color(0xFF8B4513), height: 1.5),
      ),
    );
  }
}