import 'package:flutter/material.dart';
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/app_models.dart';
import 'package:zhouyi/services/api_service.dart';

class VersionInfoScreen extends StatefulWidget {
  const VersionInfoScreen({super.key});

  @override
  State<VersionInfoScreen> createState() => _VersionInfoScreenState();
}

class _VersionInfoScreenState extends State<VersionInfoScreen> {
  late Future<VersionInfo?> _versionInfoFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _versionInfoFuture = _apiService.getVersionInfo().then((response) => response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('版本说明/更新'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: FutureBuilder<VersionInfo?>(
        future: _versionInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('无法加载版本信息'));
          }

          final versionInfo = snapshot.data!;
          return Padding(
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
                  Text(
                    'V${versionInfo.version}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF8B4513)),
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
          );
        },
      ),
    );
  }
}