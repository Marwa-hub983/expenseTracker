import 'package:expense_trackerapp/features/home/domain/expense_model.dart';
import 'package:expense_trackerapp/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

// void main() {
//   runApp(MultiBlocProvider(providers: [], child: const MyApp()));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseModelAdapter());
  await Hive.openBox<ExpenseModel>('expenses');
  runApp(const MyApp());
}
