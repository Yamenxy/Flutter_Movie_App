import 'package:flutter/material.dart';
import 'package:movies_app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool isPasswordHidden = true;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xff121312),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(2),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Color(0xffF6BD00)),
          ),
        ),
        backgroundColor: Color(0xff121312),
        title: Text('Register', style: TextStyle(color: Color(0xffF6BD00))),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/regestier.png',
                    width: 394,
                    height: 161,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    cursorColor: Color(0xffffffff),
                    style: TextStyle(color: Color(0xffffffff)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff282A28),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                      prefixIcon: Image.asset(
                        'assets/images/name.png',
                        width: 37,
                        height: 36,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }

                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    cursorColor: Color(0xffffffff),
                    style: TextStyle(color: Color(0xffffffff)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff282A28),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                      prefixIcon: Icon(
                        Icons.mail_rounded,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    cursorColor: Color(0xffffffff),
                    style: TextStyle(color: Color(0xffffffff)),
                    obscureText: isPasswordHidden,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff282A28),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                      prefixIcon: Icon(Icons.lock, color: Color(0xffFFFFFF)),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                        icon: Icon(
                          color: Color(0xffFFFFFF),
                          isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    cursorColor: Color(0xffffffff),
                    style: TextStyle(color: Color(0xffffffff)),
                    obscureText: isPasswordHidden,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff282A28),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                      prefixIcon: Icon(Icons.lock, color: Color(0xffFFFFFF)),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                        icon: Icon(
                          color: Color(0xffFFFFFF),
                          isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      // You can add more validation for phone number format if needed
                      return null;
                    },
                    cursorColor: Color(0xffffffff),
                    style: TextStyle(color: Color(0xffffffff)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xff282A28),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                      prefixIcon: Icon(
                        Icons.phone_rounded,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF6BD00),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // All fields are filled and valid, create account
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Account created successfully!'),
                          ),
                        );
                        // You can add navigation or further logic here
                      }
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(color: Color(0xff282A28)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have Account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xffF6BD00),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
