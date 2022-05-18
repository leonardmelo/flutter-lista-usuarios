import 'package:flutter/material.dart';
import 'package:listausuarioscrud/models/user.dart';
import 'package:listausuarioscrud/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../provider/users.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              icon: const Icon(Icons.edit),
              color: Colors.orange[200],
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Excluir usuário"),
                    content: const Text("Tem certeza?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('Não')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(true); // parametro para retorno no dialog
                          },
                          child: const Text(
                            'Sim',
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  ),
                ).then((confirmed) => confirmed
                    ? Provider.of<Users>(context, listen: false).remove(user)
                    : null);
              },
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
