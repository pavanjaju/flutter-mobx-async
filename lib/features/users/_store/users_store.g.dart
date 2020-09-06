// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersStore on UsersBase, Store {
  final _$listUsersFutureAtom = Atom(name: 'UsersBase.listUsersFuture');

  @override
  FutureStore<dynamic> get listUsersFuture {
    _$listUsersFutureAtom.reportRead();
    return super.listUsersFuture;
  }

  @override
  set listUsersFuture(FutureStore<dynamic> value) {
    _$listUsersFutureAtom.reportWrite(value, super.listUsersFuture, () {
      super.listUsersFuture = value;
    });
  }

  final _$listUsersAsyncAction = AsyncAction('UsersBase.listUsers');

  @override
  Future<dynamic> listUsers({String search, num page = 1, num limit = 50}) {
    return _$listUsersAsyncAction
        .run(() => super.listUsers(search: search, page: page, limit: limit));
  }

  @override
  String toString() {
    return '''
listUsersFuture: ${listUsersFuture}
    ''';
  }
}
