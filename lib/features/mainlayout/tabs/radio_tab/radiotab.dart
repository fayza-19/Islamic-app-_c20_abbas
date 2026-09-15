import 'package:flutter/material.dart';

class Radiotab extends StatelessWidget {
  const Radiotab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
    );
  }
}
// import 'dart:math' as math;
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// // -----------------------------------------------------------------
// // Data model: one Dhikr phrase + its target count (always 33 here)
// // -----------------------------------------------------------------
// class DhikrItem {
//   final String text;
//   final int target;
//
//   const DhikrItem({required this.text, required this.target});
// }
//
// // The 3 Azkar phrases that rotate one after another.
// const List<DhikrItem> dhikrList = [
//   DhikrItem(text: 'سبحان الله', target: 33),
//   DhikrItem(text: 'الحمد لله', target: 33),
//   DhikrItem(text: 'الله أكبر', target: 33),
// ];
//
// // -----------------------------------------------------------------
// // SebhaScreen: swipeable pages (PageView), each page = one Dhikr
// // -----------------------------------------------------------------
// class SebhaScreen extends StatefulWidget {
//   const SebhaScreen({super.key});
//
//   @override
//   State<SebhaScreen> createState() => _SebhaScreenState();
// }
//
// class _SebhaScreenState extends State<SebhaScreen> {
//   // Controls which page (Dhikr) is currently shown and lets us
//   // move to the next page automatically after a full Sebha round.
//   late PageController _pageController;
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController(initialPage: 0);
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   // Called by a page when its counter completes a full round (33).
//   // Moves to the next Dhikr page, wrapping back to the first one.
//   void _goToNextDhikr() {
//     int nextIndex = _currentPage + 1;
//     if (nextIndex >= dhikrList.length) {
//       nextIndex = 0;
//     }
//     _pageController.animateToPage(
//       nextIndex,
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeInOut,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF121620),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text('السبحة'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: dhikrList.length,
//               onPageChanged: (int index) {
//                 setState(() {
//                   _currentPage = index;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 return DhikrPage(
//                   item: dhikrList[index],
//                   onRoundComplete: _goToNextDhikr,
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Dots indicating which Dhikr page we're on.
//           SmoothPageIndicator(
//             controller: _pageController,
//             count: dhikrList.length,
//             effect: const WormEffect(
//               dotColor: Colors.white24,
//               activeDotColor: Colors.amber,
//               dotHeight: 8,
//               dotWidth: 8,
//             ),
//           ),
//           const SizedBox(height: 24),
//         ],
//       ),
//     );
//   }
// }
//
// // -----------------------------------------------------------------
// // DhikrPage: one full-screen page containing the counter + Sebha
// // -----------------------------------------------------------------
// class DhikrPage extends StatefulWidget {
//   final DhikrItem item;
//   final VoidCallback onRoundComplete;
//
//   const DhikrPage({
//     super.key,
//     required this.item,
//     required this.onRoundComplete,
//   });
//
//   @override
//   State<DhikrPage> createState() => _DhikrPageState();
// }
//
// class _DhikrPageState extends State<DhikrPage> {
//   int _count = 0;
//
//   // Handles a single tap on the Sebha:
//   // - increments the counter
//   // - resets to 0 and notifies the parent once target is reached
//   void _onTap() {
//     setState(() {
//       _count = _count + 1;
//       if (_count >= widget.item.target) {
//         _count = 0;
//         widget.onRoundComplete();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           widget.item.text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 12),
//         Text(
//           '$_count',
//           style: const TextStyle(
//             color: Colors.amber,
//             fontSize: 40,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 40),
//         GestureDetector(
//           onTap: _onTap,
//           child: RotatingSebha(rotationTicks: _count),
//         ),
//       ],
//     );
//   }
// }
//
// // -----------------------------------------------------------------
// // RotatingSebha: draws a fixed header + a body that rotates a bit
// // with every tap. rotationTicks comes from the counter, so every
// // increment nudges the circle forward while the header stays put.
// // -----------------------------------------------------------------
// class RotatingSebha extends StatelessWidget {
//   final int rotationTicks;
//
//   const RotatingSebha({super.key, required this.rotationTicks});
//
//   @override
//   Widget build(BuildContext context) {
//     // Each tick rotates the body by 1/33rd of a full turn (one bead).
//     final double turns = rotationTicks / 33;
//
//     return SizedBox(
//       width: 260,
//       height: 260,
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           // Rotating body: the animated circle of beads.
//           AnimatedRotation(
//             turns: turns,
//             duration: const Duration(milliseconds: 200),
//             child: CustomPaint(
//               size: const Size(240, 240),
//               painter: BeadsCirclePainter(),
//             ),
//           ),
//           // Fixed header: stays on top, never rotates.
//           Positioned(
//             top: 0,
//             child: Container(
//               width: 24,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.amber,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // -----------------------------------------------------------------
// // BeadsCirclePainter: draws the beads themselves around a circle.
// // Uses an indexed for-loop (no forEach/map) to place each bead.
// // -----------------------------------------------------------------
// class BeadsCirclePainter extends CustomPainter {
//   static const int beadCount = 33;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final double radius = size.width / 2;
//     final Offset center = Offset(size.width / 2, size.height / 2);
//     final Paint beadPaint = Paint()..color = const Color(0xFFD9A441);
//     final double beadRadius = 10;
//
//     // Indexed for-loop placing each bead around the circle.
//     for (int i = 0; i < beadCount; i = i + 1) {
//       final double angle = (2 * math.pi / beadCount) * i;
//       final double dx = center.dx + radius * 0.85 * math.cos(angle);
//       final double dy = center.dy + radius * 0.85 * math.sin(angle);
//       canvas.drawCircle(Offset(dx, dy), beadRadius, beadPaint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant BeadsCirclePainter oldDelegate) => false;
// }