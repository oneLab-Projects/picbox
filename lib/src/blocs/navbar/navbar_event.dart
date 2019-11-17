import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:picbox/src/blocs/navbar/navbar_target.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object> get props => [];
}

class Show extends NavbarEvent {
  const Show({@required this.target});

  final NavbarTarget target;

  @override
  String toString() => "Show { target: $target }";
}

class Reset extends NavbarEvent {}
