import 'package:centralized_transaction/controllers/sign_in/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SignInController>();
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 80),
        children: <Widget>[
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: c.email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Email',
            ),
            autocorrect: false,
            // onChanged: (value) {
            //   c.email = value ;
            // },
            validator: (_) {
              if (!c.validateEmail()) return "Invalid Email";
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: c.password,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock),
              labelText: 'Password',
            ),
            autocorrect: false,
            // onChanged: (value) {
            //   c.password = value as RxString;
            // },
            validator: (_) {
              if (!c.validatePassword()) return "Invalid password";
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15),
              primary: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                c.signIn(context);
              }
            },
            child: const Text('SIGN IN'),
          ),
          SizedBox(height: 8),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Not registered yet ?'),
                SizedBox(width: 8),
                InkWell(
                  child: Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed("/signup");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
