import 'package:bloc/bloc.dart';
import 'package:picbox/src/blocs/navbar/navbar_event.dart';
import 'package:picbox/src/blocs/navbar/navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  @override
  NavbarState get initialState => Normal();

  @override
  void onTransition(Transition<NavbarEvent, NavbarState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  Stream<NavbarState> mapEventToState(NavbarEvent event) async* {
    if (event is Show) {
      yield Showed(target: event.target);
    } else if (event is Reset) {
      yield Normal();
    }
  }
}
