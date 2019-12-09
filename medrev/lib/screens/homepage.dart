import 'package:flutter/material.dart';
import 'package:MedRev/blocs/drugtrackerbloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {  
  @override
  Widget build(BuildContext context) {
    DrugTrackerBloc bloc = Provider.of<DrugTrackerBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xff23395B),
      ), 
      backgroundColor: Color(0xff23395B),
      body: Column(
        children: <Widget>[
          Center( 
            child: Column(children: <Widget>[
              Image.asset(
                'assets/medrev_logo.png',
                scale: 1.0,
              ), 
              RaisedButton(
                color: Color(0xff406E8E),
                textColor: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffBDC9C9),)
                ),
                child: Text("My Medication"), onPressed: () async { 
                if(bloc.isLoggedIn){
                  bloc.changePage("myMedications");
                }
                else{
                  bloc.redirectToLogin("myMedications");
                  bloc.changePage("registerlogin");
                }
              },),
              RaisedButton( 
                color: Color(0xff406E8E),
                textColor: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffBDC9C9),)
                ),
                child: Text("Search For Medication"), 
                onPressed: () async { 
                bloc.changePage("search");
              },),
              bloc.isLoggedIn ? 
                Text("Logged In") : 
                RaisedButton(
                  color: Color(0xff406E8E),
                  textColor: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xffBDC9C9),)
                  ),
                  child: Text("Register / Login"), 
                  onPressed: () async { 
                  bloc.changePage("registerlogin"); 
                },),
              Text(bloc.didLoginFail ? "Login failed" : "", style: TextStyle(color: Colors.redAccent),),
              Text(bloc.didRegisterFail ? "Registration failed" : "", style: TextStyle(color: Colors.redAccent),)
            ]),
      ),



    ],),);
  }
}

