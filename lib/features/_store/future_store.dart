import 'package:mobx/mobx.dart';

part 'future_store.g.dart';

class FutureStore<T> = FutureBase<T> with _$FutureStore;

abstract class FutureBase<T> with Store {
  @observable
  String errorMessage;

  @observable
  ObservableFuture future;

  @observable
  T data;

  @computed
  FutureState get futureState => _computeFutureState(future);

  _computeFutureState(ObservableFuture future) {
    if (future == null || future.status == FutureStatus.rejected) {
      return FutureState.initial;
    }

    // Pending Future means "loading"
    // Fulfilled Future means "loaded"
    return future.status == FutureStatus.pending
        ? FutureState.loading
        : FutureState.loaded;
  }
}

enum FutureState { initial, loading, loaded }
