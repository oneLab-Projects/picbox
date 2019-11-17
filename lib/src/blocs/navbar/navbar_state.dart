import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:picbox/src/blocs/navbar/navbar_target.dart';

abstract class NavbarState extends Equatable {
  const NavbarState();

  @override
  List<Object> get props => [];
}

class Showed extends NavbarState {
  const Showed({@required this.target});

  final NavbarTarget target;

  @override
  String toString() => "Showed { target: $target }";
}

class Normal extends NavbarState {}
