import 'package:flutter/material.dart';
import '../main.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordLogin = true;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                '易理问询',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B4513)),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLoginTypeButton('密码登录', true),
                  const SizedBox(width: 40),
                  _buildLoginTypeButton('短信登录', false),
                ],
              ),
              const SizedBox(height: 30),
              _buildTextField('(手机号) 18511111111'),
              const SizedBox(height: 20),
              if (isPasswordLogin)
                _buildTextField('(密码) 88888888', obscureText: true)
              else
                _buildVerificationCodeField(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTextButton('注册新用户', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()),
                    );
                  }),
                  _buildTextButton('忘记密码', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen()),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 30),
              _buildPrimaryButton('登录', () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              }),
              const SizedBox(height: 20),
              _buildAgreementRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginTypeButton(String text, bool isPassword) {
    bool isActive = isPassword == isPasswordLogin;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPasswordLogin = isPassword;
        });
      },
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: isActive ? const Color(0xFF8B4513) : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 2,
              width: 60,
              color: const Color(0xFF8B4513),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF8B4513)),
        filled: true,
        fillColor: const Color(0xFFFDEBEB).withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF8B4513)),
        ),
      ),
    );
  }

  Widget _buildVerificationCodeField() {
    return Row(
      children: [
        Expanded(child: _buildTextField('(验证码) XXXXXXX')),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF8B4513),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          child:
              const Text('获取验证码', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF8B4513)),
      ),
    );
  }

  Widget _buildPrimaryButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8B4513),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
      ),
      child: Text(text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildAgreementRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: agree,
          onChanged: (value) {
            setState(() {
              agree = value!;
            });
          },
          activeColor: const Color(0xFF8B4513),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 12.0),
            child: Text.rich(
              TextSpan(
                text: '已阅读并同意',
                style: TextStyle(color: Colors.grey),
                children: <TextSpan>[
                  TextSpan(
                      text: '《服务协议》',
                      style: TextStyle(color: Color(0xFF8B4513))),
                  TextSpan(text: '、'),
                  TextSpan(
                      text: '《隐私政策》',
                      style: TextStyle(color: Color(0xFF8B4513))),
                  TextSpan(text: '、'),
                  TextSpan(
                      text: '《法律声明》',
                      style: TextStyle(color: Color(0xFF8B4513))),
                  TextSpan(text: ',AI生成,勾选同意,内容可参照新浪微博'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}