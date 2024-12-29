import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
//import 'package:collection/collection.dart';
import 'dart:math';

import '../../app.dart';
import '../../common/constants.dart';
import '../../common/utils.dart';
import '../../data/repositories/_dao.dart';
import '../../data/models/_models.dart';
import '../components/_components.dart';

class TodoApp5View extends StatefulWidget {
  final int _index;
  
  TodoApp5View({super.key, Object? extra}) : _index = (extra ?? 0) as int;

  @override
  State<TodoApp5View> createState() => _TodoApp5ViewState();
}

class _TodoApp5ViewState extends State<TodoApp5View> {
  late TodoApp5Controller _view;

  @override
  void initState() {
    super.initState();
   _view = TodoApp5Controller();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _view,
      child: Consumer<TodoApp5Controller>(
        builder: (context, view, child) => Scaffold(
      backgroundColor: Color(0xffffffff),
      body: ListViewbuilder_1((index) => view._validate()),
    ),
      ),
    );
  }
}

class TodoApp5Controller with ChangeNotifier {
  void _validate() { print('_validate'); notifyListeners(); }
}