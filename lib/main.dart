import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFB415B),
          fontFamily: "Ubuntu"
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{

  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 40.0,),
            Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 40.0,),
            buildTextField("Name"),
            SizedBox(height: 20.0,),
            buildTextField("Email"),
            SizedBox(height: 20.0,),
            buildTextField("Phone"),
            SizedBox(height: 20.0,),
            buildTextField("Password"),
            SizedBox(height: 20.0,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                ],
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            SizedBox(height: 10.0,),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an Account?"),
                    SizedBox(width: 10.0,),
                    Text("SIGN IN", style: TextStyle(color: Theme.of(context).primaryColor,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText){
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: (hintText == "Name" ? Icon(Icons.people) : Icon(Icons.lock) ),


        suffixIcon: hintText == "Password" ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ) : null,
      ),
      obscureText: hintText == "Password" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer(){

    return Container(

      height: 56.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        gradient: LinearGradient(
            colors: [
              Color(0xFFFB415B),
              Color(0xFFEE5623)
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft
        ),
      ),

      child: Center(
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );

  }
}