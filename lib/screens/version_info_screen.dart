import 'package:flutter/material.dart';

class VersionInfoScreen extends StatelessWidget {
  const VersionInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('版本说明/更新'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '当前版本',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              const Text(
                'V1.0.0',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement check for update logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('已是最新版本')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B4513),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('检查更新'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}