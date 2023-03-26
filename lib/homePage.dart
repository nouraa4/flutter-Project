import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intro_flutter/split.dart';

class homePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    background: Colors.white;
    return Scaffold(
      body: 
      Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Image.asset('assets/card.png', 
              width: 380,
              height: 260,
              ),
            ),
          
             Padding(
               padding: const EdgeInsets.only(left: 36, right: 36, bottom: 10),
               child: Text("One tap to split your bill", textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 128, 128, 128)),
                ),
             ),
               Text("Let's make splitting bills easy!", textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey),
              ), 

              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: SizedBox(
                  width: 280,
                  height: 50,
                  child: ElevatedButtonTheme(
                    data: ElevatedButtonThemeData(
                      style: ButtonStyle(
                        backgroundColor: 
                        MaterialStateProperty.all<Color>(Colors.pink.shade200))) ,
                    child: ElevatedButton(
                    child: Text("Get Stareted"),
                    style: ElevatedButton.styleFrom(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // <-- Radius
                    ),),
                    onPressed: () {
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  BillSplit()),
                    );},    
                    )
                    ),
                ),
              ),
        ],
        ),
      )
    );

  }
}