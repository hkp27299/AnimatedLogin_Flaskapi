import 'package:flutter/material.dart';
import 'FadeAnimation.dart';
import 'package:toast/toast.dart';
import 'api.dart';

class SignUp extends StatefulWidget {
  static const routename = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController;

  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    nameController = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var result;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 400,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Positioned(
                      left: width * 0.07,
                      child: FadeAnimation(
                          1.0, Image.asset("assets/images/light-1.png"))),
                  Positioned(
                      left: width * 0.30,
                      child: FadeAnimation(
                          1.2, Image.asset("assets/images/light-2.png"))),
                  Positioned(
                      right: width * 0.05,
                      top: height * 0.1,
                      child: FadeAnimation(
                          1.5, Image.asset("assets/images/clock.png"))),
                  Positioned(
                    top: height / 4,
                    left: width * 0.4,
                    child: FadeAnimation(
                      1.7,
                      Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FadeAnimation(
              1.9,
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10))
                    ]),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Name"),
                      controller: nameController,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Email"),
                      controller: emailInputController,
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: "Password"),
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: pwdInputController,
                    ),
                  ],
                ),
              ),
            ),
            FadeAnimation(
              2.0,
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: InkWell(
                  onTap: () async {
                    result = await signup(nameController.text,
                        emailInputController.text, pwdInputController.text);
                    Toast.show(
                      result,
                      context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                    );

                    setState(() {
                      nameController.text = "";
                      pwdInputController.text = "";
                      emailInputController.text = "";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ])),
                    child: Center(
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FadeAnimation(
              2.1,
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Color.fromRGBO(143, 148, 251, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
