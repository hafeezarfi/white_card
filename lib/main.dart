import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:white_card/blocs/auth_bloc/auth_bloc.dart';
import 'package:white_card/data/repositories/auth_repository.dart';
import 'package:white_card/ui/dashboard/dashboard.dart';
import 'package:white_card/ui/login/login_screen.dart';
import 'package:white_card/util/theme.dart';
import 'dart:developer';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// local instance
  FirebaseAuth.instance
      .authStateChanges()
  .listen((User? user) {
    if(user==null){
      log('User is currently signed out!');
    }else {
      log('User is signed in!');
    }
  });

  await FlutterDownloader.initialize(
    debug: true,
    ignoreSsl: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),

      child: BlocProvider(
        create: (context)=>AuthBloc(authRepository: RepositoryProvider.of<AuthRepository>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'White Card',
          theme: IDPTheme.getThemeData(context),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                return const Dashboard();
              }
              return const LoginScreen();
            },
          )
        ),
      ),
    );
  }
}


