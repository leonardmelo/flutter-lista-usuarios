import 'dart:math';

import 'package:flutter/material.dart';
import 'package:listausuarioscrud/data/dummy_users.dart';
import 'package:listausuarioscrud/models/user.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void add(String name, String email, String avatarUrl) {
    final String random = Random().nextDouble().toString();
    _items.addAll({
      random: User(id: random, name: name, email: email, avatarUrl: avatarUrl)
    });
    notifyListeners(); // propaga a alteração

  }

  void put(User user) {
    _items.update(
        user.id,
        (_) => User(
            id: user.id,
            name: user.name,
            email: user.email,
            avatarUrl: user.avatarUrl));

    notifyListeners(); // propaga a alteração
  }

  void remove(User user){
    _items.remove(user.id);
    notifyListeners(); // propaga a alteração
  }

}
