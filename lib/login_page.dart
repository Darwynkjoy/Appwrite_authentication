import 'package:appwrite_authentication/homescreen.dart';
import 'package:appwrite_authentication/signup_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState()=> _loginState();
}
class _loginState extends State<LoginPage>{

  TextEditingController emailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",style: TextStyle(fontSize: 30,color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                  labelText: "Email",labelStyle: TextStyle(color: Colors.lightBlueAccent,fontSize: 20),
                  hintText: "Example@email.com",hintStyle: TextStyle(fontSize: 20,color: Colors.blueGrey),
                  ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: PasswordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                  labelText: "Password",labelStyle: TextStyle(color: Colors.lightBlueAccent,fontSize: 20),
                  hintText: "Enter your Password",hintStyle: TextStyle(fontSize: 20,color: Colors.blueGrey),
                  ),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
              ),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homescreen()));
              }, child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
              ),
              SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?",style: TextStyle(fontSize: 18,),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
                },
                child:  Text("Signup",style: TextStyle(fontSize: 20,color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}