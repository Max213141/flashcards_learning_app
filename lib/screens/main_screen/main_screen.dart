import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const double overlap = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.yellow),
          child: CustomPaint(
            painter: MyPainter(),
            child: Container(
              height: 300,
              width: 400,
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 20,
                top: 20,
              ),
              child: Align(
                alignment: AlignmentGeometry.topCenter,
                child: Text(
                  "Some content",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: SizedBox(
//             height: MediaQuery.sizeOf(context).height * .7,
//             child: CustomScrollView(
//               slivers: [
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate((context, index) {
//                     return Transform.translate(
//                       offset: Offset(0, -index * overlap),
//                       child: Transform.scale(
//                         scale:
//                             1 -
//                             (index == 0 ? 1 : index) *
//                                 (index == 0
//                                     ? 0.06
//                                     : index < 3
//                                     ? 0.04
//                                     : 0.02),
//                         child: Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 16),
//                           child: SizedBox(
//                             height: 175,
//                             width: MediaQuery.sizeOf(context).width - 48,
//                             child: DecoratedBox(
//                               decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 boxShadow: [
//                                   BoxShadow(
//                                     blurRadius: 12,
//                                     color: Colors.black.withOpacity(0.08),
//                                   ),
//                                 ],
//                                 border: Border.all(
//                                   width: 5,
//                                   color: Colors.blue,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   }, childCount: 7),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
