import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_trainer/model/action_info.dart';

import 'global.dart';
import 'page/main_tab_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  rootBundle.loadString("assets/action/actionList.json").then((jsonString) {
    List<dynamic> json = jsonDecode(jsonString);
    Global.actionInfoList = [];
    for (var j in json) {
      ActionInfo actionInfo = ActionInfo.fromJson(j);
      if (actionInfo.iconName != null) {
        Global.actionInfoList?.add(ActionInfo.fromJson(j));
      }
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: "GYM Trainer",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MainTabPage(),
      ),
    );
  }
}
