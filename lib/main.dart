import 'package:flutter/material.dart';
import 'package:my_events/app.dart';
import 'package:my_events/data/services/get_it/get_it.dart';

void main() async {
  /// Widgets Flutter Binding
  WidgetsFlutterBinding.ensureInitialized();

  /// Register Get It Singletons
  GetItServices.setupSingletons();

  /// Run App
  runApp(const MyApp());
}
