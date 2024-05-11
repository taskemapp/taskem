// import 'dart:ui';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:go_router/go_router.dart';
// import 'package:taskem/src/core/extensions/context_extension.dart';
// import 'package:taskem/src/core/helpers/platform_check_mixin.dart';
//
// import '../widgets/profile_avatar.dart';
//
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = context.theme;
//
//     return Scaffold(
//       body: SafeArea(
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 200,
//               floating: true,
//               pinned: true,
//               snap: true,
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     if (context.canPop()) {
//                       context.pop();
//                     }
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                   ),
//                 ),
//               ],
//               forceMaterialTransparency: true,
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: false,
//                 stretchModes: const [
//                   StretchMode.blurBackground,
//                 ],
//                 title: Text(
//                   'ripls',
//                   style: theme.textTheme.headlineSmall,
//                 ),
//                 background: DecoratedBox(
//                   position: DecorationPosition.foreground,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       stops: [
//                         0,
//                         0.7,
//                       ],
//                       colors: [
//                         theme.primaryColor,
//                         theme.primaryColorDark.withOpacity(0.4),
//                       ],
//                     ),
//                   ),
//                   child: ProfileAvatar(
//                     url: 'ripls56',
//                     borderRadius: 0,
//                   ),
//                 ),
//               ),
//             ),
//
//             // SliverPersistentHeader(
//             //   delegate: ProfileAppBar(expandedHeight: 200),
//             // ),
//
//             const SliverFillRemaining(),
//             // ElevatedButton(
//             //   onPressed: () =>
//             //       context.read<ProfileAvatarCubit>().getAvatarLink('ripls56'),
//             //   child: const Text('Get Avatar'),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ProfileAppBar extends SliverPersistentHeaderDelegate with PlatformCheck {
//   ProfileAppBar({
//     required this.expandedHeight,
//   });
//
//   final double expandedHeight;
//
//   @override
//   Widget build(
//     BuildContext context,
//     double shrinkOffset,
//     bool overlapsContent,
//   ) {
//     final theme = context.theme;
//
//     var scrollPercentage = shrinkOffset / expandedHeight;
//     scrollPercentage = scrollPercentage.clamp(0, 1.0);
//     final smoothScrollPercentage = (3 * scrollPercentage * scrollPercentage) -
//         (2 * scrollPercentage * scrollPercentage * scrollPercentage);
//     print('shrinkOffset: ${scrollPercentage}');
//
//     return Container(
//       color: Colors.red,
//       child: Row(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: IconButton(
//               onPressed: () {
//                 if (context.canPop()) {
//                   context.pop();
//                 }
//               },
//               icon: Icon(
//                 isCupertino ? CupertinoIcons.back : Icons.arrow_back,
//               ),
//             ),
//           ),
//           Animate(
//             target: smoothScrollPercentage,
//             effects: const [
//               SlideEffect(
//                 begin: Offset(0.05, 0),
//                 end: Offset.zero,
//                 duration: Duration(milliseconds: 1),
//               ),
//             ],
//             child: Row(
//               children: [
//                 Animate(
//                   // target: scrollPercentage,
//                   effects: const [
//                     // ScaleEffect(
//                     //   begin: Offset(3, 3),
//                     //   end: Offset(1, 1),
//                     //   duration: Duration(milliseconds: 1),
//                     // ),
//                   ],
//                   child: DecoratedBox(
//                     position: DecorationPosition.foreground,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(360),
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.black.withOpacity(0.5),
//                           Colors.transparent,
//                         ],
//                       ),
//                     ),
//                     child: ProfileAvatar(
//                       url: 'ripls56',
//                       radius: lerpDouble(20, 60, 1 - scrollPercentage),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 SizedBox(
//                   width: 24 * (1 - scrollPercentage),
//                 ),
//                 Text(
//                   'ripls',
//                   style: theme.textTheme.headlineSmall,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => expandedHeight;
//
//   @override
//   double get minExtent => kToolbarHeight;
//
//   @override
//   bool shouldRebuild(ProfileAppBar oldDelegate) {
//     return true;
//   }
// }
