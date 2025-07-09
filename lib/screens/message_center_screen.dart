import 'package:flutter/material.dart';
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/paginated_response.dart';
import 'package:zhouyi/services/api_service.dart';

class MessageCenterScreen extends StatefulWidget {
  const MessageCenterScreen({super.key});

  @override
  State<MessageCenterScreen> createState() => _MessageCenterScreenState();
}

class _MessageCenterScreenState extends State<MessageCenterScreen> {
  late Future<PaginatedResponse<dynamic>?> _messagesFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _messagesFuture = _apiService.getMessages().then((response) => response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('消息中心'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: FutureBuilder<PaginatedResponse<dynamic>?>(
        future: _messagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.items.isEmpty) {
            return const Center(child: Text('没有消息'));
          }

          final messages = snapshot.data!.items;
          return ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return Card(
                color: const Color(0xFFFDEBEB),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: const Icon(Icons.notifications, color: Color(0xFF8B4513)),
                  title: Text(message['title'] ?? '消息标题', style: const TextStyle(color: Color(0xFF8B4513), fontWeight: FontWeight.bold)),
                  subtitle: Text(message['content'] ?? '消息内容', style: const TextStyle(color: Color(0xFF8B4513))),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF8B4513), size: 16),
                  onTap: () {
                    // TODO: Implement message detail view
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}