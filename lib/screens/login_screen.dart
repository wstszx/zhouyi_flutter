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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '易理问询',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordLogin = true;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        '密码登录',
                        style: TextStyle(
                          fontSize: 18,
                          color: isPasswordLogin ? const Color(0xFF971B00) : Colors.grey,
                        ),
                      ),
                      if (isPasswordLogin)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: 2,
                          width: 60,
                          color: const Color(0xFF971B00),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isPasswordLogin = false;
                    });
                  },
                  child: Column(
                    children: [
                      Text(
                        '短信登录',
                        style: TextStyle(
                          fontSize: 18,
                          color: !isPasswordLogin ? const Color(0xFF971B00) : Colors.grey,
                        ),
                      ),
                      if (!isPasswordLogin)
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: 2,
                          width: 60,
                          color: const Color(0xFF971B00),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: '(手机号) 18511111111',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (isPasswordLogin)
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '(密码) 88888888',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              )
            else
              TextField(
                decoration: InputDecoration(
                  labelText: '(验证码) XXXXXXX',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterScreen()),
                    );
                  },
                  child: const Text(
                    '注册新用户',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  child: const Text(
                    '忘记密码',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF971B00),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('登录', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                  value: agree,
                  onChanged: (value) {
                    setState(() {
                      agree = value!;
                    });
                  },
                ),
                const Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: '已阅读并同意',
                      children: <TextSpan>[
                        TextSpan(text: '《服务协议》', style: TextStyle(color: Color(0xFF971B00))),
                        TextSpan(text: '、'),
                        TextSpan(text: '《隐私政策》', style: TextStyle(color: Color(0xFF971B00))),
                        TextSpan(text: '、'),
                        TextSpan(text: '《法律声明》', style: TextStyle(color: Color(0xFF971B00))),
                        TextSpan(text: ',AI生成,勾选同意,内容可参照新浪微博'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}