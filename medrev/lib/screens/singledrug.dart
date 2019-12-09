import 'package:flutter/material.dart';
import 'package:MedRev/blocs/drugtrackerbloc.dart';
import 'package:MedRev/models/drug.dart'; 
import 'package:provider/provider.dart'; 

class SingleDrug extends StatefulWidget {
  @override
  _SingleDrugState createState() => _SingleDrugState();
}

class _SingleDrugState extends State<SingleDrug> {
  @override
  Widget build(BuildContext context) {
    DrugTrackerBloc bloc = Provider.of<DrugTrackerBloc>(context);
    return Scaffold( 
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color(0xff23395B),

        actions: <Widget>[ 
          // action button
          IconButton(
            icon: Image.asset(
                'assets/medrev_logo.png',
                scale: 0.25,
            ),
            onPressed: () {
              bloc.changePage("home");
          },),
          // IconButton(
          //   icon: Image.asset(
          //       'assets/medrev_logo.png',
          //       scale: 0.25,
          //   ),
          //   onPressed: () {
          //     bloc.changePage("home");
          // },),
            ]

      ), 
      backgroundColor: Color(0xff23395B),
      body: Column(children: <Widget>[ 
        bloc.testing  ? Padding( 
                          padding: EdgeInsets.all(8.0),
                          child: Column(children: <Widget>[
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.network(
                                  'https://scontent.harristeeter.com/legacy/productimagesroot/DJ/7/23627.jpg',
                                  scale: 2.0,
                                ),
                                Text("Tylenol")
                              ], ),
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("It can treat minor aches and pains, and reduces fever.")
                              ], ),
                            Row( 
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Tylenol (acetaminophen) is a pain reliever and a fever reducer. Tylenol is used to treat many conditions such as headache, muscle aches, arthritis, backache, toothaches, colds, and fevers. Tylenol may also be used for purposes not listed in this medication guide")
                            ], ), 
                          ],)
                        )
                    :   ListView.builder(
                          itemCount: 1,
                          itemBuilder: (_,i){
                            Drug p = bloc.mydruglist[i];
                            return Column(children: <Widget>[ 
                              Row(children: <Widget>[ 
                                Text(p.name)
                              ],),
                              Row(children: <Widget>[ 
                                Text(p.obtained)
                              ],),
                              Row(children: <Widget>[ 
                                Text(p.refill)
                              ],), 
                            ],); 
                          },
                        ),  
      ],) 
    );
  }
}