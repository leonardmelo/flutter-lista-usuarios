import 'package:flutter/material.dart';
import 'package:listausuarioscrud/components/user_tile.dart';
import 'package:listausuarioscrud/provider/users.dart';
import 'package:listausuarioscrud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Usuários"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(user: users.byIndex(i)),
      ),
    );
  }
}
