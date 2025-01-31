import 'package:appwrite/appwrite.dart';

class AppwriteService {

  late Client client;
  late Account account;

  static const endpoint ="https://cloud.appwrite.io/v1";
  static const projectId="679c2fd2001f4edda4b1";

  AppwriteService(){
    client = Client();
    client.setEndpoint(endpoint).setProject(projectId);
    account=Account(client);
  }

  Future<void> registerUser(String email,String password,String name)async{
    try{
      final response=await account.create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name
        );
        print("user registered: ${response.$id}");
    }catch(e){
      print("error: $e");
    }
  }

  Future<void> loginUser(String email,String password)async{
    try{
      final  Session = await account.createEmailPasswordSession(
        email: email,
        password: password
        );
        print("user logged in ${Session.userId}");
    }on AppwriteException catch(e){
      if(e.code == 401){
        print("incorrect email or password");
        throw Exception("incorrect email or password");
      }else{
        print("error: ${e.message}");
        throw Exception(e.message);
      }
    }catch(e){
      print("unexpected error: $e");
      throw Exception("an unexpected error occured");
    }
  }

  Future<void> logoutUser()async{
    try{
      await account.deleteSession(sessionId: "current");
      print("user logged out");
    }catch(e){
      print("error: ${e}");
    }
  }
}