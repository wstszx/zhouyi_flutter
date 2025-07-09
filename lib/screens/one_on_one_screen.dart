import 'package:flutter/material.dart';
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/app_models.dart';
import 'package:zhouyi/models/paginated_response.dart';
import 'package:zhouyi/services/api_service.dart';
import 'create_consultation_screen.dart';

class OneOnOneScreen extends StatefulWidget {
  const OneOnOneScreen({super.key});

  @override
  State<OneOnOneScreen> createState() => _OneOnOneScreenState();
}

class _OneOnOneScreenState extends State<OneOnOneScreen> {
  late Future<PaginatedResponse<Scholar>?> _scholarsFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _scholarsFuture = _apiService.getScholars().then((response) => response.data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<PaginatedResponse<Scholar>?>(
        future: _scholarsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.items.isEmpty) {
            return const Center(child: Text('没有找到学者'));
          }

          final scholars = snapshot.data!.items;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: scholars.length,
            itemBuilder: (context, index) {
              final scholar = scholars[index];
              return _buildScholarCard(context, scholar);
            },
          );
        },
      ),
    );
  }

  Widget _buildScholarCard(BuildContext context, Scholar scholar) {
    return Card(
      color: const Color(0xFFFDEBEB),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('学者：${scholar.nickname}', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
                const SizedBox(height: 8),
                Text('学术：${scholar.specialty}', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateConsultationScreen(
                          scholarId: scholar.id.toString(),
                          scholarName: scholar.nickname,
                          price: scholar.price.toString(),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('发起1v1'),
                ),
                const SizedBox(height: 4),
                Text('¥ ${scholar.price}', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513), fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}