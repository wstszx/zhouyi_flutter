import 'package:flutter/material.dart';
import '../services/api_service.dart';

class BindAlipayScreen extends StatefulWidget {
  const BindAlipayScreen({super.key});

  @override
  State<BindAlipayScreen> createState() => _BindAlipayScreenState();
}

class _BindAlipayScreenState extends State<BindAlipayScreen> {
  final _apiService = ApiService();
  final _formKey = GlobalKey<FormState>();
  final _alipayController = TextEditingController();
  final _realNameController = TextEditingController();
  final _idCardController = TextEditingController();

  @override
  void dispose() {
    _alipayController.dispose();
    _realNameController.dispose();
    _idCardController.dispose();
    super.dispose();
  }

  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  Future<void> _bindAlipay() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final response = await _apiService.bindAlipay(
        realName: _realNameController.text,
        idCard: _idCardController.text,
        alipayAccount: _alipayController.text,
      );
      Navigator.pop(context); // Close loading dialog

      if (response.success) {
        _showSnackBar(response.message ?? '绑定成功！');
        Navigator.pop(context); // Go back
      } else {
        _showSnackBar(response.message ?? '绑定失败', isError: true);
      }
    } on ApiError catch (e) {
      Navigator.pop(context); // Close loading dialog
      _showSnackBar(e.message, isError: true);
    } catch (e) {
      Navigator.pop(context); // Close loading dialog
      _showSnackBar('操作时发生错误: $e', isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绑定修改支付宝/实名'),
        backgroundColor: const Color(0xFFFDEBEB),
        elevation: 0,
        foregroundColor: const Color(0xFF8B4513),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextFormField(
                controller: _realNameController,
                labelText: '真实姓名',
                validator: (value) => value!.isEmpty ? '请输入真实姓名' : null,
              ),
              const SizedBox(height: 20),
              _buildTextFormField(
                controller: _idCardController,
                labelText: '身份证号',
                validator: (value) => value!.isEmpty ? '请输入身份证号' : null,
              ),
              const SizedBox(height: 20),
              _buildTextFormField(
                controller: _alipayController,
                labelText: '支付宝账号',
                validator: (value) => value!.isEmpty ? '请输入支付宝账号' : null,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _bindAlipay,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B4513),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text('保存'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String labelText,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Color(0xFF8B4513)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF8B4513)),
        ),
      ),
      validator: validator,
    );
  }
}