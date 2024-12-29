import 'package:flutter/material.dart';
//import 'package:collection/collection.dart';
import 'dart:math';

import '../../app.dart';
import '../../common/constants.dart';
import '../../common/utils.dart';
import '../../data/models/_models.dart';
import '../components/_components.dart';

class ListViewbuilder_1 extends StatelessWidget {
  final Function p17;

  ListViewbuilder_1(this.p17, {super.key});

  @override
  Widget build(BuildContext context) {
    final entries = ['A', 'B', 'C'];
    final colorCodes = [600, 500, 100];
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
			onTap: () => p17.call(index),
            child: Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            ),
          );
        }
      );
  }
}