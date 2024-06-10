// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shoghl/constants/colors.dart';
// import 'package:shoghl/constants/media_query.dart';
// import 'package:shoghl/constants/spacing.dart';
// import 'package:shoghl/core/utils/styles.dart';
//
// class Tagrob extends StatelessWidget {
//   const Tagrob({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.forward,
//                 size: 37,
//               ),
//             )
//           ],
//           title: IconButton(
//             onPressed: () {},
//             icon:
//                 const Icon(CupertinoIcons.delete, color: Colors.red, size: 37),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SafeArea(
//             child: Column(
//               children: [
//                 20.sh,
//                 Text(
//                   'عبد الفتاح المكسيكي',
//                   style: Styles.textStyle37
//                       .copyWith(color: DarkMode.kPrimaryColor),
//                 ),
//                 20.sh,
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   margin: const EdgeInsets.all(10),
//                   width: getScreenWidth(context),
//                   height: getScreenHeight(context) * 0.48,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border: Border.all(
//                           color: Colors.white.withOpacity(0.2), width: 1.5)),
//                   child: const Column(
//                     children: [
//                       CalenderHead(),
//                       DaysGridView(),
//                     ],
//                   ),
//                 ),
//                 (getScreenHeight(context) * 0.04).sh,
//                 const InfoRow(),
//                 (getScreenHeight(context) * 0.04).sh,
//                 const TotalsWidget(
//                     totalAllDay: 124, totalHalfDay: 224, totalAbsent: 100),
//               ],
//             ),
//           ),
//         ),
//     );
//   }
// }
//
// class TotalsWidget extends StatelessWidget {
//   const TotalsWidget({
//     super.key,
//     required this.totalAllDay,
//     required this.totalHalfDay,
//     required this.totalAbsent,
//   });
//
//   final int totalAllDay;
//   final int totalHalfDay;
//   final int totalAbsent;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             '$totalAllDay',
//             style: Styles.textStyle37
//                 .copyWith(fontSize: 70, color: DarkMode.kPrimaryColor),
//           ),
//           Text(
//             '$totalAbsent',
//             style: Styles.textStyle37
//                 .copyWith(fontSize: 70, color: DarkMode.kPrimaryColor),
//           ),
//           Text(
//             '$totalHalfDay',
//             style: Styles.textStyle37
//                 .copyWith(fontSize: 70, color: DarkMode.kPrimaryColor),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class InfoRow extends StatelessWidget {
//   const InfoRow({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 15.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               const CircleAvatar(
//                 backgroundColor: DarkMode.kPrimaryColor,
//                 radius: 10,
//               ),
//               10.sw,
//               Text(
//                 'حضور',
//                 style:
//                     Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               Container(
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.transparent,
//                     border: Border.all(color: DarkMode.kPrimaryColor)),
//               ),
//               10.sw,
//               Text(
//                 'غياب',
//                 style:
//                     Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
//               )
//             ],
//           ),
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: DarkMode.kPrimaryColor.withOpacity(0.3),
//                 radius: 10,
//               ),
//               10.sw,
//               Text(
//                 'نصف يوم',
//                 style:
//                     Styles.textStyle24.copyWith(color: DarkMode.kPrimaryColor),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class DaysGridView extends StatelessWidget {
//   const DaysGridView({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Directionality(
//         textDirection: TextDirection.ltr,
//         child: GridView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           itemCount: 31,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             childAspectRatio: 1,
//             crossAxisCount: 6,
//           ),
//           itemBuilder: (context, index) {
//             return DayCircle(
//               index: index,
//               state: 'غياب',
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class CalenderHead extends StatelessWidget {
//   const CalenderHead({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.back,
//                 size: 40,
//               ),
//               color: DarkMode.kPrimaryColor,
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 CupertinoIcons.forward,
//                 size: 40,
//               ),
//               color: DarkMode.kPrimaryColor,
//             ),
//           ],
//         ),
//         Text.rich(
//           TextSpan(
//             children: [
//               TextSpan(
//                 text: 'June ',
//                 style:
//                     Styles.textStyle37.copyWith(color: DarkMode.kPrimaryColor),
//               ),
//               TextSpan(
//                 text: '2024',
//                 style:
//                     Styles.textStyle20.copyWith(color: DarkMode.kPrimaryColor),
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class DayCircle extends StatelessWidget {
//   const DayCircle({
//     super.key,
//     required this.index,
//     required this.state,
//   });
//
//   final int index;
//   final String state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       margin: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: state == 'غياب'
//             ? Colors.transparent
//             : state == 'حضور'
//                 ? DarkMode.kPrimaryColor
//                 : DarkMode.kPrimaryColor.withOpacity(0.3),
//         shape: BoxShape.circle,
//         border: state == 'نصف يوم'
//             ? const Border()
//             : Border.all(color: DarkMode.kPrimaryColor, width: 1.8),
//       ),
//       child: Text(
//         '${index + 1}',
//         style: Styles.textStyle24.copyWith(
//             color: state == 'غياب' || state == 'نصف يوم'
//                 ? DarkMode.kPrimaryColor
//                 : DarkMode.kBgColor),
//       ),
//     );
//   }
// }
