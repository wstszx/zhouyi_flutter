import 'package:flutter/material.dart';
import 'package:zhouyi/models/api_response.dart';
import 'package:zhouyi/models/app_models.dart';
import 'package:zhouyi/services/api_service.dart';

class VipPurchaseScreen extends StatefulWidget {
  const VipPurchaseScreen({super.key});

  @override
  State<VipPurchaseScreen> createState() => _VipPurchaseScreenState();
}

class _VipPurchaseScreenState extends State<VipPurchaseScreen> {
  late Future<VipInfo?> _vipInfoFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _vipInfoFuture = _apiService.getVipInfo().then((response) => response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('开通VIP会员'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: FutureBuilder<VipInfo?>(
        future: _vipInfoFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('无法加载VIP信息'));
          }

          final vipInfo = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: const Color(0xFFFDEBEB),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Text('VIP会员特权', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                        const SizedBox(height: 16),
                        Text(vipInfo.benefits.join('\n'), style: const TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement payment logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('正在跳转支付...')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text('立即支付 ¥${vipInfo.price}'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}