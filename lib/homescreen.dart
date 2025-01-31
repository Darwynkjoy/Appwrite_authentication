import 'package:appwrite_authentication/appwrite_service.dart';
import 'package:appwrite_authentication/login_page.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget{
  @override
  State<Homescreen> createState()=> _homescreenState();
}
class _homescreenState extends State<Homescreen>{
 late AppwriteService _appwriteService;

 void initState(){
  super.initState();
  _appwriteService =AppwriteService();
 }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("homecreen",style: TextStyle(fontSize: 30,color: Colors.white),),
        backgroundColor: Colors.lightBlueAccent,
        actions: [
          IconButton(onPressed: ()async{
            try{
            await _appwriteService.logoutUser();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage())
            );
            }catch(e){
              print(e);
            }
          }, icon: Icon(Icons.logout_outlined,color: Colors.white,size: 25,))
        ],
      ),

      body: Center(
        child: Text("homescreem"),
      ),
    );
  }
}