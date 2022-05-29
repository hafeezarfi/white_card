import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_card/blocs/auth_bloc/auth_bloc.dart';
import 'package:white_card/ui/dashboard/dashboard.dart';
import 'package:white_card/ui/login/register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.amber),
        ),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              ),
            );
          }
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return Form(
                key: _formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          hintText: "Email",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
                              ? 'Enter a valid email'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min 6 characters"
                              : null;
                        },
                        decoration: const InputDecoration(
                          label: Text('Password'),
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          log(_emailController.text);
                          log(_passwordController.text);
                          _authenticateWithEmailAndPassword(context);
                        },
                        child: const Text('Login'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterPage();
                              },
                            ),
                          );
                        },
                        child: const Text("Don't have account? Register"),
                      ),
                      const SizedBox(height: 10,),
                      const Text('Or'),
                      const SizedBox(height: 10,),
                      IconButton(
                        onPressed: () {
                          _authenticateWithGoogle(context);
                        },
                        icon: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }
}
