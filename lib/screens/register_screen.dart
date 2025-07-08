import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../services/api_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ApiService _apiService = ApiService();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();
  bool _obscurePassword = true;
  int _countdown = 0;
  bool _isCountingDown = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册新用户',
            style: TextStyle(color: Color(0xFF8B4513))),
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
          // 注册内容
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 120.0, 24.0, 24.0), // 顶部留出AppBar空间
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              const SizedBox(height: 20),
              const Text(
                '欢迎加入易理问询',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8B4513)),
              ),
              const SizedBox(height: 40),
              _buildTextField(
                controller: _phoneController,
                labelText: '手机号',
                hintText: '请输入手机号',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 20),
              _buildPasswordField(),
              const SizedBox(height: 20),
              _buildVerificationCodeField(),
              const SizedBox(height: 40),
              _buildPrimaryButton('确定', _register),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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

  bool _isValidPhone(String phone) {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
  }

  void _sendVerificationCode() async {
    if (_isCountingDown) return;

    final phone = _phoneController.text.trim();
    if (phone.isEmpty || !_isValidPhone(phone)) {
      _showErrorMessage('请输入有效的手机号');
      return;
    }

    setState(() {
      _isCountingDown = true;
      _countdown = 60;
    });
    _startCountdown();

    try {
      await _apiService.sendSms(phone: phone, type: 'register');
      _showSuccessMessage('验证码已发送');
    } on ApiError catch (e) {
      _showErrorMessage(e.message);
      _resetCountdown();
    } catch (e) {
      _showErrorMessage('发送验证码失败: $e');
      _resetCountdown();
    }
  }

  void _startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
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

  void _resetCountdown() {
    if (!mounted) return;
    setState(() {
      _isCountingDown = false;
      _countdown = 0;
    });
  }

  void _register() async {
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final code = _verificationCodeController.text.trim();

    if (phone.isEmpty || !_isValidPhone(phone)) {
      _showErrorMessage('请输入有效的手机号');
      return;
    }
    if (password.isEmpty || password.length < 6) {
      _showErrorMessage('密码长度不能少于6位');
      return;
    }
    if (code.isEmpty || code.length != 6) {
      _showErrorMessage('请输入6位验证码');
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final response = await _apiService.register(
        phone: phone,
        password: password,
        code: code,
      );
      Navigator.pop(context); // Close loading dialog

      _showSuccessMessage('注册成功！');
      // 注册成功后，可以考虑自动登录并跳转到主页
      // final authResponse = response.data;
      // _apiService.setAuthToken(authResponse.token);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (Route<dynamic> route) => false,
      );
    } on ApiError catch (e) {
      Navigator.pop(context); // Close loading dialog
      _showErrorMessage(e.message);
    } catch (e) {
      Navigator.pop(context); // Close loading dialog
      _showErrorMessage('注册时发生错误: $e');
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    bool obscureText = false,
    String? hintText,
    IconData? prefixIcon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
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
            color: const Color(0xFF8B4513),
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
        fillColor: const Color(0xFFFDEBEB).withAlpha(128),
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
          child: _buildTextField(
            controller: _verificationCodeController,
            labelText: '验证码',
            hintText: '请输入6位验证码',
            prefixIcon: Icons.sms,
            keyboardType: TextInputType.number,
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
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
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
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
}