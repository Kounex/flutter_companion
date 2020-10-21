// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$textAtom = Atom(name: 'HomeStoreBase.text');

  @override
  String get text {
    _$textAtom.context.enforceReadPolicy(_$textAtom);
    _$textAtom.reportObserved();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.context.conditionallyRunInAction(() {
      super.text = value;
      _$textAtom.reportChanged();
    }, _$textAtom, name: '${_$textAtom.name}_set');
  }

  final _$userListAtom = Atom(name: 'HomeStoreBase.userList');

  @override
  ObservableList<User> get userList {
    _$userListAtom.context.enforceReadPolicy(_$userListAtom);
    _$userListAtom.reportObserved();
    return super.userList;
  }

  @override
  set userList(ObservableList<User> value) {
    _$userListAtom.context.conditionallyRunInAction(() {
      super.userList = value;
      _$userListAtom.reportChanged();
    }, _$userListAtom, name: '${_$userListAtom.name}_set');
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void updateText(String text) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction();
    try {
      return super.updateText(text);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addUser(User user) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction();
    try {
      return super.addUser(user);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'text: ${text.toString()},userList: ${userList.toString()}';
    return '{$string}';
  }
}
