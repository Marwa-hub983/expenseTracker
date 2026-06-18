import 'package:expense_trackerapp/features/home/screens/dashboard_screen.dart';
import 'package:expense_trackerapp/features/home/screens/widgets/add_expense_screen.dart';
import 'package:expense_trackerapp/shared/routes/routes.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static GoRouter generateRoute() {
    return GoRouter(
      initialLocation: routeDashboard,
      routes: [
        GoRoute(
          path: routeDashboard,
          builder: (context, state) => DashboardScreen(),
        ),
        GoRoute(path: routeAddExpense,builder: (context,state)=>AddExpenseScreen())
      ],
    );
  }
}
