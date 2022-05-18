import 'package:flutter/material.dart';
import 'package:listausuarioscrud/provider/users.dart';
import 'package:listausuarioscrud/routes/app_routes.dart';
import 'package:listausuarioscrud/views/user_form.dart';
import 'package:listausuarioscrud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Users(),
      child: MaterialApp(
        title: 'Lista de usuários',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: UserList(), como a home é / ele localiza automaticamente em routes
        routes: {
          AppRoutes.HOME: (_) => const UserList(),
          AppRoutes.USER_FORM: (context) => const UserForm(),
        },
      ),
    );
  }
}
