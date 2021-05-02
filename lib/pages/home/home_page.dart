import 'package:challenge/models/item.dart';
import 'package:challenge/pages/home/widgets/item_view.dart';
import 'package:challenge/utils/data.dart';
import 'package:flutter/material.dart';

import 'widgets/draggable_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Item> _items = fakerItems;
  late ValueNotifier<Item> _activeItem;

  @override
  void initState() {
    super.initState();
    _activeItem = ValueNotifier(_items.first);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (_, index) {
          final item = _items[index];
          return ItemView(
            item: item,
            onPressed: () => _activeItem.value = item,
          );
        },
        itemCount: _items.length,
      ),
      floatingActionButton: ValueListenableBuilder<Item>(
        valueListenable: _activeItem,
        builder: (_, activeItem, __) => DraggableView(
          size: size,
          activeItem: activeItem,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
