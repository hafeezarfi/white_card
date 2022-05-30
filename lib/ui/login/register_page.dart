import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_card/blocs/auth_bloc/auth_bloc.dart';
import 'package:white_card/ui/dashboard/dashboard.dart';
import 'package:white_card/ui/login/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
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
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _authenticateWithEmailAndPassword(context);
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: const Text('Already have account? Sign in!'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Or'),
                    const SizedBox(
                      height: 10,
                    ),

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
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(_emailController.text, _passwordController.text),
      );
    }
  }

  void _authenticateWithGoogle(context) {
    BlocProvider.of<AuthBloc>(context).add(
      GoogleSignInRequested(),
    );
  }

}
