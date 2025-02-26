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
          textField("password", controller: _passwordController,isPassword: true),

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
      color:_emailController.text.length>10?Colors.red: Colors.indigoAccent,
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

  TextField textField(String hintext, {required TextEditingController controller,bool isPassword = false}) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          
        });
      },
      obscuringCharacter: "x",
      obscureText: isPassword,
      style: TextStyle(),
      keyboardType: TextInputType.name,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            hintText: "Masukkan $hintext",
            labelText: isPassword? "Password":"Email",
            prefixIcon: isPassword? Icon(Icons.key):Icon(Icons.email),
            suffixIcon: isPassword? Icon(Icons.visibility):null
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