import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class noteData {
  final int id;
  final String note;
  final String status;
  bool isFinished;

  noteData(
      {required this.id,
      required this.note,
      required this.status,
      this.isFinished = false});

  List<noteData> noteDatas = [];
  noteDataAdd(List<noteData> item) {
    noteDatas = item;
  }

/*
  // fromJson
  factory noteData.fromJson(Map<String, dynamic> json) {
    return noteData(
        id: json["id"], name: json['name']['zh'], imgName: json["ImgName"]);
  }

  // fromJsonList
  static List<noteData> fromJsonList(List<dynamic> list) {
    return list.map((e) => noteData.fromJson(e)).toList();
  }*/
}

// 非同步資料提供
/*final storeProvider = FutureProvider<List<noteData>>((ref) async {
  try {
    //print('==========> storeProvider');
    final data = await rootBundle.loadString('assets/json/store.json');
    final json = jsonDecode(data) as List;
    return noteData.fromJsonList(json);
  } catch (e) {
    throw Exception('Failed to load data: $e');
  }
});*/

class NoteDataNotifier extends StateNotifier<List<noteData>> {
  NoteDataNotifier() : super([]);

  void addnote(noteData setItem) {
    state = [...state, setItem];
    print("===============> addnote");
  }

  void changeStatus(int id) {
    var newList = [...state];
    for (int i = 0; i < newList.length; i++) {
      if (newList[i].id == id) {
        newList[i].isFinished = !newList[i].isFinished;
        print(
            "===============> changeStatus, change...${!newList[i].isFinished}.................");
      }
      print(
          "===============> changeStatus, id: $id <===> ${newList[i].id}, Finished: ${newList[i].isFinished}");
    }
    state = newList;
  }

  void removenote(noteData setItem) {
    var newList = state.where((x) => x.id != setItem.id);
    state = newList.toList();
  }
}

final noteDataProvider =
    StateNotifierProvider<NoteDataNotifier, List<noteData>>((ref) {
  return NoteDataNotifier();
});
