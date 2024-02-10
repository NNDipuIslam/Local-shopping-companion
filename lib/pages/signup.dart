import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prac2/controller/sign_up_controller.dart';

final controller = Get.put(SignUpController());

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('lib/images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Name(context),
                          SizedBox(
                            height: 30,
                          ),
                          Email(context),
                          SizedBox(
                            height: 30,
                          ),
                          Password(context),
                          SizedBox(
                            height: 40,
                          ),
                          SignUp(context),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget Name(BuildContext context) {
  return TextField(
    controller: controller.fullName,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Name",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}

Widget Email(BuildContext context) {
  return TextField(
    controller: controller.email,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}

Widget Password(BuildContext context) {
  return TextField(
    controller: controller.password,
    style: TextStyle(color: Colors.white),
    obscureText: true,
    decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )),
  );
}

Widget SignUp(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Sign Up',
        style: TextStyle(
            color: Colors.white, fontSize: 27, fontWeight: FontWeight.w700),
      ),
      CircleAvatar(
        radius: 30,
        backgroundColor: Color(0xff4c505b),
        child: IconButton(
            color: Colors.white,
            onPressed: () {
              SignUpController.instance.registerUser(
                  controller.email.text.trim(), controller.password.text);
              Navigator.pushNamed(context, 'login');
            },
            icon: Icon(
              Icons.arrow_forward,
            )),
      )
    ],
  );
}
