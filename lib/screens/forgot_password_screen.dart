import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../services/api_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _apiService = ApiService();
  final _phoneController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _verificationCodeController = TextEditingController();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool _isCountingDown = false;
  int _countdown = 0;

  @override
  void dispose() {
    _phoneController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _verificationCodeController.dispose();
    super.dispose();
  }

  void _showErrorMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccessMessage(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  bool _isValidPhone(String phone) {
    return RegExp(r'^1[3-9]\d{9}$').hasMatch(phone);
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

  void _sendVerificationCode() async {
    if (_isCountingDown) return;
    final phone = _phoneController.text.trim();
    if (!_isValidPhone(phone)) {
      _showErrorMessage('请输入有效的手机号');
      return;
    }

    setState(() {
      _isCountingDown = true;
      _countdown = 60;
    });
    _startCountdown();

    try {
      await _apiService.sendSms(phone: phone, type: 'reset');
      _showSuccessMessage('验证码已发送');
    } on ApiError catch (e) {
      _showErrorMessage(e.message);
      setState(() { _isCountingDown = false; _countdown = 0; });
    } catch (e) {
      _showErrorMessage('发送验证码时出错: $e');
      setState(() { _isCountingDown = false; _countdown = 0; });
    }
  }

  void _resetPassword() async {
    final phone = _phoneController.text.trim();
    final password = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    final code = _verificationCodeController.text.trim();

    if (!_isValidPhone(phone)) {
      _showErrorMessage('请输入有效的手机号');
      return;
    }
    if (password.length < 6) {
      _showErrorMessage('新密码长度不能少于6位');
      return;
    }
    if (password != confirmPassword) {
      _showErrorMessage('两次输入的密码不一致');
      return;
    }
    if (code.length != 6) {
      _showErrorMessage('请输入6位验证码');
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await _apiService.resetPassword(
        phone: phone,
        password: password,
        code: code,
      );
      Navigator.pop(context); // Close loading dialog

      _showSuccessMessage('密码重置成功！');
      Navigator.pop(context); // Go back to login screen
    } on ApiError catch (e) {
      Navigator.pop(context); // Close loading dialog
      _showErrorMessage(e.message);
    } catch (e) {
      Navigator.pop(context); // Close loading dialog
      _showErrorMessage('重置密码时出错: $e');
    }
  }

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
          SvgPicture.asset(
            'assets/images/background_gradient.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 120.0, 24.0, 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('易理问询', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF8B4513))),
                  const SizedBox(height: 40),
                  _buildTextField(controller: _phoneController, labelText: '手机号', hintText: '请输入手机号', prefixIcon: Icons.phone, keyboardType: TextInputType.phone),
                  const SizedBox(height: 20),
                  _buildPasswordField(controller: _newPasswordController, labelText: '新密码', obscureText: _obscureNewPassword, onToggleObscure: () => setState(() => _obscureNewPassword = !_obscureNewPassword)),
                  const SizedBox(height: 20),
                  _buildPasswordField(controller: _confirmPasswordController, labelText: '确认密码', obscureText: _obscureConfirmPassword, onToggleObscure: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword)),
                  const SizedBox(height: 20),
                  _buildVerificationCodeField(),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _resetPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8B4513),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                    ),
                    child: const Text('确定', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String labelText, String? hintText, IconData? prefixIcon, TextInputType? keyboardType}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: _inputDecoration(labelText, hintText, prefixIcon),
    );
  }

  Widget _buildPasswordField({required TextEditingController controller, required String labelText, required bool obscureText, required VoidCallback onToggleObscure}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: _inputDecoration(
        labelText,
        '请输入密码',
        Icons.lock,
      ).copyWith(
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF8B4513)),
          onPressed: onToggleObscure,
        ),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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

  InputDecoration _inputDecoration(String labelText, String? hintText, IconData? prefixIcon) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: const Color(0xFF8B4513)) : null,
      labelStyle: const TextStyle(color: Color(0xFF8B4513)),
      hintStyle: TextStyle(color: Colors.grey[400]),
      filled: true,
      fillColor: const Color(0xFFFDEBEB).withAlpha(128),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: const BorderSide(color: Color(0xFF8B4513), width: 2)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0), borderSide: BorderSide(color: Colors.grey[300]!, width: 1)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }
}