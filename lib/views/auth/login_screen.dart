import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObsecure=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset("assets/images/bg_login.png",
          fit: BoxFit.cover,
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
         
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("Welcome Back",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      space(), 
                      Text("Login to access your account",style: TextStyle(fontSize: 14, color: Colors.grey),),
                    ],
                  ),
                ],
              ),
              space(height: 24),
            
              titleField("Email Address"),
                            space(),
                        
              textFieldConst(hintText: "Enter Email"),
                            space(),
              titleField("Phone Number"),
                            space(),
                        
                        
              textFieldConst(hintText: "Enter Phone Number"),
                            space(height: 16),
                        
                        
              titleField("Password"),
                                     space(height: 16),
                        
                        
              textFieldConst(
                hintText: "Enter Password",
                isPassword: true
              ),
              space(),
                        
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  
                  Text("Forgot Password",style: TextStyle(  color: Color(0xffF34B1B)),),
                ],
              ),
              space(),
                        
              Container(
                padding: EdgeInsets.all(16),
                  
                  width: double.infinity,
                  decoration: BoxDecoration(
                color:Color(0xff283FB1),
                borderRadius: BorderRadius.circular(6)),
                  
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Login",style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.bold, ),),
                ],
                  ),),
                  space(height: 24),
                  Text("Or Sign in with", style: TextStyle(color: Colors.grey, fontSize: 12),)
                  ,space(height: 24),
                   Container(
                padding: EdgeInsets.all(16),
                  
                  width: double.infinity,
                  decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(6)),
                  
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/google.png",height: 16,),
                  SizedBox(width: 8,),
                  Text("Google",style: TextStyle(fontSize: 14, ),),
                ],
                  ),),
                  space(height: 24),
                  RichText(
                        text: TextSpan(
            text: "Don’t have an account? ",
            style: TextStyle(color: Colors.grey, fontSize: 12),
            children: <TextSpan>[
              TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: Color(0xff283FB1),fontSize: 12,fontWeight: FontWeight.bold),
              ),
            ],
                        ),
                  )
                        
            ],),
          ),
        ],
      ),
    );
  }

  SizedBox space({double height=12}) => SizedBox(height: height,);

  TextField textFieldConst({String? hintText, bool isPassword=false}) => TextField(
  obscureText: isPassword?_isObsecure:false,
    decoration: InputDecoration(
      hintText: hintText,
    suffixIcon:isPassword? IconButton(onPressed: (){setState(() {
      _isObsecure=!_isObsecure;
    });}, icon: Icon(_isObsecure?Icons.visibility_off:Icons.visibility,color: Colors.grey,)):null,
      border: OutlineInputBorder(
        
        borderRadius: BorderRadius.circular(50)
      )
    ),
  );

  Widget titleField(String text) => Row(
    children: [
      Text(text,style: TextStyle(fontSize: 12,color: Colors.grey),),
    ],
  );
}