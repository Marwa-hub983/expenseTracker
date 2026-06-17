import 'package:expense_trackerapp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

// void main() {
//   runApp(MultiBlocProvider(providers: [], child: const MyApp()));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseA)
  runApp(const MyApp());
}
