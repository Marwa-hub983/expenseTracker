import 'package:equatable/equatable.dart';

class DashboardState extends Equatable {
  final bool? isBottomSheetVisible;
  const DashboardState({this.isBottomSheetVisible});

  DashboardState copyWith({bool? isBottomSheetVisible}) {
    return DashboardState(
      isBottomSheetVisible: isBottomSheetVisible ?? this.isBottomSheetVisible,
    );
  }

  @override
  List<Object?> get props => [isBottomSheetVisible];
}
class InitialDashboardState extends DashboardState {}