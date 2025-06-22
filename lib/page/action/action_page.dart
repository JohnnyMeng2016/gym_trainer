import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_trainer/page/action/action_view_model.dart';
import 'package:provider/provider.dart';

import '../../widget/search_bar_delegate.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({super.key});

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  ScrollController controller = ScrollController();

  ActionVM actionVM = ActionVM();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ActionVM>(
      create: (context) {
        return actionVM;
      },
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 40.h,
              margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color(0xFFf8f8f8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '输入动作名搜索',
                  hintStyle: TextStyle(fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Color(0xFF444444)),
                  border: InputBorder.none,
                ),
                onTap:(){
                  showSearch(context: context, delegate: SearchBarDelegate());
                }
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: Row(
                children: [
                  SizedBox(width: 80.w, child: _leftSide()),
                  Expanded(child: _rightSide()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leftSide() {
    return Consumer<ActionVM>(
      builder: (context, vm, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    vm.changeCategory(index);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.h,
                    color:
                        vm.categoryList[index].isSelect
                            ? Color(0xFFFEFFFF)
                            : Color(0xFFF1F2F3),
                    child: Text(
                      vm.categoryList[index].label,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight:
                            vm.categoryList[index].isSelect
                                ? FontWeight.bold
                                : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 15.h,
                  left: 0,
                  child: Offstage(
                    offstage: !vm.categoryList[index].isSelect,
                    child: Container(
                      height: 22.h,
                      width: 4.w,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            );
          },
          itemCount: vm.categoryList.length,
        );
      },
    );
  }

  Widget _rightSide() {
    return Consumer<ActionVM>(
      builder: (context, vm, child) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          controller: controller,
          itemCount: vm.subActionList.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Image.asset(
                    "assets/action/image/${vm.subActionList[index].iconName}.png",
                    width: 45.w,
                    height: 50.h,
                    fit: BoxFit.contain,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5.w, 0, 5.w, 0),
                      child: Text(
                        vm.subActionList[index].name ?? "",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
