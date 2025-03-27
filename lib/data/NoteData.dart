import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: camel_case_types
class noteData {
  final int id;
  final String note;
  bool isFinished;

  noteData({required this.id, required this.note, this.isFinished = false});

  List<noteData> noteDatas = [];
  noteDataAdd(List<noteData> item) {
    noteDatas = item;
  }
}

class NoteDataNotifier extends StateNotifier<List<noteData>> {
  NoteDataNotifier() : super([]);

  void addnote(noteData setItem) {
    state = [...state, setItem];
    //print("===============> addnote");
  }

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
