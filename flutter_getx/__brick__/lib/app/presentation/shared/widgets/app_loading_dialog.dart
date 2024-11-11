// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../../../generated/assets.dart';
//
//
// class LoadingDialogWidget extends StatefulWidget {
//   final String message;
//
//   const LoadingDialogWidget({Key? key, this.message = 'Please Wait...'})
//       : super(key: key);
//
//   @override
//   _LoadingDialogWidgetState createState() => _LoadingDialogWidgetState();
// }
//
// class _LoadingDialogWidgetState extends State<LoadingDialogWidget>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 100),
//     );
//     _animationController.forward();
//   }
//
//   @override
//   void dispose() {
//     //_animationController.reverse();
//     // Future.delayed(const Duration(milliseconds: 300), () {
//       _animationController.dispose();
//     //});
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // Background dim
//         Positioned.fill(
//           child: Container(
//             color: Colors.black.withOpacity(0.5),
//           ),
//         ),
//         // Loading dialog with animated transition
//         Center(
//           child: ScaleTransition(
//             scale: Tween<double>(begin: 0.7, end: 1.0).animate(
//               CurvedAnimation(
//                 parent: _animationController,
//                 curve: Curves.easeInOut,
//               ),
//             ),
//             child: _loadingContainer(),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _loadingContainer() {
//     return Center(
//       child: Container(
//         padding: padAll(),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Lottie.asset(
//           Assets.assetsAppLoading,
//           width: screenWidth(percentage: 50),
//           height: screenWidth(percentage: 50),
//           repeat: true,
//         ),
//       ),
//     );
//   }
// }
