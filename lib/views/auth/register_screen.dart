import 'package:flutter/material.dart';
import 'package:ppkd_b_1/service/firebase_auth.dart';
import 'package:ppkd_b_1/service/pref_handler.dart';
import 'package:ppkd_b_1/views/auth/login_screen.dart';
import 'package:ppkd_b_1/views/main/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObsecure = false;
  final bool _isActive = true;
  final _formKey = GlobalKey<FormState>();

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
                            "Welcome",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          space(),
                          Text(
                            "Register to continue",
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

                  InkWell(
                    onTap:
                        _isActive
                            ? () async {
                              final result = await AuthService().signUpUser(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );

                              if (result == "success") {
                                _emailController.clear();
                                _passwordController.clear();
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              }
                            }
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

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Register",
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
                  // space(height: 24),
                  // Text(
                  //   "Or Sign in with",
                  //   style: TextStyle(color: Colors.grey, fontSize: 12),
                  // ),
                  // space(height: 24),
                  // Container(
                  //   padding: EdgeInsets.all(16),

                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(6),
                  //   ),

                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Image.asset("assets/images/google.png", height: 16),
                  //       SizedBox(width: 8),
                  //       Text("Google", style: TextStyle(fontSize: 14)),
                  //     ],
                  //   ),
                  // ),
                  space(height: 24),
                  RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign In',
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
