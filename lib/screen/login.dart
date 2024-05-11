import 'package:flutter/material.dart';
import 'package:stok_barang/config/asset.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset('../asset/images/login.png'),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Login Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width *
                0.7, // Set the width as per your requirement
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
            ),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                border:
                    InputBorder.none, // Remove the border around the TextField
                hintText: 'Email Or Username',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width *
                0.7, // Set the width as per your requirement
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                width: 1.0,
                color: Colors.black,
              ),
            ),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.black,
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              obscureText:
                  true, // Set this to true to obscure the text (display as dots)
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
                border:
                    InputBorder.none, // Remove the border around the TextField
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green, // Set the background color to green
              border: Border.all(
                width: 1.0,
                color: Colors.green,
              ),
            ),
            width: MediaQuery.of(context).size.width *
                0.5, // Set the width as per your requirement
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors
                        .white, // Set the text color to white for better visibility
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
