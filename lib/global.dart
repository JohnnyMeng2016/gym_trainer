import 'package:gym_trainer/model/action_info.dart';

class Global {
  static List<ActionInfo>? actionInfoList;

  static const int ACTION_BODY_TYPE_ALL = -1;
  static const int ACTION_BODY_TYPE_CORE = 0;
  static const int ACTION_BODY_TYPE_ARM = 1;
  static const int ACTION_BODY_TYPE_BACK = 2;
  static const int ACTION_BODY_TYPE_CHEST = 3;
  static const int ACTION_BODY_TYPE_LEG = 4;
  static const int ACTION_BODY_TYPE_SHOULDER = 5;
  static const int ACTION_BODY_TYPE_BODY = 6;
  static const int ACTION_BODY_TYPE_CARDIO = 7;
  static const int ACTION_BODY_TYPE_NECK = 8;
  static const int ACTION_BODY_TYPE_BUTT = 9;
  static const int ACTION_BODY_TYPE_OTHER = 10;
}
