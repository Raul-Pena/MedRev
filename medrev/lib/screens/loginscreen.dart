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
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xff23395B),
      ), 
      backgroundColor: Color(0xff23395B),
      body: 
      Padding(
        padding: EdgeInsets.all(16.0),
        child:
        Column(children: <Widget>[
          Image.asset(
              'assets/medrev_logo.png',
              scale: 1.0,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,16.0,0.0,16.0),
          ),
          TextField(
            controller: usernameCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color(0xffC3CFDB),
              hintStyle: TextStyle(color: Color(0xffffffff)),
              labelText: 'Username',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,16.0,0.0,16.0),
          ),
          TextField(
            controller: passwordCtrl, 
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color(0xffC3CFDB),
              hintStyle: TextStyle(color: Color(0xffffffff)),
              labelText: 'Password',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,16.0,0.0,16.0),
          ),
          RaisedButton(
            color: Color(0xff406E8E),
            textColor: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffBDC9C9),)
            ),
            child: Text("Login"), 
            onPressed: () async {
            //fetch token
              bloc.attemptLogin(usernameCtrl.text, passwordCtrl.text);
              if(bloc.isLoggedIn){
                if(bloc.wasRedirected){
                  bloc.changePage(bloc.redirectedFrom);
                }else{
                  bloc.changePage("home");
                }
              }
          },),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,16.0,0.0,16.0),
          ),
          RaisedButton(
            color: Color(0xff406E8E),
            textColor: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffBDC9C9),)
            ),
            child: 
              Text("Register"), 
            onPressed: () async {
            //fetch token
              bloc.attemptRegistration(usernameCtrl.text, passwordCtrl.text);
              if(bloc.isLoggedIn){
                if(bloc.wasRedirected){
                  bloc.changePage(bloc.redirectedFrom);
                }else{
                  bloc.changePage("home");
                }
              }
          },),
          Text(bloc.didLoginFail ? "Login failed" : "", style: TextStyle(color: Colors.redAccent),),
          Text(bloc.didRegisterFail ? "Registration failed" : "", style: TextStyle(color: Colors.redAccent),)
        ],
        ),
        )
        );

  }
}