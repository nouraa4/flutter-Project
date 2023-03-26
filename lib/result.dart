import 'package:flutter/material.dart';
import 'package:intro_flutter/split.dart';

class result extends StatefulWidget{
  final String bill;
  final String tax;
  final double tip;
  final double frindes;
  result(this.bill, this.tax, this.frindes, this.tip);
  @override
  _result createState() => _result();
}

class _result extends State<result>{
    String divideeamount =  '';
    @override
  void initState(){
    super.initState();
    dividedamount();
  }

  dividedamount(){
    double taxamount = double.parse(widget.bill)* (double.parse(widget.tax) / 100);
    double finalbill = (double.parse(widget.bill) + taxamount + widget.tip ) / widget.frindes;
  setState(() {
    divideeamount = finalbill.toStringAsFixed(2);
  });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20, right:20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child: Text(
              "Result", 
              style: TextStyle(fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w700),
            ),
            ),
            SizedBox(height: 20,),
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
                        Text("Equally Divded", 
                         style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                        Text(
                         "\$$divideeamount", 
                         style: TextStyle(fontSize: 30, color: Colors.grey, fontWeight: FontWeight.w700)),
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
                            Text("Friends", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                            Text("Tax", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                            Text("Tip", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                          ],
                        ),
                        SizedBox(width: 10,
                        ),
                        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.frindes.toString() , style:TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                        Text("${widget.tax} %", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                        Text("\$${widget.tip.round().toString()}", style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700)),
                      ],
                    )
                      ],
                    ),
                  ),
                ],
              ),
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
                    child: Text("Calculate again ?"),
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
          )  
      ),
    );
  }

}