import 'package:flutter/material.dart';

class EditOpinionScreen extends StatefulWidget {
  const EditOpinionScreen({super.key});

  @override
  State<EditOpinionScreen> createState() => _EditOpinionScreenState();
}

class _EditOpinionScreenState extends State<EditOpinionScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('修改个人意见'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              maxLines: 8,
              decoration: const InputDecoration(
                hintText: '请输入您的意见...',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF8B4513)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement save logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('保存成功')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B4513),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}