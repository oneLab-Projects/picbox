import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocDelegate {
  List<BlocProvider> blocProviders;

  AppBlocDelegate(BuildContext context) {
    blocProviders = [];
  }
}
