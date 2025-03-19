// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_firsts/data/store.dart';

/* 右上 Share 用 */
class SetElevatedButton extends StatefulWidget {
  final double setWidth;
  final double setHeight;
  final double setRadius;
  final Color setBtnBackColor;
  final String setBtnText;
  final Icon setIcon;
  final double spaceLeft;
  final double spaceRight;
  final double spaceTop;
  final double spaceBottom;
  const SetElevatedButton(
      {super.key,
      this.setWidth = 0,
      this.setHeight = 0,
      this.setRadius = 0,
      this.setBtnBackColor = const Color.fromARGB(215, 230, 229, 229),
      this.setBtnText = '',
      this.spaceLeft = 0,
      this.spaceRight = 0,
      this.spaceTop = 0,
      this.spaceBottom = 0,
      required this.setIcon});

  @override
  SetElevatedButtonState createState() => SetElevatedButtonState();
}

class SetElevatedButtonState extends State<SetElevatedButton> {
  @override
  Widget build(BuildContext context) {
    //String setBtnText = widget.setBtnText;
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Container(
        padding: EdgeInsets.only(
            left: widget.spaceLeft,
            top: widget.spaceTop,
            right: widget.spaceRight,
            bottom: widget.spaceBottom), // 內邊距，讓 Icon 不會太擠
        decoration: BoxDecoration(
          shape: BoxShape.circle, // 圓形背景
          color: Colors.grey[300], // 灰色底
        ),
        child: widget.setIcon, // 內部 ICON
      ),
      label: Text(widget.setBtnText, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200], // 背景顏色
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.setRadius), // 圓角
        ),
        elevation: 0, // 無陰影
        padding: EdgeInsets.symmetric(
            horizontal: widget.setWidth, vertical: widget.setHeight),
      ),
    );
  }
}

/* 【讚】跟【倒讚】使用 */
class SetNormalElevatedButton extends ConsumerStatefulWidget {
  final IconData setIconDataChecked;
  final IconData setIconDataUnChecked;
  final double spaceNum;
  final stroeData storedata;
  final String btnName;
  final String btnReverseName;
  const SetNormalElevatedButton(
      {super.key,
      this.spaceNum = 0,
      required this.btnName,
      required this.btnReverseName,
      required this.setIconDataChecked,
      required this.setIconDataUnChecked,
      required this.storedata});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      SetNormalElevatedButtonState();
}

class SetNormalElevatedButtonState
    extends ConsumerState<SetNormalElevatedButton> {
  @override
  Widget build(BuildContext context) {
    final isLikeOrNot = ref.watch(likeOrNotProvider).contains(widget.btnName);
    final islikeornotReversebtn =
        ref.watch(likeOrNotProvider).contains(widget.btnReverseName);
    return ElevatedButton(
      onPressed: () {
        setState(() {});
      },
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(), // 圓形按鈕
        backgroundColor: isLikeOrNot ? Colors.black : Colors.grey[300], // 灰色背景
        elevation: 0, // 無陰影
        padding: EdgeInsets.all(widget.spaceNum), // 內邊距，讓 Icon 不會太擠
      ),
      child: IconButton(
          onPressed: () {
            ref.read(likeOrNotProvider.notifier).toggle(widget.btnName);
            if (islikeornotReversebtn)
              ref
                  .read(likeOrNotProvider.notifier)
                  .toggle(widget.btnReverseName);
          },
          icon: isLikeOrNot
              ? Icon(widget.setIconDataChecked, color: Colors.white)
              : Icon(widget.setIconDataUnChecked,
                  color: Colors.black, size: 22)),
    );
  }
}

class SetTextElevatedButton extends ConsumerStatefulWidget {
  final String setText;

  const SetTextElevatedButton({super.key, required this.setText});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      SetTextElevatedButtonState();
}

class SetTextElevatedButtonState extends ConsumerState<SetTextElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 40,
        child: Column(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                  //shape: CircleBorder(), // 圓形按鈕
                  backgroundColor: Colors.grey[300], // 灰色背景
                  elevation: 0, // 無陰影
                  padding: EdgeInsets.only(left: 20, right: 20), // 內邊距
                ),
                child: Text(widget.setText,
                    style: TextStyle(color: Colors.black, fontSize: 17)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
