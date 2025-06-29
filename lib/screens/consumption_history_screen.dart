import 'package:flutter/material.dart';

class ConsumptionHistoryScreen extends StatelessWidget {
  const ConsumptionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消费记录'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: ListView.builder(
        itemCount: 10, // Placeholder for actual data length
        itemBuilder: (context, index) {
          return Card(
            color: const Color(0xFFFDEBEB),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text('消费项目 ${index + 1}', style: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.bold)),
              subtitle: Text('2025-06-${30 - index}  12:34', style: const TextStyle(color: Color(0xFF8B4513))),
              trailing: Text('-¥${(index + 1) * 10}', style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}