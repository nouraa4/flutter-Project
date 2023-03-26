import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intro_flutter/result.dart';

import 'homePage.dart';

class BillSplit extends StatefulWidget{
  @override
  _BillSplitState createState() => _BillSplitState();
}


class _BillSplitState extends State<BillSplit>{
  double frindes = 0.0;
  double tip = 0.0;
  String tax = '0';
  String bill = '';

  buildbutton(String txt){
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(padding: EdgeInsets.all(20)),
        onPressed: () {
          if (txt == 'Clear'){
            setState(() {
              bill = '';
            });
          } else{
            setState(() {
              bill += txt;
            });
          }
        }, 
        child: Text(
          txt, 
          style: TextStyle(fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w700), 
        ),
      ),
    );
  }
  TextStyle infostyle = TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children:[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Text("Split Bill", 
              style: TextStyle(fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pink.shade50,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total", 
                         style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                        Text(
                         bill, 
                         style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Friends", style: infostyle,),
                            Text("Tax", style: infostyle,),
                            Text("Tip", style: infostyle,),
                          ],
                        ),
                        SizedBox(width: 10,
                        ),
                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(frindes.round().toString() , style: infostyle,),
                        Text("$tax %", style: infostyle,),
                        Text("\$${tip.round().toString()}", style: infostyle,),
                      ],
                    )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,
            ),
            Text(
              "How many friends ?", 
              style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700),
            ),
            Slider(
              min: 0,
              max: 20,
              divisions: 20,
              activeColor: Colors.pink,
              inactiveColor: Colors.grey,
              value: frindes, 
            onChanged: (value) {
              setState(() {
                frindes = value;
              });
            },
            ),
            SizedBox(height: 10,
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Text(
                      "TIP", 
                      style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                tip--;
                              });
                            },
                            backgroundColor: Colors.deepPurple.shade50,
                            child: Icon(Icons.remove, color:  Colors.grey.shade800,), 
                            ),
                        ),
                        Text(
                          "\$${tip.round().toString()}", 
                          style: TextStyle(fontSize: 27, color: Colors.grey, fontWeight: FontWeight.w700),
                        ),
                         Container(
                          width: 40,
                          height: 40,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                tip++;
                              });
                            },
                            backgroundColor: Colors.deepPurple.shade50,
                            child: Icon(Icons.add, color:  Colors.grey.shade800,), 
                            ),
                        ),
                      ]
                    )
                    ],
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.pink.shade50,
                    borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value){
                          setState(() {
                            tax = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                             labelText: "Tax in %",
                            labelStyle: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700),
                         ),
                        ),
                       ), 
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildbutton("1"),
                      buildbutton("2"),
                      buildbutton("3"),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("4"),
                      buildbutton("5"),
                      buildbutton("6"),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("7"),
                      buildbutton("8"),
                      buildbutton("9"),
                    ],
                  ),
                  Row(
                    children: [
                      buildbutton("."),
                      buildbutton("0"),
                      buildbutton("Clear"),
                    ],
                  ),
                  Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  width: 280,
                  height: 50,
                  child: ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                      style: ButtonStyle(
                        backgroundColor: 
                        MaterialStateProperty.all<Color>(Colors.pink.shade200))) ,
                    child: ElevatedButton(
                    child: Text("Split Bill"),
                    style: ElevatedButton.styleFrom(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),),
                    onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  result(bill, tax, frindes, tip)),
                    );},    
                    )
                    ),
                ),
              ),
          ],
        )
      ),
    );
  }
}
 