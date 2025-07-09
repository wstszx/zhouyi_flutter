import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zhouyi/models/app_models.dart';
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/paginated_response.dart';
import 'package:zhouyi/screens/charting_screen.dart';
import 'package:zhouyi/services/api_service.dart';
import 'package:zhouyi/main.dart';

class AstrolabeScreen extends StatefulWidget {
  const AstrolabeScreen({super.key});

  @override
  State<AstrolabeScreen> createState() => _AstrolabeScreenState();
}

class _AstrolabeScreenState extends State<AstrolabeScreen> {
  late Future<PaginatedResponse<DivinationRecord>?> _historyFuture;

  @override
  void initState() {
    super.initState();
    _historyFuture = apiService.getDivinationHistory().then((response) => response.data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBarAndNewButton(context),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<PaginatedResponse<DivinationRecord>?>(
                future: _historyFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.items.isEmpty) {
                    return const Center(child: Text('没有占卜记录'));
                  }

                  final records = snapshot.data!.items;
                  return ListView.builder(
                    itemCount: records.length,
                    itemBuilder: (context, index) {
                      final record = records[index];
                      return _buildAstrolabeCard(context, record);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBarAndNewButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '请输入关键词搜索',
              prefixIcon: const Icon(Icons.search, color: Color(0xFF8B4513)),
              filled: true,
              fillColor: const Color(0xFFFDEBEB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChartingScreen()),
            );
          },
          icon: const Icon(Icons.add),
          label: const Text('新建'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B4513),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildAstrolabeCard(BuildContext context, DivinationRecord record) {
    return Slidable(
      key: ValueKey(record.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.5,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SlidableAction(
                onPressed: (context) {
                  // TODO: Implement delete action
                },
                backgroundColor: const Color(0xFFFE6464),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: '删除',
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: SlidableAction(
                onPressed: (context) {
                  // TODO: Implement edit action
                },
                backgroundColor: const Color(0xFF8B4513),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: '编辑',
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
      child: Card(
        color: const Color(0xFFFDEBEB),
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${record.name} (${record.gender == 1 ? '男' : '女'})', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
                  const SizedBox(height: 8),
                  Text('生辰：${record.birthDatetime}', style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
                ],
              ),
              const Text(
                '辛 乙 甲 庚\n已 卯 午 申', // This seems to be static, leaving as is.
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 16, color: Color(0xFF8B4513), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}