import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_card/blocs/auth_bloc/auth_bloc.dart';
import 'package:white_card/ui/login/login_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static const List<Widget?> _widgetOptions = [];
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("White Card"),
      ),
      body: _selectedIndex == 1
          ? BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is UnAuthenticated) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Email: \n ${user?.email}'),
                    user?.photoURL != null
                        ? Image.network("${user?.photoURL}")
                        : Container(),
                    user?.displayName != null
                        ? Text('${user?.displayName}')
                        : Container(),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(SignOutRequested());
                      },
                      child: const Text('Sign Out'),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                            color:  Color(0xff3282B8),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: const Center(
                          child: Text(
                            'Admission',
                            style: TextStyle(fontSize: 25),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          color:  Color(0xff3282B8),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Center(
                        child: Text(
                          'Scholarship',
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          color:  Color(0xff3282B8),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: const Center(
                        child: Text(
                          'Anti Ragging',
                          style: TextStyle(fontSize: 25),
                        ),
                      )),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
