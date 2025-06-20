import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_trainer/global.dart';

class ActionPage extends StatefulWidget {
  const ActionPage({super.key});

  @override
  State<ActionPage> createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  List<String> categoryList = [
    "全部",
    "胸",
    "背",
    "腿",
    "肩",
    "斜方肌",
    "二头",
    "三头",
    "小腿",
    "前臂",
    "臀",
    "核心",
    "有氧",
    "全身",
    "颈",
    "其他",
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }

  Widget _leftSide() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                color:
                activeIndex == index
                    ? Color(0xFFFEFFFF)
                    : Color(0xFFF1F2F3),
                child: Text(
                  categoryList[index],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontWeight:
                    activeIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.h,
              left: 0,
              child: Offstage(
                offstage: activeIndex != index,
                child: Container(height: 20.h, width: 3.w, color: Colors.blue),
              ),
            ),
          ],
        );
      },
      itemCount: categoryList.length,
    );
  }

  Widget _rightSide() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(),
          child: Row(
            children: [
              Image.asset(
                  "assets/action/image/CIDrIJGwUMFAm.png",
                width: 80.w,
                height: 80.h,
              )
            ],
          ),
        );
      },
      itemCount: Global.actionInfoList?.length ?? 0,
    );
  }
}
