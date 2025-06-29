import 'package:flutter/material.dart';

class VipPurchaseScreen extends StatelessWidget {
  const VipPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('开通VIP会员'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              color: Color(0xFFFDEBEB),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('VIP会员特权', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                    SizedBox(height: 16),
                    Text('- 无限制访问所有功能\n- 专属客服一对一服务\n- 更多优惠敬请期待', style: TextStyle(fontSize: 16, color: Color(0xFF8B4513))),
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
              child: const Text('立即支付 ¥398'),
            ),
          ],
        ),
      ),
    );
  }
}