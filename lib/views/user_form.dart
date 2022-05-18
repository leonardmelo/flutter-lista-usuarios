import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../provider/users.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    final Map<String, String> _formData = {};
    if (ModalRoute.of(context)?.settings.arguments != null) {
      final user = ModalRoute.of(context)?.settings.arguments as User;
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de Usuário"),
        actions: [
          IconButton(
              onPressed: () {
                if (_form.currentState?.validate() == true) {
                  _form.currentState!.save();

                  if (_formData['id'] != null) {
                    Provider.of<Users>(context, listen: false).put(
                      User(
                        id: _formData['id'].toString(),
                        name: _formData['name'].toString(),
                        email: _formData['email'].toString(),
                        avatarUrl: _formData['avatarUrl'].toString(),
                      ),
                    );
                  } else {
                    Provider.of<Users>(context, listen: false).add(
                      _formData['name'].toString(),
                      _formData['email'].toString(),
                      _formData['avatarUrl'].toString(),
                    );
                  }

                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(label: Text("Nome")),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Campo deve ser preenchido";
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['name'] = value.toString()),
              TextFormField(
                  initialValue: _formData['email'],
                  decoration: const InputDecoration(label: Text("E-mail")),
                  onSaved: (value) => _formData['email'] = value.toString()),
              TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration:
                      const InputDecoration(label: Text("Url do Avatar")),
                  onSaved: (value) => value.toString().isNotEmpty
                      ? _formData['avatarUrl'] = value.toString()
                      : _formData['avatarUrl'] =
                          'https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_960_720.png'),
            ],
          ),
        ),
      ),
    );
  }
}
