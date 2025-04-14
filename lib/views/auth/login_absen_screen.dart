import 'package:flutter/material.dart';
import 'package:ppkd_b_1/repository/auth_repository.dart';
import 'package:ppkd_b_1/service/pref_handler.dart';

class LoginAbsenScreen extends StatefulWidget {
  const LoginAbsenScreen({super.key});

  @override
  State<LoginAbsenScreen> createState() => _LoginAbsenScreenState();
}

class _LoginAbsenScreenState extends State<LoginAbsenScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthRepository _repo = AuthRepository();

  String? _message;
  bool _loading = false;
  void _handleLogin() async {
    setState(() {
      _loading = true;
      _message = null;
    });

    final res = await _repo.login(
      _emailController.text.trim(),
      _passwordController.text,
    );

    setState(() => _loading = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(res.message),
        backgroundColor: res.data != null ? Colors.green : Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );

    if (res.data != null) {
      print('Token: ${res.data!.token}');
      PreferenceHandler.saveToken(res.data!.token);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (_message != null) ...[
              Text(
                _message!,
                style: TextStyle(
                  color:
                      _message == 'Login berhasil' ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 12),
            ],
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loading ? null : _handleLogin,
              child:
                  _loading
                      ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                      : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
