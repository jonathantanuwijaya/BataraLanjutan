part of 'observer.dart';

class AppBlocObserver extends BlocObserver {
  static final _log = AppLogger('AppBlocObserver');
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    _log.info(change.toString());
    _log.info('onChange -- bloc: ${bloc.runtimeType}, change: $change');
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _log.info('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
    _log.info('onClose -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate\
    _log.info('$bloc');
    _log.info('onCreate -- bloc: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    _log.info('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    _log.info('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }
}
