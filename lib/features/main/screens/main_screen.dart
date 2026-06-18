import 'package:expense_trackerapp/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:expense_trackerapp/features/dashboard/cubit/dashboard_state.dart';
import 'package:expense_trackerapp/shared/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key, required this.child});

  final Widget child;

  final List<String> _tabs = ['/dashboard', '/history', '/budget', '/profile'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    final index = _tabs.indexWhere((path) => location.startsWith(path));

    final currentIndex = index < 0 ? 0 : index;

    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: child,

      bottomNavigationBar: BlocBuilder<DashboardCubit, DashboardState>(
        buildWhen: (previous, current) =>
            previous.isBottomSheetVisible != current.isBottomSheetVisible,

        builder: (context, state) {
          if (state.isBottomSheetVisible == true) {
            return const SizedBox.shrink();
          }

          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),

            child: Container(
              height: 78,

              decoration: BoxDecoration(
                color: const Color(0xFF1C1C2E), // dark navy background
                borderRadius: BorderRadius.circular(40),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 25,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(
                    context,
                    label: 'Dashboard',
                    icon: dashboardIcon,
                    activeIcon: dashboardSelected,
                    selected: currentIndex == 0,
                    onTap: () => context.go('/dashboard'),
                  ),

                  _navItem(
                    context,
                    label: 'History',
                    icon: historyIcon,
                    activeIcon: historyIconSelected,
                    selected: currentIndex == 1,
                    onTap: () => context.go('/history'),
                  ),
                  _navItem(
                    context,
                    label: 'Budget',
                    icon: budgetIcon,
                    activeIcon: budgetSelected,
                    selected: currentIndex == 2,
                    onTap: () => context.go('/budget'),
                  ),
                  _navItem(
                    context,
                    label: 'Profile',
                    icon: userIcon,
                    activeIcon: userIconSelected,
                    selected: currentIndex == 3,
                    onTap: () => context.go('/profile'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _navItem(
    BuildContext context, {
    required String label,
    required String icon,
    required String activeIcon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),

        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF2E2B3D) // dark pill highlight when selected
              : Colors.transparent,

          borderRadius: BorderRadius.circular(30),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Tint active icon yellow using ColorFiltered
            selected
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color(0xFFFFD233), // yellow tint
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(activeIcon, height: 24, width: 24),
                  )
                : ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF9E9EBB), // muted grey for inactive
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(icon, height: 24, width: 24),
                  ),

            const SizedBox(height: 4),

            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected
                    ? const Color(0xFFFFD233) // yellow label when active
                    : const Color(0xFF9E9EBB), // muted grey when inactive
              ),
            ),
          ],
        ),
      ),
    );
  }
}
