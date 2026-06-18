// import 'package:expense_trackerapp/shared/constants/assets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class MainBottomNavigationBar extends StatelessWidget {
//   final ValueNotifier<int> currentIndexNotifier;

//   const MainBottomNavigationBar({
//     super.key,
//     required this.currentIndexNotifier,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).cardColor,
//       currentIndex: currentIndexNotifier.value,
//       onTap: (index) {
//         currentIndexNotifier.value = index;
//       },

//       selectedItemColor: const Color(0xff8A1538),
//       unselectedItemColor: const Color(0xff8A1538).withOpacity(0.5),

//       type: BottomNavigationBarType.fixed,

//       /// ✅ FIXED FONT (no ScreenUtil)
//       selectedFontSize: 11,
//       unselectedFontSize: 11,

//       selectedLabelStyle: const TextStyle(
//         fontWeight: FontWeight.w400,
//         fontSize: 11,
//       ),
//       unselectedLabelStyle: const TextStyle(
//         fontWeight: FontWeight.w400,
//         fontSize: 11,
//       ),

//       items: [
//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             dashboardIcon,
//             height: 18,
//           ),
//           activeIcon: SvgPicture.asset(
//             dashboardSelected,
           
//             height: 18,
//           ),
//           label: 'Dashboard',
//         ),

//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             historyIcon,
//             height: 18,
//           ),
//           activeIcon: SvgPicture.asset(
//           historyIconSelected,
           
//             height: 18,
//           ),
//           label: 'History',
//         ),

//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             budgetIcon,
//             height: 18,
//           ),
//           activeIcon: SvgPicture.asset(
//           budgetSelected,
           
//             height: 18,
//           ),
//           label: 'Budget',
//         ),

//         BottomNavigationBarItem(
//           icon: SvgPicture.asset(
//             userIcon,
//             height: 18,
//           ),
//           activeIcon: SvgPicture.asset(
//           userIconSelected,
           
//             height: 18,
//           ),
//           label: 'User',
//         ),
//       ],
//     );
//   }
// }