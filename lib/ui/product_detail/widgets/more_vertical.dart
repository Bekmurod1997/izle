// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class MoreVertical extends StatelessWidget {
//   final int productId;
//   MoreVertical({required this.productId});
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       icon: GestureDetector(
//         child: Icon(
//           Icons.more_vert_outlined,
//           color: Colors.black,
//           size: 30,
//         ),
//       ),
//       itemBuilder: (context) => [
//         PopupMenuItem(
//           value: 1,
//           child: GestureDetector(
//               onTap: () {
//                 Share.share('https://izle.uz/ads/view?id=${productId}',
//                     subject: 'Look what I made!');
//               },
//               child: Text('Поделиться')),
//         ),
//         PopupMenuItem(
//           value: 2,
//           child: Text('Добавить заметку'),
//         ),
//         PopupMenuItem(
//           value: 3,
//           child: Text("Пожаловаться"),
//         ),
//         PopupMenuItem(
//           value: 2,
//           child: Center(
//             child: Text(
//               "ID: ${productId}",
//               style: TextStyle(
//                 fontSize: 12,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
