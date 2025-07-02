import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('找回密码', style: TextStyle(color: Color(0xFF8B4513))),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B4513)),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // 背景图片
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // 找回密码内容
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 120.0, 16.0, 16.0), // 顶部留出AppBar空间
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Text(
              '易理问询',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            _buildTextField('手机号', hintText: '请输入手机号', prefixIcon: Icons.phone),
            const SizedBox(height: 20),
            _buildTextField('新密码', hintText: '请输入新密码', prefixIcon: Icons.lock, obscureText: true),
            const SizedBox(height: 20),
            _buildTextField('确认密码', hintText: '请再次输入新密码', prefixIcon: Icons.lock_outline, obscureText: true),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildTextField('验证码', hintText: '请输入6位验证码', prefixIcon: Icons.sms),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text('获取验证码', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B4513),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text('确定', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false, String? hintText, IconData? prefixIcon}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: const Color(0xFF8B4513)) : null,
        labelStyle: const TextStyle(color: Color(0xFF8B4513)),
        hintStyle: TextStyle(color: Colors.grey[400]),
        filled: true,
        fillColor: const Color(0xFFFDEBEB).withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF8B4513), width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}