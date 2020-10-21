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
}
