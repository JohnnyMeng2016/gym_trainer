import 'package:flutter/foundation.dart';

import '../../global.dart';
import '../../model/action_info.dart';

class ActionVM with ChangeNotifier {
  List<CategoryBean> categoryList = [
    CategoryBean(
      label: "全部",
      value: Global.ACTION_BODY_TYPE_ALL,
      isSelect: true,
    ),
    CategoryBean(label: "核心", value: Global.ACTION_BODY_TYPE_CORE),
    CategoryBean(label: "手臂", value: Global.ACTION_BODY_TYPE_ARM),
    CategoryBean(label: "背部", value: Global.ACTION_BODY_TYPE_BACK),
    CategoryBean(label: "胸部", value: Global.ACTION_BODY_TYPE_CHEST),
    CategoryBean(label: "腿部", value: Global.ACTION_BODY_TYPE_LEG),
    CategoryBean(label: "肩膀", value: Global.ACTION_BODY_TYPE_SHOULDER),
    CategoryBean(label: "全身", value: Global.ACTION_BODY_TYPE_BODY),
    CategoryBean(label: "心肺", value: Global.ACTION_BODY_TYPE_CARDIO),
    CategoryBean(label: "颈部", value: Global.ACTION_BODY_TYPE_NECK),
    CategoryBean(label: "臀部", value: Global.ACTION_BODY_TYPE_BUTT),
    CategoryBean(label: "其他", value: Global.ACTION_BODY_TYPE_OTHER),
  ];

  List<ActionInfo> subActionList = Global.actionInfoList ?? [];
  int _selectIndex = 0;
  Map<int, List<ActionInfo>> _map = {};

  void changeCategory(int index) {
    if (_selectIndex == index) return;
    categoryList[_selectIndex].isSelect = false;
    _selectIndex = index;
    categoryList[_selectIndex].isSelect = true;
    if (categoryList[_selectIndex].value == Global.ACTION_BODY_TYPE_ALL) {
      subActionList = Global.actionInfoList ?? [];
      notifyListeners();
      return;
    }
    if (!_map.containsKey(categoryList[_selectIndex].value)) {
      List<ActionInfo> actionInfoList = [];
      Global.actionInfoList?.forEach((actionInfo) {
        if (actionInfo.bodyPartsP == categoryList[_selectIndex].value) {
          actionInfoList.add(actionInfo);
        }
      });
      _map[categoryList[_selectIndex].value] = actionInfoList;
    }
    subActionList = _map[categoryList[_selectIndex].value] ?? [];
    notifyListeners();
  }
}

class CategoryBean {
  late String label;
  late int value;
  late bool isSelect;

  CategoryBean({
    required this.label,
    required this.value,
    this.isSelect = false,
  });
}
