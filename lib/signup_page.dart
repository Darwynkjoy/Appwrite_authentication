import 'package:appwrite_authentication/appwrite_service.dart';
import 'package:appwrite_authentication/login_page.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget{
  @override
  State<SignupPage> createState()=> _signupState();
}
class _signupState extends State<SignupPage>{
  late AppwriteService _appwriteService;

  void initState(){
    super.initState();
    _appwriteService = AppwriteService();
  }

  TextEditingController nameContoller=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController PasswordController=TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up",style: TextStyle(fontSize: 30,color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextField(
              controller: nameContoller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),),
                  labelText: "Name",labelStyle: TextStyle(color: Colors.lightBlueAccent,fontSize: 20),
                  hintText: "Enter your full name",hintStyle: TextStyle(fontSize: 20,color: Colors.blueGrey),
                  ),
            ),
            SizedBox(height: 10,),
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
              onPressed: ()async{
                if(nameContoller.text.isNotEmpty && emailController.text.isNotEmpty && PasswordController.text.isNotEmpty){
                  try{
                    await _appwriteService.registerUser(emailController.text,PasswordController.text, nameContoller.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                    nameContoller.clear();
                    emailController.clear();
                    PasswordController.clear();
                  }catch(e){
                    print("error adding user: $e");
                  }
                }
              }, child: Text("SignUp",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
              ),
              SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?",style: TextStyle(fontSize: 18,),),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                },
                child:  Text("Login",style: TextStyle(fontSize: 20,color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}