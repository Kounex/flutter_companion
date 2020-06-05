import 'package:flutter/cupertino.dart';
import 'package:showcase/models/user.dart';

class HomeStore with ChangeNotifier {
  List<User> userList = [User('Rene', 'Hamburg')];

  addUser(String name, String address) {
    this.userList.add(User(name, address));
    this.notifyListeners();
  }
}
