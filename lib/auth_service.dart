import 'package:flutter/material.dart';
import 'db_helper.dart';
import 'model/user.dart';
import 'dashboard.dart';

class AuthService extends StatefulWidget {
  const AuthService({super.key});

  @override
  State<AuthService> createState() => _AuthServiceState();
}

class _AuthServiceState extends State<AuthService> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final DBHelper db = DBHelper();

  bool isLogin = true;


  void submit() async {

    String username = usernameController.text.trim();
    String password = passwordController.text.trim();


    if(username.isEmpty || password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Enter username and password"),
        ),
      );
      return;
    }


    if(isLogin){

      var result = await db.login(username, password);

      if(result != null){

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context)=> const Dashboard(),
          ),
        );

      }
      else{

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid username/password"),
          ),
        );

      }


    }
    else{


      try{

        await db.insertUser(
          User(
            username: username,
            password: password,
          ),
        );


        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Signup Successful"),
          ),
        );


        setState(() {
          isLogin = true;
          usernameController.clear();
          passwordController.clear();
        });


      }
      catch(e){

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );

      }

    }

  }


  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: Text(
          isLogin ? "Login" : "Signup",
        ),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          children:[


            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText:"Username",
              ),
            ),


            TextField(
              controller: passwordController,
              obscureText:true,
              decoration: const InputDecoration(
                labelText:"Password",
              ),
            ),


            const SizedBox(height:20),


            ElevatedButton(

              onPressed: submit,

              child: Text(
                isLogin ? "Login" : "Signup",
              ),

            ),


            TextButton(

              onPressed:(){

                setState(() {
                  isLogin=!isLogin;
                });

              },

              child: Text(
                isLogin
                    ? "Create New Account"
                    : "Already have account? Login",
              ),

            )

          ],

        ),

      ),

    );

  }

}