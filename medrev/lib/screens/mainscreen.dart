import 'package:flutter/material.dart';
import 'package:MedRev/blocs/drugtrackerbloc.dart';
import 'package:MedRev/models/drug.dart'; 
import 'package:provider/provider.dart'; 

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    DrugTrackerBloc bloc = Provider.of<DrugTrackerBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text("MedRev"),),
      body: Column(children: <Widget>[
        Padding( 
          padding: EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Column(children: <Widget>[ 
                Text("Drug Name")
              ],),
              Column(children: <Widget>[ 
                Text("Date Obtained")
              ],),
              Column(children: <Widget>[ 
                Text("Refill Date")
              ],), 
          ],),
        ),
        
        ListView.builder(
          itemCount: bloc.mydruglist.length,
          itemBuilder: (_,i){
            Drug p = bloc.mydruglist[i];
            return Row(children: <Widget>[ 
              Column(children: <Widget>[ 
                Text(p.name)
              ],),
              Column(children: <Widget>[ 
                Text(p.obtained)
              ],),
              Column(children: <Widget>[ 
                Text(p.refill)
              ],), 
            ],); 
          },
        ),
      ],) 
    );
  }
}