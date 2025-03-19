import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ppkd_b_1/service/firebase_auth.dart';
import 'package:ppkd_b_1/service/pref_handler.dart';
import 'package:ppkd_b_1/views/auth/register_screen.dart';
import 'package:ppkd_b_1/views/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false; // Untuk animasi loading
  bool _isLoadingGoogle = false; // Untuk animasi loading
  bool _isObsecure = false;
  final bool _isActive = true;
  final _formKey = GlobalKey<FormState>();
  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final result = await _authService.loginUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (result == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => MainScreen(
                email: _emailController.text,
                phone: _phoneController.text,
              ),
        ),
      );
      _emailController.clear();
      _passwordController.clear();
    }
  }

  void _handleGoogleSignIn() async {
    setState(() => _isLoadingGoogle = true);

    final result = await _authService.signInWithGoogle();

    setState(() => _isLoadingGoogle = false);

    if (result == "success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => MainScreen(
                email: _emailController.text,
                phone: _phoneController.text,
              ),
        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          space(),
                          Text(
                            "Login to access your account",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  space(height: 24),

                  titleField("Email Address"),
                  space(),

                  textFieldConst(
                    hintText: "Enter Email",
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email belum di isi";
                      }
                      return null;
                    },
                  ),
                  space(),
                  // titleField("Phone Number"),
                  // space(),

                  // textFieldConst(
                  //   hintText: "Enter Phone Number",
                  //   controller: _phoneController,
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Nomor Telpon belum di isi";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  space(height: 16),

                  titleField("Password"),
                  space(height: 16),

                  textFieldConst(
                    hintText: "Enter Password",
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password belum di isi";
                      }
                      return null;
                    },
                  ),
                  space(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(color: Color(0xffF34B1B)),
                      ),
                    ],
                  ),
                  space(),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.grey.shade300,
                  //     elevation: 0,
                  //     side: const BorderSide(width: 2, color: Colors.black87),
                  //   ),
                  //   onPressed:
                  //       _isActive
                  //           ? () {
                  //             // if (!_formKey.currentState!.validate())
                  //             //   print(_emailController.text);
                  //             // print(_passwordController.text);
                  //             // print(_phoneController.text);
                  //             // ScaffoldMessenger.of(context).showSnackBar(
                  //             //   SnackBar(content: Text("Silahkan isi dulu")),
                  //             // );
                  //             Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                 builder: (context) => const MainScreen(),
                  //               ),
                  //             );
                  //             // if (_emailController.text.length < 5) {
                  //             //   ScaffoldMessenger.of(context).showSnackBar(
                  //             //     SnackBar(content: Text("Silahkan isi dulu")),
                  //             //   );
                  //             // }
                  //           }
                  //           : null,
                  //   child: Text("Login"),
                  // ),
                  InkWell(
                    onTap:
                        _isActive
                            ? _handleLogin
                            // if (!_formKey.currentState!.validate())
                            //   print(_emailController.text);
                            // print(_passwordController.text);
                            // print(_phoneController.text);
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text("Silahkan isi dulu")),
                            // );
                            // var userId = await PreferenceHandler.getId();
                            // print(userId);
                            // PreferenceHandler.saveId(_emailController.text);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder:
                            //         (context) => MainScreen(
                            //           email: _emailController.text,
                            //           phone: _phoneController.text,
                            //         ),
                            //   ),
                            // );
                            // if (_emailController.text.length < 5) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(content: Text("Silahkan isi dulu")),
                            //   );
                            // }
                            : null,
                    child: Container(
                      padding: EdgeInsets.all(16),

                      width: double.infinity,
                      decoration: BoxDecoration(
                        color:
                            _isActive
                                ? Color(0xff283FB1)
                                : Color(0xff283FB1).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),

                      child:
                          _isLoading
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                              : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                    ),
                  ),
                  space(height: 24),
                  Text(
                    "Or Sign in with",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  space(height: 24),
                  InkWell(
                    onTap: _handleGoogleSignIn,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child:
                          _isLoadingGoogle
                              ? Center(child: CircularProgressIndicator())
                              : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/google.png",
                                    height: 16,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "Google",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                    ),
                  ),
                  space(height: 24),
                  RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign Up',
                          recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const RegisterScreen(),
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
    onChanged: (value) {
      // if (controller.text.length > 5) {
      //   setState(() {
      //     _isActive = true;
      //   });
      // } else {
      //   setState(() {
      //     _isActive = false;
      //   });
      // }
    },

    controller: controller,
    validator: validator,
    obscureText: isPassword ? _isObsecure : false,
    decoration: InputDecoration(
      hintText: hintText,
      suffixIcon:
          isPassword
              ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObsecure = !_isObsecure;
                    print("_isObsecure");
                    print(_isObsecure);
                  });
                },
                icon: Icon(
                  _isObsecure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
              )
              : null,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
    ),
  );

  Widget titleField(String text) => Row(
    children: [Text(text, style: TextStyle(fontSize: 12, color: Colors.grey))],
  );
}
