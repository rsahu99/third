import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'common/utils.dart';
import 'data/repositories/_dao.dart';
//import 'data/api/_api.dart';
import 'data/models/_models.dart';
import 'ui/views/_views.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppController()),
        //ChangeNotifierProvider(create: (_) => SampleDao()),
      ],
      child: MaterialApp.router(
        title: 'Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerConfig: GoRouter(
          initialLocation: '/todoapp5',
          routes: [
            GoRoute(path: '/todoapp5', builder: (context, state) { return TodoApp5View(extra: state.extra); },),
          ],
        ),
      ),
    );
  }
}

class AppController with ChangeNotifier {
  static AppController? _instance;

  factory AppController() => _instance ??= AppController._internal();

  AppController._internal() {
	loadData();
  }
  
  loadData() async { await fillWithMockData(); }
  
}