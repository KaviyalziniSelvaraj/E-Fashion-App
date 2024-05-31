import 'package:flutter/material.dart';
import 'package:myfashionapp/screens/signup.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingController _mailcontroller = TextEditingController();
  final TextEditingController _pwdcontroller = TextEditingController();
  final FocusNode _mailFocus = FocusNode();
  final FocusNode _pwdFocus = FocusNode();

  var _obscuretext = true;
  var _ico = const Icon(Icons.visibility_off);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          margin:
              const EdgeInsets.only(left: 40, right: 40, top: 100, bottom: 50),
          color: Colors.white,

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
                    controller: _mailcontroller,
                    focusNode: _mailFocus,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(minWidth: 5.0),
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
                              _obscuretext = !_obscuretext;
                            });
                          },
                          icon: _obscuretext?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_rounded)),
                      labelText: 'Password'),
                  obscureText: _obscuretext,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: Container(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'forget password?',
                      textAlign: TextAlign.end,
                    )),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              child: const Text('SUBMIT'),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Create new account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: const Text('Sign up'))
                ],
              ),
            ),
          ]),
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
