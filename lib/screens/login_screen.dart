import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool _obscurePassword = true;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();
  int _countdown = 0;
  bool _isCountingDown = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  bool _isValidPhone(String phone) {
    // 中国手机号正则表达式
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
  }

  void _sendVerificationCode() {
    if (_phoneController.text.trim().isEmpty) {
      _showErrorMessage('请先输入手机号');
      return;
    }

    if (!_isValidPhone(_phoneController.text.trim())) {
      _showErrorMessage('请输入正确的手机号格式');
      return;
    }

    // 开始倒计时
    setState(() {
      _isCountingDown = true;
      _countdown = 60;
    });

    // 模拟发送验证码
    _showSuccessMessage('验证码已发送到 ${_phoneController.text}');

    // 倒计时逻辑
    _startCountdown();
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
        _startCountdown();
      } else {
        setState(() {
          _isCountingDown = false;
        });
      }
    });
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景图片
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // 登录内容
          SingleChildScrollView(
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
              _buildPhoneField(),
              const SizedBox(height: 20),
              if (isPasswordLogin)
                _buildPasswordField()
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
                if (!agree) {
                  _showErrorMessage('请先阅读并同意服务协议、隐私政策和法律声明');
                  return;
                }

                if (_phoneController.text.trim().isEmpty) {
                  _showErrorMessage('请输入手机号');
                  return;
                }

                if (!_isValidPhone(_phoneController.text.trim())) {
                  _showErrorMessage('请输入正确的手机号格式');
                  return;
                }

                if (isPasswordLogin && _passwordController.text.trim().isEmpty) {
                  _showErrorMessage('请输入密码');
                  return;
                }

                if (isPasswordLogin && _passwordController.text.length < 6) {
                  _showErrorMessage('密码长度不能少于6位');
                  return;
                }

                if (!isPasswordLogin && _verificationCodeController.text.trim().isEmpty) {
                  _showErrorMessage('请输入验证码');
                  return;
                }

                if (!isPasswordLogin && _verificationCodeController.text.length != 6) {
                  _showErrorMessage('请输入6位验证码');
                  return;
                }

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
        ],
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

  Widget _buildPhoneField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: '手机号',
        hintText: '请输入手机号',
        prefixIcon: const Icon(Icons.phone, color: Color(0xFF8B4513)),
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

  Widget _buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: '密码',
        hintText: '请输入密码',
        prefixIcon: const Icon(Icons.lock, color: Color(0xFF8B4513)),
        suffixIcon: IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Color(0xFF8B4513),
          ),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
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



  Widget _buildVerificationCodeField() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _verificationCodeController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: InputDecoration(
              labelText: '验证码',
              hintText: '请输入6位验证码',
              prefixIcon: const Icon(Icons.sms, color: Color(0xFF8B4513)),
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
              counterText: '', // 隐藏字符计数器
            ),
          ),
        ),
        const SizedBox(width: 12),
        _buildGetCodeButton(),
      ],
    );
  }

  Widget _buildGetCodeButton() {
    return ElevatedButton(
      onPressed: _isCountingDown ? null : _sendVerificationCode,
      style: ElevatedButton.styleFrom(
        backgroundColor: _isCountingDown ? Colors.grey : const Color(0xFF8B4513),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        minimumSize: const Size(100, 50),
      ),
      child: Text(
        _isCountingDown ? '${_countdown}s' : '获取验证码',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
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
      onPressed: agree ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: agree ? const Color(0xFF8B4513) : Colors.grey,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: agree ? 2 : 0,
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