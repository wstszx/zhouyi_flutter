import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            const SizedBox(height: 20),
            _buildVipSection(context),
            const SizedBox(height: 20),
            _buildMenuList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            // backgroundImage: NetworkImage('...'), // Placeholder for profile image
            backgroundColor: Colors.grey,
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('周易算命', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('乙巳年·2025.08.06', style: TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.mail_outline, size: 30),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildVipSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFDEBEB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('VIP会员 ¥398', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8B4513),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('立即开通'),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildMenuListItem(context, Icons.receipt_long, '消费记录', () {}),
          _buildMenuListItem(context, Icons.payment, '绑定修改支付宝/实名', () {}),
          _buildMenuListItem(context, Icons.edit, '修改个人意见', () {}),
          _buildMenuListItem(context, Icons.feedback_outlined, '意见反馈', () {}),
          _buildMenuListItem(context, Icons.info_outline, '版本说明/更新', () {}),
        ],
      ),
    );
  }

  Widget _buildMenuListItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return Card(
      color: const Color(0xFFFDEBEB),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF8B4513)),
        title: Text(title, style: const TextStyle(color: Color(0xFF8B4513), fontSize: 16)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF8B4513), size: 16),
        onTap: onTap,
      ),
    );
  }
}