import 'package:bloc/bloc.dart';
import 'package:expense_trackerapp/features/dashboard/cubit/dashboard_state.dart';
import 'package:expense_trackerapp/features/dashboard/domain/repositories/dashboard_repositories.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepositories _dashboardRepositories;

  DashboardCubit(this._dashboardRepositories) : super(InitialDashboardState());
}
