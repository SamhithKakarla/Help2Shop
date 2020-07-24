import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()

));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help2Shop",
          style: TextStyle(
            fontWeight: FontWeight.bold,

          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),

      floatingActionButton: Center(
        child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 20.0,
                  ) ,
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn())
                  );
                },
              ),

              RaisedButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 20.0,
                  ) ,
                ),
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp())
                  );
                },
              ),
            ]
        ),
      ),
    );
  }
}


class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In",
          style: TextStyle(
            fontWeight: FontWeight.bold,

          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,

          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
    );
  }
}
