import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help2Shop",
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
              FlatButton(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red[700],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
              ),
              FlatButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red[700],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
            ]),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '\n\nPlease Select What Type of User You Are',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(
                  'Shopper',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red[700],
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignedInShopper()));
                },
              ),
              FlatButton(
                child: Text(
                  'Store',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red[700],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignedInStore()));
                },
              ),
            ]),
      ),
    );
  }
}

class SignedInShopper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Added
      length: 4, // Added
      initialIndex: 0, //Added
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(text: "My Profile"),
            Tab(text: "Lists"),
            Tab(text: "Favorite Stores"),
            Tab(text: "Recent Helpers"),
          ]),
          title: Text(
            "TestShopper",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red[700],
        ),
        body: TabBarView(
          children: [
            RecentHelperScroll(),
            RecentHelperScroll(),
            RecentHelperScroll(),
            RecentHelperScroll(),
          ],
        ),
      ),
    );
  }
}

class RecentHelperScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flex(direction: Axis.horizontal, children: [
      Expanded(
        flex: 1,
        child: new Container(
          color: new Color(0xFFFFFFFF),
          child: new CustomScrollView(
            scrollDirection: Axis.vertical,
            shrinkWrap: false,
            slivers: <Widget>[
              new SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                sliver: new SliverList(
                  delegate: new SliverChildBuilderDelegate(
                    (context, index) => new UserRow(user[index]),
                    childCount: user.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}

class UserRow extends StatelessWidget {
  final User user;

  UserRow(this.user);

  @override
  Widget build(BuildContext context) {
    final userThumbnail = new Container(
      margin: new EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      child: new Image(
        image: new AssetImage(user.image),
        height: 92.0,
        width: 92.0,
      ),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffffffff),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _userValue({String value, String image}) {
      return new Row(children: <Widget>[
        new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(
          "Number of Shopping Lists Filled: " + user.numListsFilled,
          style: regularTextStyle,
          textScaleFactor: 1.3,
        ),
      ]);
    }

    final userCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(user.name, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(user.address, style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xffffffff)),
          new Row(
            children: <Widget>[
              new Expanded(
                  child: _userValue(
                      value: user.numListsFilled,
                      image: 'assets/img/ic_distance.png')),
            ],
          ),
        ],
      ),
    );

    final userCard = new Container(
      child: userCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xffd32f2f),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
      ),
    );

    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            userCard,
            userThumbnail,
          ],
        ));
  }
}

class User {
  final String name;
  final String address;
  final String image;
  final String numListsFilled;

  const User({this.name, this.address, this.image, this.numListsFilled});
}

List<User> user = [
  const User(
    name: "Samhith Kakarla",
    address: "1234 DeAnza, Cupertino CA, 95014",
    image: "assets/vgt.jpg",
    numListsFilled: "2",
  ),
  const User(
    name: "Sreegurunath Siva",
    address: "5678 DeAnza, Cupertino CA, 95014",
    image: "assets/img/mars.png",
    numListsFilled: "31",
  ),
  const User(
    name: "Sreeganesh Siva",
    address: "200 Park Avenue, New York NY, 10005",
    image: "assets/img/mars.png",
    numListsFilled: "17",
  ),
  const User(
    name: "Harry Potter",
    address: "4 Privet Drive, United Kingdom",
    image: "assets/img/mars.png",
    numListsFilled: "7",
  ),
  const User(
    name: "Hermione Granger",
    address: "Hampstead London",
    image: "assets/img/mars.png",
    numListsFilled: "134",
  ),
  const User(
    name: "Ron Weasley",
    address: "The Burrow",
    image: "assets/img/mars.png",
    numListsFilled: "532",
  ),
  const User(
    name: "Tom Marvolo Riddle",
    address: "The Graveyard",
    image: "assets/img/mars.png",
    numListsFilled: "164",
  ),
  const User(
    name: "Albus Percival Wulfric Brian Dumbledore",
    address: "Hogwarts",
    image: "assets/img/mars.png",
    numListsFilled: "62442",
  ),
];

class SignedInStore extends StatefulWidget {
  @override
  SignedInStoreState createState() => SignedInStoreState();
}

class SignedInStoreState extends State<SignedInStore> {
  static Product water = new Product("water", 1.00);
  List<Product> productList = new List(100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Safeway",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //user input
          setState(() {
            Product newp = new Product("whatever the user inputs", 30.0);
            productList.add(newp);
          });
        },
        child: Text("add product"),
      ),
      body: Text("$productList"),
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '\n\nPlease Select What Type of User You Are',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(
                  'Shopper',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red[700],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
              ),
              FlatButton(
                child: Text(
                  'Store',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                color: Colors.red[700],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
            ]),
      ),
    );
  }
}

class Product {
  String name;
  double price;

  Product(String name, double price) {
    this.name = name;
    this.price = price;
  }
}
