import 'package:flutter/material.dart';
import 'package:zhouyi/models/api_response.dart';
import 'consumption_history_screen.dart';
import 'bind_alipay_screen.dart';
import 'edit_opinion_screen.dart';
import 'package:zhouyi/models/app_models.dart';
import 'feedback_screen.dart';
import 'version_info_screen.dart';
import 'vip_purchase_screen.dart';
import 'message_center_screen.dart';
import '../services/api_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User?> _userFuture;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _userFuture = _apiService.getUserProfile().then((response) => response.data);
  }

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
    return FutureBuilder<User?>(
      future: _userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('无法加载用户信息'));
        }

        final user = snapshot.data;
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: user?.avatar != null ? NetworkImage(user!.avatar!) : null,
                child: user?.avatar == null ? const Icon(Icons.person, size: 40) : null,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user?.nickname ?? '用户名', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('ID: ${user?.id ?? 'N/A'}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.mail_outline, size: 30),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MessageCenterScreen()),
                  );
                },
              ),
            ],
          ),
        );
      },
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VipPurchaseScreen()),
              );
            },
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
          _buildMenuListItem(context, Icons.receipt_long, '消费记录', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ConsumptionHistoryScreen()),
            );
          }),
          _buildMenuListItem(context, Icons.payment, '绑定修改支付宝/实名', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BindAlipayScreen()),
            );
          }),
          _buildMenuListItem(context, Icons.edit, '修改个人意见', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditOpinionScreen()),
            );
          }),
          _buildMenuListItem(context, Icons.feedback_outlined, '意见反馈', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FeedbackScreen()),
            );
          }),
          _buildMenuListItem(context, Icons.info_outline, '版本说明/更新', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VersionInfoScreen()),
            );
          }),
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