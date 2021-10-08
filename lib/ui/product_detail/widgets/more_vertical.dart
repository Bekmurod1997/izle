import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class MoreVertical extends StatelessWidget {
  const MoreVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: GestureDetector(
        child: Icon(
          Icons.more_vert_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text('Поделиться'),
        ),
        PopupMenuItem(
          value: 2,
          child: Text('Добавить заметку'),
        ),
        PopupMenuItem(
          value: 2,
          child: GestureDetector(
              onTap: () {
                Share.share('check out my website https://example.com',
                    subject: 'Look what I made!');
              },
              child: Text("Пожаловаться")),
        ),
        PopupMenuItem(
          value: 2,
          child: Center(
            child: Text(
              "ID: 12345678",
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
