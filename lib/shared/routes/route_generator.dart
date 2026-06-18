import 'package:expense_trackerapp/features/budget/budget_screen.dart';
import 'package:expense_trackerapp/features/dashboard/screens/dashboard_screen.dart';
import 'package:expense_trackerapp/features/dashboard/screens/widgets/add_expense_screen.dart';
import 'package:expense_trackerapp/features/history/history_screen.dart';
import 'package:expense_trackerapp/features/main/screens/main_screen.dart';
import 'package:expense_trackerapp/features/profile/screens/profile_screen.dart';
import 'package:expense_trackerapp/shared/routes/routes.dart';
import 'package:go_router/go_router.dart';

class RouteGenerator {
  static GoRouter generateRoute() {
    return GoRouter(
      initialLocation: routeDashboard,

      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return ScreenMain(child: child);
          },
          routes: [
            GoRoute(
              path: routeDashboard,
              builder: (context, state) => DashboardScreen(),
            ),
        
                GoRoute(
              path: routeHistory,
              builder: (context, state) => HistoryScreen(),
            ),
                GoRoute(
              path: routeBudget,
              builder: (context, state) => BudgetScreen(),
            ),
                GoRoute(
              path: routeProfile,
              builder: (context, state) => ProfileScreen(),
            ),
          ],
        ),
            GoRoute(
              path: routeAddExpense,
              builder: (context, state) => AddExpenseScreen(),
            ),
      ],
    );
  }
}
