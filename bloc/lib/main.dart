// import 'package:bloc_learning/pages/counter_page.dart';
// import 'package:bloc_learning/pages/login_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'auth/bloc/auth_bloc.dart';
// import 'auth/bloc/auth_state.dart';
// import 'counter/bloc/bloc_counter.dart';
// import 'features/home/pages/home_screen.dart';
// import 'features/random_user/presentation/pages/user_screen.dart';
//
// void main() {
//   runApp(
//     const MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: UserScreen()
//
//     );
//   }
// }
import 'package:bloc_app/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/home/pages/home_screen.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) =>HomeBloc(),
        child: HomeScreen(),
      ),
    );
  }
}
