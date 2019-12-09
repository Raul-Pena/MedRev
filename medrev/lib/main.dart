import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'blocs/drugtrackerbloc.dart';
import 'screens/homepage.dart'; 
import 'screens/loginscreen.dart';
import 'screens/mainscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    DrugTrackerBloc bloc = DrugTrackerBloc();
    return ChangeNotifierProvider(builder: (_) => bloc,
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SetupWidget(),
    ),);
  }
}

class SetupWidget extends StatefulWidget {
  SetupWidget({Key key}) : super(key: key);

  @override
  _SetupWidgetState createState() => _SetupWidgetState();
}

class _SetupWidgetState extends State<SetupWidget> {
  @override
  Widget build(BuildContext context) {
    DrugTrackerBloc bloc = Provider.of<DrugTrackerBloc>(context);
 
    switch (bloc.currentpage) { 
      case "registerlogin": { 
        print("Login"); 
        return LoginScreen(); 
      } break;
     
      case "myMedications": { 
        print("myMedications"); 
        return MainScreen();  
      } break;
      
      case "singleMedication": { 
        print("myMedications"); 
        return MainScreen();  
      } break; 

      case "interaction": 
        print("Interactions");  
        return HomePage();
        break;

      case "home":   
      default: 
        print("Home"); 
        return HomePage();
        break; 
    } 
  }
}

