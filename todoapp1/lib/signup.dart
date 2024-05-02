import 'package:flutter/material.dart';
import 'package:todoapp1/const/colors.dart';

class SignUp_Screen extends StatefulWidget {
  final VoidCallback show;
  SignUp_Screen(this.show,{super.key});

  @override
  State<SignUp_Screen> createState() => _SignUp_ScreenState();
}

class _SignUp_ScreenState extends State<SignUp_Screen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirm = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      setState(() {});
    });
    _focusNode2.addListener(() {
      setState(() {});
    });
    _focusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolors,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              image(),
              const SizedBox(height: 50),
              textField(email, _focusNode1, 'Email', Icons.email),
              const SizedBox(height: 10),
              textField(password, _focusNode2, "Password", Icons.password),
              const SizedBox(height: 10),
              textField(passwordConfirm, _focusNode3, "PasswordConfirm",
                  Icons.password),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    const Text(
                      "Sign UP",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SignUP_bottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget account() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Do you have an account?",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          SizedBox(width: 5),
          Text(
            "LogIn",
            style: TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget SignUP_bottom() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: custom_green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text(
          'SignUp',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget textField(TextEditingController _controller, FocusNode _focusNode,
      String typeName, IconData iconss) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          controller: email,
          focusNode: _focusNode,
          style: const TextStyle(fontSize: 19, color: Colors.black),
          decoration: InputDecoration(
              prefixIcon: Icon(
                iconss,
                // color: _focusNode.hasFocus
                //     ? custom_green
                //     : Color(0xffc5c5c5),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              hintText: 'typeName',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffc5c5c5),
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff18DAA3),
                  width: 2.0,
                ),
              )),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/todo1.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
