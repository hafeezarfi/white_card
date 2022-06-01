import 'dart:developer';
import 'dart:math' as mt;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:white_card/blocs/auth_bloc/auth_bloc.dart';
import 'package:white_card/ui/file_upload/file_upload_page.dart';
import 'package:white_card/ui/login/login_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return BlocListener<AuthBloc, AuthState>(
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
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Theme.of(context).appBarTheme.backgroundColor!,
                Colors.blue
              ],
            )),
          ),
          title: const Text("White Card"),
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(SignOutRequested());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      user?.photoURL != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                "${user?.photoURL}",
                                width: 200,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                            )
                          : Container(
                              height: 300,
                            ),
                      const SizedBox(
                        height: 25,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      user?.displayName != null
                          ? Text(
                              '${user?.displayName}',
                              style: const TextStyle(
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${user?.email}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          log('file upload!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const FileUploadPage("Admission"),
                            ),
                          );
                        },
                        child: Container(
                          height: 200,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff3282B8),
                                  Color(0xff22c78d),
                                  Colors.white
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              color: Color(0xff3282B8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: const Center(
                            child: Text(
                              'Admission',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          log('file upload!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const FileUploadPage("Scholarship"),
                            ),
                          );
                        },
                        child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff3282B8),
                                    Colors.white,
                                    Color(0xff22c78d)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                color: Color(0xff3282B8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Center(
                              child: Text(
                                'Scholarship',
                                style: TextStyle(fontSize: 25),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          log('file upload!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const FileUploadPage("Anti Ragging"),
                            ),
                          );
                        },
                        child: Container(
                            height: 200,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff22c78d),
                                    Color(0xff3282B8),
                                    Colors.white
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                color: Color(0xff3282B8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Center(
                              child: Text(
                                'Anti Ragging',
                                style: TextStyle(fontSize: 25),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).appBarTheme.backgroundColor!,
                Colors.red
              ],
              // stops: const [0.2,1.0],
              // begin: Alignment.topLeft,
              // end: Alignment.bottomRight
            ),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
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
        ),
      ),
    );
  }
}
