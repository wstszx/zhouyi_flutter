import 'package:flutter/material.dart';
import 'package:zhouyi/screens/forgot_password_screen.dart';
import 'package:zhouyi/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                // Logo
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                ),
                const SizedBox(height: 16),
                const Text(
                  '易理问询',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                TabBar(
                  controller: _tabController,
                  labelColor: const Color(0xFF971B00),
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: const Color(0xFF971B00),
                  tabs: const [
                    Tab(text: '密码登录'),
                    Tab(text: '短信登录'),
                  ],
                ),
                SizedBox(
                  height: 300, // Adjust height to fit content
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildPasswordLogin(),
                      _buildSmsLogin(),
                    ],
                  ),
                ),
                _buildAgreement(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordLogin() {
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildTextField(hintText: '（手机号）'),
        const SizedBox(height: 20),
        _buildTextField(hintText: '（密码）', obscureText: true),
        const SizedBox(height: 30),
        _buildLoginButton(),
        _buildLinkButtons(),
      ],
    );
  }

  Widget _buildSmsLogin() {
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildTextField(hintText: '（手机号）'),
        const SizedBox(height: 20),
        _buildVerificationCodeField(),
        const SizedBox(height: 30),
        _buildLoginButton(),
        _buildLinkButtons(),
      ],
    );
  }

  Widget _buildTextField({required String hintText, bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFF971B00)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFF971B00)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Color(0xFF971B00), width: 2.0),
        ),
      ),
    );
  }

  Widget _buildVerificationCodeField() {
    return Row(
      children: [
        Expanded(
          child: _buildTextField(hintText: '（验证码）'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF971B00),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text('获取验证码'),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF971B00),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: const Text('登录', style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  Widget _buildLinkButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: const Text('注册新用户', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
            );
          },
          child: const Text('忘记密码', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  Widget _buildAgreement() {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        const Expanded(
          child: Text.rich(
            TextSpan(
              text: '已阅读并同意',
              children: [
                TextSpan(text: '《服务协议》', style: TextStyle(color: Color(0xFF971B00))),
                TextSpan(text: '、'),
                TextSpan(text: '《隐私政策》', style: TextStyle(color: Color(0xFF971B00))),
                TextSpan(text: '、'),
                TextSpan(text: '《法律声明》', style: TextStyle(color: Color(0xFF971B00))),
                TextSpan(text: '，AI生成，勾选同意，内容可参照新浪微博'),
              ],
            ),
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}