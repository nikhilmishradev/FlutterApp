import 'package:flutter/material.dart';
import 'package:first_app/PageRedirection.dart';
import 'package:first_app/InputWidgets.dart';
import 'LoginPage.dart';
import 'package:first_app/LoginStack.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button this many times :',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                  accountName: new Text('NIKHIL ANILKUMAR MISHRA'),
                  accountEmail: new Text('Chandragupt557@gmail.com'),
                  currentAccountPicture: new CircleAvatar(
                    backgroundColor: Colors.black26,
                    child: new Text('N'),
                    backgroundImage: AssetImage('image/nikhil_profile.png'),
                  ),
//                decoration: new BoxDecoration(color: Colors.blue),
              ),
              new ListTile(
                title: new Text('Login'),
                trailing: new Icon(Icons.account_circle),
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LoginStateless())),
              ),
              new ListTile(
                title: new Text('Login Stack'),
                trailing: new Icon(Icons.account_circle),
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new LoginStack())),
              ),
              new ListTile(
                title: new Text('Profile'),
                trailing: new Icon(Icons.arrow_forward),
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PageRedirect('Profile'))),
              ),
              new ListTile(
                title: new Text('Account'),
                trailing: new Icon(Icons.arrow_forward),
                onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new PageRedirect('Account'))),
              ),
              new ListTile(
                title: new Text('Logout'),
                trailing: new Icon(Icons.account_circle),
                onLongPress: (){Navigator.pop(context);},
              ),
              new ListTile(
                title: new Text('Close'),
                trailing: Icon(Icons.close),
                onTap: (){Navigator.pop(context);},
              )
            ],
          ),
        )
    );
  }
}
