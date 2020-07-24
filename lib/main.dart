import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("HELP TO SHOP"),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),

      body: Center(
        heightFactor: 10,
        child: Text(
          "Please create an acount",
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.amber,
          ) ,
        ),
      ),


      floatingActionButton: Align(
        alignment: Alignment.centerRight,
        child: Row(
            children: [
              RaisedButton(
                child: Text(
                  'Customer',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ) ,
                ),
                onPressed: (){},
              ),
              RaisedButton(
                child: Text(
                  'driver',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ) ,
                ),
                onPressed: (){},
              ),
              RaisedButton(
                child: Text(
                  'store',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                  ) ,
                ),
                onPressed: (){},
              ),
            ]
        ),
      ),

    ),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



