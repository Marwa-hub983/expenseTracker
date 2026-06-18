import 'package:expense_trackerapp/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:expense_trackerapp/features/dashboard/domain/expense_model.dart';
import 'package:expense_trackerapp/my_app.dart';
import 'package:expense_trackerapp/shared/dependency_injection/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

// void main() {
//   runApp(MultiBlocProvider(providers: [], child: const MyApp()));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseModelAdapter());
  await Hive.openBox<ExpenseModel>('expenses');
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<DashboardCubit>())],
      child: const MyApp(),
    ),
  );
}
