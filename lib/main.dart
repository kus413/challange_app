import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yipl_app/provider/user_provider.dart';
import 'package:yipl_app/screen/user_detail_screen.dart';
import 'package:yipl_app/screen/user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: UserListScreen(),
        routes: {
          UserDetailScreen.routeId: (context) => UserDetailScreen(),
        },
      ),
    );
  }
}
