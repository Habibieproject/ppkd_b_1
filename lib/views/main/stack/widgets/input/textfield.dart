import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          titleField("Email"),
          textField("email", controller: _emailController),
          SizedBox(height: 24,),
          titleField("Password"),
          textField("password", controller: _passwordController),

Row(
  children: [
    Expanded(child: Text("data email\n${_emailController.text}")),
  ],
),
Row(
  children: [
    Expanded(child: Text("data password\n${_passwordController.text}")),
  ],
),
          
          SizedBox(height: 24,),

      Container(
      padding: const EdgeInsets.all(16.0),
        
        width: double.infinity,
        decoration: BoxDecoration(
      color: Colors.indigoAccent,
      borderRadius: BorderRadius.circular(50)),
        
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Login",style: TextStyle(fontSize: 24),),
      ],
        ),)
        ],
      ),
    );
  }

  TextField textField(String hintext, {required TextEditingController controller}) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          
        });
      },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            hintText: "Masukkan $hintext"
          ),
        );
  }

  Row titleField(String text) {
    return Row(
          children: [
            Text(text,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        );
  }
}