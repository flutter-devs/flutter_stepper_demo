import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

class StepperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          accentColor: Colors.red,
          primaryColor: Colors.red,
          primaryColorDark: Colors.red),
      home: StepScreen(
        title: 'Stepper App',
      ),
    );
  }
}

class StepScreen extends StatefulWidget {
  final String title;

  StepScreen({this.title});

  @override
  _StepScreenState createState() => _StepScreenState();
}


class _StepScreenState extends State<StepScreen> {

  /*login*/
  static TextEditingController email_controller = new TextEditingController();
  static TextEditingController password_controller = new TextEditingController();
  static bool loginSucess = false;


  /*Signup*/
  static final TextEditingController name_controller = new TextEditingController();
  static final TextEditingController re_password_controller =  new TextEditingController();

  static int currStep = 0;
  static var _focusNode = new FocusNode();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
      print('Has focus: $_focusNode.hasFocus');
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps = [
    new Step(
        title: const Text('SignUp'),
        isActive: true,
        state: StepState.indexed,
        content: _signupUi()),

    new Step(
        title: const Text('LogIn'),
        isActive: true,
        state: StepState.indexed,
        content: _loginUi()),

    new Step(
        title: const Text('Home'),
        isActive: true,
        state: StepState.complete,
        content: new HomeScreen("Aeologic Technologies")),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
      body: new Container(

        child: new ListView(children: <Widget>[
          new Stepper(
            steps: steps,

            type: StepperType.vertical,
            currentStep: currStep,
            onStepContinue: () {
              setState(() {

                if(currStep==0){
                  if (!(name_controller.value.text
                      .toString()
                      .trim()
                      .length >
                      0)) {
                    Fluttertoast.showToast(
                        msg: "Please enter user name.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1);
                  }
                      else if (!(password_controller.value.text
                      .toString()
                      .trim()
                      .length >
                      0)) {
                    Fluttertoast.showToast(
                        msg: "Please enter the password.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1);
                  } else if (!(re_password_controller.value.text
                      .toString()
                      .trim()
                      .length >
                      0)) {
                    Fluttertoast.showToast(
                        msg:
                        "Please enter the confirm password.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1);
                  } else {
                    if (re_password_controller.value.text
                        .toString()
                        .endsWith(password_controller.value.text
                        .toString())) {

                      if (currStep < steps.length - 1) {
                        currStep = currStep + 1;
                      } else {
                        currStep = 0;
                      }
                    } else {
                      Fluttertoast.showToast(
                          msg:
                          "Your Password and confirm password do not match.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1);
                    }
                  }

                }

                else if(currStep==1){
                  if (!(email_controller.value.text
                      .trim()
                      .toString()
                      .length >
                      1)) {
                    Fluttertoast.showToast(
                        msg: "Please enter user name.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1);
                  } else if (!(password_controller.value.text
                      .trim()
                      .toString()
                      .length >
                      1)) {
                    Fluttertoast.showToast(
                        msg: "Please enter the password.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIos: 1);
                  } else {

                    if (currStep < steps.length - 1) {
                      currStep = currStep + 1;
                    } else {
                      currStep = 0;
                    }
                  }
                }


              });
            },
            onStepCancel: () {
              setState(() {
                if (currStep > 0) {
                  currStep = currStep - 1;
                } else {
                  currStep = 0;
                }
              });
            },
            onStepTapped: (step) {
              setState(() {
                currStep = step;
              });
            },
          ),

        ],shrinkWrap: true,reverse: true,),
      ),
    );

  }

  static Widget _signupUi(){
    return new Center(
        child: new ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                    child: new Center(
                      child: new Stack(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: new Form(
                                autovalidate: false,
                                child: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new TextFormField(
                                        controller: name_controller,
                                        decoration: new InputDecoration(
                                            labelText: "Full Name*",
                                            filled: false,
                                            prefixIcon: Padding(
                                                padding: EdgeInsets.only(bottom: 10.0,top: 10.0,left: 10.0,right: 10.0),
                                                child: new Image.asset(
                                                  "assets/images/user_icon.png",
                                                  height: 20.0,
                                                  width: 20.0,
                                                  fit: BoxFit.scaleDown,
                                                ))),
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                    new Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0, top: 5.0),
                                        child: new TextFormField(
                                          obscureText: false,
                                          controller: email_controller,
                                          decoration: new InputDecoration(
                                              labelText: "Email-Id",
                                              enabled: true,
                                              filled: false,
                                              prefixIcon: Padding(
                                                  padding: EdgeInsets.only(bottom: 10.0,top: 10.0,left: 10.0,right: 10.0),
                                                  child: new Image.asset(
                                                    "assets/images/email_icon.png",
                                                    height: 20.0,
                                                    width: 20.0,
                                                    fit: BoxFit.scaleDown,
                                                  ))),
                                          keyboardType: TextInputType.text,
                                        )),
                                    new Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0, top: 5.0),
                                        child: new TextFormField(
                                          obscureText: true,
                                          controller: password_controller,
                                          decoration: new InputDecoration(
                                              labelText: "Password*",
                                              enabled: true,
                                              filled: false,
                                              prefixIcon: Padding(
                                                  padding: EdgeInsets.only(bottom: 10.0,top: 10.0,left: 10.0,right: 10.0),
                                                  child: new Image.asset(
                                                    "assets/images/password_icon.png",
                                                    height: 20.0,
                                                    width: 20.0,
                                                    fit: BoxFit.scaleDown,
                                                  ))),
                                          keyboardType: TextInputType.text,
                                        )),
                                    new Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0, top: 5.0),
                                        child: new TextFormField(
                                          obscureText: true,
                                          controller: re_password_controller,
                                          decoration: new InputDecoration(
                                              labelText: "Confirm Password*",
                                              enabled: true,
                                              filled: false,
                                              prefixIcon: Padding(
                                                  padding: EdgeInsets.only(bottom: 10.0,top: 10.0,left: 10.0,right: 10.0),
                                                  child: new Image.asset(
                                                    "assets/images/password_icon.png",
                                                    height: 20.0,
                                                    width: 20.0,
                                                    fit: BoxFit.scaleDown,
                                                  ))),
                                          keyboardType: TextInputType.text,
                                        )),

                                  ],
                                ),
                              )),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ));
  }

  static Widget  _loginUi() {
    return new Center(
        child: new ListView(
          shrinkWrap: true,
          reverse: false,
          children: <Widget>[
            new SizedBox(
              height: 20.0,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Center(
                    child: new Center(
                      child: new Stack(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: new Form(
                                autovalidate: false,
                                child: new Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Padding(
                                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                                      child: new TextFormField(
                                        controller: email_controller,
                                        autofocus: false,
                                        decoration: new InputDecoration(
                                          labelText: "User Name*",
                                          prefixIcon: Padding(
                                              padding: EdgeInsets.only(bottom: 10.0,top: 10.0,left: 10.0,right: 10.0),
                                              child: new Image.asset(
                                                "assets/images/user_icon.png",
                                                height: 20.0,
                                                width: 20.0,
                                                fit: BoxFit.scaleDown,
                                              )),
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                      ),
                                    ),
                                    new Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0, top: 5.0),
                                        child: new TextFormField(
                                          obscureText: true,
                                          autofocus: false,
                                          controller: password_controller,
                                          decoration: new InputDecoration(
                                              labelText: "Password*",
                                              prefixIcon: Padding(
                                                  padding: EdgeInsets.only(bottom: 10.0,top: 10.0,left: 10.0,right: 10.0),
                                                  child: new Image.asset(
                                                    "assets/images/email_icon.png",
                                                    height: 20.0,
                                                    width: 20.0,
                                                    fit: BoxFit.scaleDown,
                                                  ))),
                                          keyboardType: TextInputType.text,
                                        )),

                                  ],
                                ),
                              )),
                        ],
                      ),
                    ))
              ],
            )
          ],
        ));
  }

}

/*HomeScreen Code start*/
class HomeScreen extends StatelessWidget {
  HomeScreen(this.userName);

  String userName;

  @override
  Widget build(BuildContext context) {
    return
    new Stack(
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Welcome,    ",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20.0)),
                    new Row(
                      children: <Widget>[],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(userName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0))
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: new Center(
              child: new Opacity(
                  opacity: 0.5,
                  child: new Image.asset(
                    "assets/images/logo.png",
                  )),
            ),
          ),
        ],
      );
    // TODO: implement build
  }
}
