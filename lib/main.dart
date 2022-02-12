import 'package:batara_pokedex/app.dart';
import 'package:batara_pokedex/core/observer/observer.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
        () {
    },
    blocObserver: AppBlocObserver(),
  );
  runApp(MyApp());
}


