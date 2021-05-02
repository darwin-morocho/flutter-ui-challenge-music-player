import 'package:challenge/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  const ItemView({
    Key? key,
    required this.item,
    required this.onPressed,
  }) : super(key: key);

  final Item item;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: this.onPressed,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item.bg),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(item.avatar),
                    radius: 25,
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.title,
                    style: TextStyle(color: Colors.white54),
                  ),
                  Text(
                    item.subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
