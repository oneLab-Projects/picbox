import 'package:equatable/equatable.dart';
import 'package:picbox/src/blocs/navbar/navbar_target.dart';

abstract class NavbarState extends Equatable {
  const NavbarState(this.target);

  final NavbarTarget target;

  @override
  List<Object> get props => [target];
}

class Showed extends NavbarState {
  const Showed(NavbarTarget target) : super(target);

  @override
  String toString() => "Showed { target: $target }";
}

class Normal extends NavbarState {
  const Normal() : super(null);
}
