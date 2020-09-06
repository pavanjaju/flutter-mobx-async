import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobxasync/features/_model/user.dart';
import 'package:mobxasync/features/_store/future_store.dart';
import 'package:mobxasync/features/users/store/users_store.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final debouncer = Debouncer<String>(Duration(milliseconds: 500));

  UsersStore _usersStore;

  @override
  void didChangeDependencies() {
    _usersStore ??= Provider.of<UsersStore>(context);

    fetchUsers();

    debouncer.values.listen((search) => fetchUsers(search: search));

    super.didChangeDependencies();
  }

  fetchUsers({String search}) {
    _usersStore.listUsers(search: search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: Column(
          children: [
            TextField(
              onChanged: (value) => debouncer.value = value,
              decoration: InputDecoration(
                  hintText: "Start typing here...",
                  contentPadding: const EdgeInsets.all(8)),
            ),
            Expanded(
              child: Observer(
                builder: (context) {
                  if (_usersStore.listUsersFuture.futureState ==
                      FutureState.loading)
                    return Center(child: CircularProgressIndicator());

                  if (_usersStore.listUsersFuture.errorMessage != null)
                    return Center(
                        child: Text(_usersStore.listUsersFuture.errorMessage));

                  if ((_usersStore.listUsersFuture?.data?.length ?? 0) == 0)
                    return Center(child: Text("No users found."));

                  return ListView.builder(
                    itemCount: _usersStore.listUsersFuture?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      User user = _usersStore.listUsersFuture.data[index];
                      return ListTile(
                        leading: CircleAvatar(
                          child: ClipOval(child: Image.network(user.avatar)),
                        ),
                        title: Text(user.name),
                        subtitle: Text(user.email),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
