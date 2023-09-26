import 'package:flutter/material.dart';
import 'package:navigasi_rute/models/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text("${itemArgs.name} with ${itemArgs.price} \n ${itemArgs.detail}"),
          ],
        ),
      ),
    );
  }
}

//Text("${itemArgs.name} with ${itemArgs.price}"),