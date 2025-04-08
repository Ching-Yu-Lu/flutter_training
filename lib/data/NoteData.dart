// ignore: file_names
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class NoteData {
  final int id;
  final String note;
  bool isFinished;
  String createTime;

  NoteData({
    required this.id,
    required this.note,
    this.isFinished = false,
    String? createTime,
  }) : createTime = createTime ??
            DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  //List<NoteData> noteDatas = [];
  //noteDataAdd(List<NoteData> item) {
  //  noteDatas = item;
  //}

  /// 取得中國年份的日期時間
  static String getRepublicOfChinaYearDateTime() {
    DateTime now = DateTime.now();
    int year = now.year - 1911;
    return '$year${DateFormat('-MM-dd HH:mm:ss').format(now)}';
  }

  /// 取得中國年份的日期時間
  String getRepublicOfChinaYearDateTimeByCreateTime() {
    String rt = '';
    if (createTime.isNotEmpty) {
      DateTime dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(createTime);
      int year = dateTime.year - 1911;
      int month = dateTime.month;
      int day = dateTime.day;
      int hour = dateTime.hour;
      rt =
          '民國:$year年$month月$day日 ${(hour > 12 ? '下午' : '早上')}${DateFormat('hh:mm').format(dateTime)}分';

      var differenceTime = dateTime.difference(DateTime.now());
      var strFuzzy = "";
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

      rt = rt + strFuzzy;
    }
    return rt;
  }

  // fromJson 就是從Map<String, dynamic>的格式轉成Todo物件

  factory NoteData.fromJson(Map<String, dynamic> json) {
    return NoteData(
      id: json['id'],
      note: json['note'],
      isFinished: json['isFinished'],
      createTime: json['createTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'note': note,
      'isFinished': isFinished,
      'createTime': createTime,
    };
  }
}

/// NoteData 資料管理
class NoteDataNotifier extends StateNotifier<List<NoteData>> {
  NoteDataNotifier() : super([]) {
    loadFromSharedPreferences();
  }

  /// 讀取資料
  void loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? dataList = prefs.getStringList('datalist');

    if (dataList == null)
      state = [];
    else {
      state = dataList.map((dataItem) {
        return NoteData.fromJson(jsonDecode(dataItem));
      }).toList();
    }
  }

  /// 加入資料
  void addnote(NoteData setItem) {
    state = [...state, setItem];
    //print("===============> addnote");
    saveToSharedPreferences();
  }

  /// 變更狀態
  void changeStatus(int id) {
    var newList = [...state];
    for (int i = 0; i < newList.length; i++) {
      if (newList[i].id == id) {
        newList[i].isFinished = !newList[i].isFinished;
        //print("===============> changeStatus, change...${!newList[i].isFinished}.................");
      }
      //print("===============> changeStatus, id: $id <===> ${newList[i].id}, Finished: ${newList[i].isFinished}");
    }
    state = newList;
    saveToSharedPreferences();
  }

  /// 移除資料
  void removenote(NoteData setItem) {
    var newList = state.where((x) => x.id != setItem.id);
    state = newList.toList();
    saveToSharedPreferences();
  }

  /// 使用 SharedPreferences 儲存簡單資料
  /// https://developer.android.com/training/data-storage/shared-preferences?hl=zh-tw
  /// https://vocus.cc/article/6580fc2cfd897800019ffdbf
  void saveToSharedPreferences() {
    SharedPreferences.getInstance().then((prefs) {
      // store the datalist as a json object to shared preferences
      List<String> datalist = state.map((dataItem) {
        //print("===============> saveToSharedPreferences, dataItem: $dataItem");
        //print("===============> saveToSharedPreferences, json: ${jsonEncode(dataItem.toJson())}");
        return jsonEncode(dataItem.toJson());
      }).toList();
      prefs.setStringList('datalist', datalist);
    });
  }
}

final noteDataProvider =
    StateNotifierProvider<NoteDataNotifier, List<NoteData>>((ref) {
  return NoteDataNotifier();
});

/* */
class IsShowAllNotifier extends StateNotifier<bool> {
  IsShowAllNotifier() : super(true);

  void toggle(bool showStatus) {
    state = !state;
    //print("===============> state, ...$state.................");
  }
}

final isShowAllProvider = StateNotifierProvider<IsShowAllNotifier, bool>((ref) {
  return IsShowAllNotifier();
});
