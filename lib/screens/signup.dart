import 'package:flutter/material.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _mailcontroller =
      TextEditingController(text: 'abc@gmail.com');
  final TextEditingController _pwdcontroller =
      TextEditingController(text: '123');
  final FocusNode _mailFocus = FocusNode();
  final FocusNode _pwdFocus = FocusNode();
  bool _obstext=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            //height: 400,
            color: Colors.white,
            margin: const EdgeInsets.only(
                left: 40, right: 40, top: 100, bottom: 50),
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.account_circle_rounded,
                size: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              SafeArea(
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                      onFieldSubmitted: (value) {
                        _changeFocus(_mailFocus, _pwdFocus, context);
                      },
                      focusNode: _mailFocus,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      controller: _mailcontroller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Username/email',
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
                width: 500,
              ),
              SafeArea( 
                child: SizedBox(
                  width: 300,
                  child: TextFormField(
                      focusNode: _pwdFocus,
                      controller: _pwdcontroller,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          prefixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obstext=!_obstext;
                                });
                              },
                              icon: _obstext?const Icon(Icons.visibility_off):const Icon(Icons.visibility_outlined)),
                          labelText: 'Password'),
                      obscureText: _obstext),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                child: const Text('CREATE ACCOUNT'),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already existing user?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Account()),
                          );
                        },
                        child: const Text('Login'))
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
    );
  }

  _changeFocus(FocusNode current, FocusNode next, BuildContext context) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }
}
