import 'package:mobx/mobx.dart';
import 'package:mobxasync/features/_repo/user_repo.dart';
import 'package:mobxasync/features/_store/future_store.dart';

part 'users_store.g.dart';

class UsersStore = UsersBase with _$UsersStore;

abstract class UsersBase with Store {
  final UserRepo _userRepo;

  UsersBase(this._userRepo);

  @observable
  FutureStore listUsersFuture = FutureStore();

  @action
  Future listUsers({String search, num page = 1, num limit = 50}) async {
    try {
      listUsersFuture.errorMessage = null;

      listUsersFuture.future = ObservableFuture(
          _userRepo.list(search: search, limit: limit, page: page));

      listUsersFuture.data = await listUsersFuture.future;
    } catch (e) {
      listUsersFuture.errorMessage = e.toString();
    }
  }
}
