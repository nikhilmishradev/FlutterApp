import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginStateless extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: LoginStateful(),
    );
  }
}

class LoginStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginStateful> {
  final GlobalKey<ScaffoldState> _skey = new GlobalKey<ScaffoldState>();

  void showSnackbar() {
    _skey.currentState.showSnackBar(
        new SnackBar(content: new Text('This is Flutter Login Page')));
  }

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  SimpleDialog _simpleDialog;
  bool visibilitySignup = false;
  bool visibilityLogin = true;

  Widget build(BuildContext context) {
    TextStyle textStyle =
        TextStyle(fontFamily: 'Montserrat', color: Colors.black87);

    final emailField = new TextField(
      style: textStyle,
      decoration: InputDecoration(
        hintText: 'Enter Email Address',
        labelText: 'Email Address',
        icon: Icon(Icons.account_circle),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyan, width: 2.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      controller: usernameController,
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [new LengthLimitingTextInputFormatter(10)],
      textInputAction: TextInputAction.done,
    );

    final passwordField = new TextField(
      style: textStyle,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        labelText: 'Password',
        icon: Icon(Icons.security),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyan, width: 2.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      obscureText: true,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
    );

    final forgetPassword = new Container(
      margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: Align(
          alignment: Alignment.centerRight,
          // FractionalOffset(1.0, 0),
          child: new FlatButton(onPressed: () {}, child: new Text('Forget Password?'),splashColor: Colors.transparent, textColor: Colors.blue,)
          ),
    );

    final nameField = TextField(
      style: textStyle,
      decoration: InputDecoration(
        hintText: 'Enter Name',
        labelText: 'Name',
        icon: Icon(Icons.account_circle),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyan, width: 2.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
    );

    final emailAddressField = TextField(
      style: textStyle,
      decoration: InputDecoration(
        hintText: 'Enter Email Address',
        labelText: 'Email Address',
        icon: Icon(Icons.email),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyan, width: 2.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
    );

    final signupPasswordField = TextField(
      style: textStyle,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        labelText: 'Password',
        icon: Icon(Icons.security),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyan, width: 2.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: true,
    );

    final confirmPasswordField = TextField(
      style: textStyle,
      decoration: InputDecoration(
        hintText: 'Enter Password Again',
        labelText: 'Confirmation',
        icon: Icon(Icons.security),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.cyan, width: 2.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: true,
    );

    final loginBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );

    final signupBtn = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Signup",
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );

    final signupSwitchBtn = Material(
      borderRadius: BorderRadius.circular(30),
      color: !visibilitySignup ? Colors.transparent : Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2.4,
        onPressed: () {
          _changed(true, 'SIGNUP');
        },
        child: Text('Signup',
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: !visibilitySignup ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600)),
      ),
    );

    final loginSwitchBtn = Material(
      borderRadius: BorderRadius.circular(30),
      color: !visibilityLogin ? Colors.transparent : Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 2.4,
        onPressed: () {
          _changed(true, 'LOGIN');
        },
        child: Text('Login',
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
                color: !visibilityLogin ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600)),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: new Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: new Column(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
                padding: EdgeInsets.all(5),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Material(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.redAccent,
                      child: new Container(
                        padding: EdgeInsets.all(5),
                        child: new Row(
                          children: <Widget>[
                            signupSwitchBtn,
                            loginSwitchBtn,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Container(
                margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: visibilityLogin
                    ? new Column(
                        children: <Widget>[
                          emailField,
                          SizedBox(
                            height: 20,
                          ),
                          passwordField,
                          forgetPassword,
                          new Container(
                            margin: EdgeInsets.fromLTRB(50, 60, 50, 0),
                            padding: EdgeInsets.all(5),
                            child: loginBtn,
                          ),
                        ],
                      )
                    : new Container(),
              ),
              visibilitySignup
                  ? Column(
                      children: <Widget>[
                        nameField,
                        SizedBox(
                          height: 20,
                        ),
                        emailAddressField,
                        SizedBox(
                          height: 20,
                        ),
                        signupPasswordField,
                        SizedBox(
                          height: 20,
                        ),
                        confirmPasswordField,
                        new Container(
                          margin: EdgeInsets.fromLTRB(50, 40, 50, 20),
                          padding: EdgeInsets.all(5),
                          child: signupBtn,
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  bool loginValidation() {
    bool valid = false;
    String userName = usernameController.text;
    String password = passwordController.text;
    if (userName.isEmpty && password.isEmpty) {
      userName.length == 10 ? valid = true : valid = false;
    }
    return valid;
  }

  void dialog() {
    String validOutput = loginValidation()
        ? usernameController.text
        : 'Wrong User name or Password.';
    _simpleDialog = new SimpleDialog(
      title: new Text('Login Form Validation'),
      children: <Widget>[
        new SimpleDialogOption(
          child: new Text(validOutput + usernameController.text),
          onPressed: () {
            print('Yes');
          },
        ),
//        new SimpleDialogOption(
//          child: new Text('No'),
//          onPressed: () {
//            print('No');
//          },
//        ),
      ],
    );
    showDialog(context: context, child: _simpleDialog);
  }

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == 'SIGNUP') {
        visibilitySignup = visibility;
      } else {
        visibilitySignup = false;
      }
      if (field == 'LOGIN') {
        visibilityLogin = visibility;
      } else {
        visibilityLogin = false;
      }
    });
  }
}
