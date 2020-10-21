<<<<<<< HEAD
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:showcase/models/user.dart';

part 'home.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  String text = 'Hallo';
  @observable
  ObservableList<User> userList = ObservableList<User>();

  @action
  void updateText(String text) => this.text = text;

  @action
  void addUser(User user) => this.userList.add(user);
=======
import 'package:flutter/cupertino.dart';
import 'package:showcase/models/user.dart';

class HomeStore with ChangeNotifier {
  List<User> userList = [User('Rene', 'Hamburg')];

  addUser(String name, String address) {
    this.userList.add(User(name, address));
    this.notifyListeners();
  }
>>>>>>> 1277207f8b66e5b49e3b46892650f323c63ec75f
}
