import 'package:flutter/material.dart';
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/paginated_response.dart';
import 'package:zhouyi/services/api_service.dart';

class ConsumptionHistoryScreen extends StatefulWidget {
  const ConsumptionHistoryScreen({super.key});

  @override
  State<ConsumptionHistoryScreen> createState() => _ConsumptionHistoryScreenState();
}

class _ConsumptionHistoryScreenState extends State<ConsumptionHistoryScreen> {
  late Future<PaginatedResponse<dynamic>?> _historyFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _historyFuture = _apiService.getConsumptionHistory().then((response) => response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消费记录'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: FutureBuilder<PaginatedResponse<dynamic>?>(
        future: _historyFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.items.isEmpty) {
            return const Center(child: Text('没有消费记录'));
          }

          final history = snapshot.data!.items;
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              final item = history[index];
              return Card(
                color: const Color(0xFFFDEBEB),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  title: Text(item['orderType'] ?? '消费项目', style: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.bold)),
                  subtitle: Text(item['createdAt'] ?? '日期未知', style: const TextStyle(color: Color(0xFF8B4513))),
                  trailing: Text('-¥${item['amount']}', style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}