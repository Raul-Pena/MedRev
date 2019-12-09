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

    return Scaffold(appBar: AppBar(title: Text("Login"),), body: Column(children: <Widget>[
      Center( child: Column(children: <Widget>[ 
          RaisedButton(child: Text("My Medication"), onPressed: () async { 
            bloc.changePage("myMedications");
          },),
          RaisedButton( child: Text("Search For Medication"), onPressed: () async { 
            bloc.changePage("search");
          },),
          bloc.isLoggedIn ? 
            Text("Logged In") : 
            RaisedButton(child: Text("Register / Login"), onPressed: () async { 
              bloc.changePage("registerlogin"); 
            },),
          Text(bloc.didLoginFail ? "Login failed" : "", style: TextStyle(color: Colors.redAccent),),
          Text(bloc.didRegisterFail ? "Registration failed" : "", style: TextStyle(color: Colors.redAccent),)
        ]),
      ),



    ],),);
  }
}

