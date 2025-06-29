import 'package:flutter/material.dart';

class MessageCenterScreen extends StatelessWidget {
  const MessageCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息中心'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: ListView.builder(
        itemCount: 3, // Placeholder for actual message count
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFFFDEBEB),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Color(0xFF8B4513)),
              title: Text('消息标题 ${index + 1}', style: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.bold)),
              subtitle: Text('这里是消息内容摘要...', style: const TextStyle(color: Color(0xFF8B4513))),
              trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF8B4513), size: 16),
              onTap: () {
                // TODO: Implement message detail view
              },
            ),
          );
        },
      ),
    );
  }
}