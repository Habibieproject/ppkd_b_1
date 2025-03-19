import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_b_1/service/firebase_auth.dart';
import 'package:ppkd_b_1/views/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  bool _isObsecure = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  void _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await _authService.signUpUser(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
      password: _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (result == "success") {
      _nameController.clear();
      _phoneController.clear();
      _emailController.clear();
      _passwordController.clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg_login.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  space(),
                  Text(
                    "Register to continue",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  space(height: 24),

                  titleField("Full Name"),
                  space(),
                  textFieldConst(
                    hintText: "Enter Full Name",
                    controller: _nameController,
                    validator:
                        (value) => value!.isEmpty ? "Nama belum diisi" : null,
                  ),

                  space(),
                  titleField("Phone Number"),
                  space(),
                  textFieldConst(
                    hintText: "Enter Phone Number",
                    controller: _phoneController,
                    validator:
                        (value) =>
                            value!.isEmpty ? "Nomor telepon belum diisi" : null,
                  ),

                  space(),
                  titleField("Email Address"),
                  space(),
                  textFieldConst(
                    hintText: "Enter Email",
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) return "Email belum diisi";
                      if (!RegExp(
                        r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$",
                      ).hasMatch(value)) {
                        return "Format email tidak valid";
                      }
                      return null;
                    },
                  ),

                  space(),
                  titleField("Password"),
                  space(),
                  textFieldConst(
                    hintText: "Enter Password",
                    isPassword: true,
                    controller: _passwordController,
                    validator:
                        (value) =>
                            value!.isEmpty ? "Password belum diisi" : null,
                  ),

                  space(),
                  InkWell(
                    onTap: _isLoading ? null : _registerUser,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _isLoading ? Colors.grey : Color(0xff283FB1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:
                          _isLoading
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                              : Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                    ),
                  ),

                  space(height: 24),
                  RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                          style: TextStyle(
                            color: Color(0xff283FB1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox space({double height = 12}) => SizedBox(height: height);

  Widget textFieldConst({
    String? hintText,
    bool isPassword = false,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) => TextFormField(
    controller: controller,
    validator: validator,
    obscureText: isPassword ? _isObsecure : false,
    decoration: InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );

  Widget titleField(String text) => Row(
    children: [Text(text, style: TextStyle(fontSize: 12, color: Colors.grey))],
  );
}
