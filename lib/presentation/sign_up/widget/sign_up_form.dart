import 'package:centralized_transaction/controllers/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final c = Get.find<SignUpController>();
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 80),
        children: <Widget>[
          Text(
            'Sign Up',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: c.nickName,

            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person),
              labelText: 'Nickname',
            ),
            autocorrect: false,
            // onChanged: (value) {
            //   c.email = value ;
            // },
            validator: (_) {
              if (c.nickName.text.trim() == '')
                return "Nickname can't be empty";
            },
          ),
          SizedBox(height: 8),
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
              if (!c.validateEmail()) return "Invalid email";
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: c.citizenship,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Citizenship No',
            ),
            autocorrect: false,
            // onChanged: (value) {
            //   c.email = value ;
            // },
            validator: (_) {
              if (c.citizenship.text.trim() == '')
                return "Citizenship number can't be empty";
            },
          ),
          SizedBox(height: 8),
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
              if (!c.validatePassword())
                return "Password must be at least 8 characters";
            },
          ),
          SizedBox(height: 8),
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
                c.signUp(context);
              }
            },
            child: const Text(
              'SIGN UP',
            ),
          ),
          SizedBox(height: 8),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already registered?'),
                SizedBox(width: 8),
                InkWell(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed('/signin');
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
