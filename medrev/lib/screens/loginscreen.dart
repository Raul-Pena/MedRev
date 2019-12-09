import 'package:flutter/material.dart';
import 'package:MedRev/blocs/drugtrackerbloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DrugTrackerBloc bloc = Provider.of<DrugTrackerBloc>(context);

    return Scaffold(appBar: AppBar(title: Text("Login"),), body: Column(children: <Widget>[
      TextField(controller: usernameCtrl,),
      TextField(controller: passwordCtrl, obscureText: true,),
      RaisedButton(child: Text("Login"), onPressed: () async {
        //fetch token
        // bloc.attemptLogin(usernameCtrl.text, passwordCtrl.text);
        bloc.attemptLogin();
      },),
      RaisedButton(child: Text("Register"), onPressed: () async {
        //fetch token
        bloc.attemptRegistration();
      },),
      Text(bloc.didLoginFail ? "Login failed" : "", style: TextStyle(color: Colors.redAccent),),
      Text(bloc.didRegisterFail ? "Registration failed" : "", style: TextStyle(color: Colors.redAccent),)
    ],),);
  }
}