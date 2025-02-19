import 'package:flutter/material.dart';
import 'package:flutter_firsts/main.dart';

class TaiwanTime extends StatelessWidget {
  final DateTime time;
  final bool showFuzzy;
  final TextStyle style;
  //final Color setColors;
  //final int setFontSize;
  const TaiwanTime(
      {super.key,
      required this.time,
      //this.setColors = Colors.black,
      //this.setFontSize = 20,
      required this.style,
      this.showFuzzy = false});

  @override
  Widget build(BuildContext context) {
    DateTime localDateTime = time;
    var differenceTime = localDateTime.difference(DateTime.now());
    var strFuzzy = "";
    if (showFuzzy) {
      var inSecondsValue = differenceTime.inSeconds;
      //print(differenceTime);
      //print(inSecondsValue);
      switch (inSecondsValue.abs()) {
        // < 5 分鐘
        case < 300:
          if (inSecondsValue <= 0) {
            strFuzzy = "(剛剛)";
          } else {
            strFuzzy = "(即將發生)";
          }
          break;
        // < 1 小時
        case < 3600:
          if (inSecondsValue <= 0) {
            strFuzzy = "(${differenceTime.inMinutes.abs()}分鐘前)";
          } else {
            strFuzzy = "(${differenceTime.inMinutes}分鐘後)";
          }
          break;
        // < 24 小時
        case <= 86400:
          if (inSecondsValue <= 0) {
            strFuzzy = "(${differenceTime.inHours.abs()}小時以前)";
          } else {
            strFuzzy = "(${differenceTime.inHours}小時以後)";
          }
          break;
        // < 1 週
        case <= 604800:
          if (inSecondsValue <= 0) {
            strFuzzy = "(${differenceTime.inDays.abs()}天前)";
          } else {
            strFuzzy = "(${differenceTime.inDays}天後)";
          }
          break;
      }
    }

    var hoursType = localDateTime.hour < 12 ? "上午" : "下午";
    var hoursValue =
        localDateTime.hour < 12 ? localDateTime.hour : localDateTime.hour - 12;
    var showHours = hoursType + hoursValue.toString();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '民國${localDateTime.year - 1911}年${localDateTime.month}月${localDateTime.day}日 ${showHours}點${localDateTime.minute}分 ${strFuzzy.toString()}',
          style: style,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
        )
      ],
    );
  }
}

class TaiwanTime2 extends StatefulWidget {
  final DateTime inputDateTime;
  final bool showFuzzy;
  final Color setColors;
  final int setFontSize;
  const TaiwanTime2(
      {super.key,
      required this.inputDateTime,
      this.setColors = Colors.black,
      this.setFontSize = 20,
      this.showFuzzy = false});

  @override
  _TaiwanTime2State createState() => _TaiwanTime2State();
}

class _TaiwanTime2State extends State<TaiwanTime2> {
  DateTime localDateTime = DateTime.now();
  bool localFuzzy = false;
  Color localColor = Colors.black;
  int localFontSize = 20;

  @override
  void initState() {
    super.initState();
    localDateTime = widget.inputDateTime;
    localFuzzy = widget.showFuzzy;
    localColor = widget.setColors;
    localFontSize = widget.setFontSize;
  }

  @override
  Widget build(BuildContext context) {
    var differenceTime = localDateTime.difference(DateTime.now());
    var strFuzzy = "";
    if (localFuzzy) {
      var inSecondsValue = differenceTime.inSeconds;
      switch (inSecondsValue.abs()) {
        // < 5 分鐘
        case < 300:
          if (inSecondsValue <= 0) {
            strFuzzy = "(剛剛)";
          } else {
            strFuzzy = "(即將發生)";
          }
          break;
        // < 1 小時
        case < 3600:
          if (inSecondsValue <= 0) {
            strFuzzy = "(${differenceTime.inMinutes.abs()}分鐘前)";
          } else {
            strFuzzy = "(${differenceTime.inMinutes}分鐘後)";
          }
          break;
        // < 24 小時
        case <= 86400:
          if (inSecondsValue <= 0) {
            strFuzzy = "(${differenceTime.inHours.abs()}小時以前)";
          } else {
            strFuzzy = "(${differenceTime.inHours}小時以後)";
          }
          break;
        // < 1 週
        case <= 604800:
          if (inSecondsValue <= 0) {
            strFuzzy = "(${differenceTime.inDays.abs()}天前)";
          } else {
            strFuzzy = "(${differenceTime.inDays}天後)";
          }
          break;
      }
    }

    var hoursType = localDateTime.hour < 12 ? "上午" : "下午";
    var hoursValue =
        localDateTime.hour < 12 ? localDateTime.hour : localDateTime.hour - 12;
    var showHours = hoursType + hoursValue.toString();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '民國${localDateTime.year - 1911}年${localDateTime.month}月${localDateTime.day}日 ${showHours}點${localDateTime.minute}分 ${strFuzzy.toString()}',
          style: TextStyle(
            fontSize: localFontSize.toDouble(),
            fontWeight: FontWeight.bold,
            color: localColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
        )
      ],
    );
  }
}
