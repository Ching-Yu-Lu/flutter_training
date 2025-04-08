import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_firsts/data/noteData.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NoteScreen(),
    );
  }
}

///**************************************************************
///*                           Screen                           *
///**************************************************************
class NoteScreen extends ConsumerStatefulWidget {
  const NoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NoteScreenState();
}

class NoteScreenState extends ConsumerState<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    // 監聽
    final isShowAll = ref.watch(isShowAllProvider);
    final noteList = ref.watch(noteDataProvider);
    final unCompletedList =
        noteList.where((notes) => !notes.isFinished).toList();
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 50, title: BuildSwitch(switchStatus: isShowAll)),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 15, top: 25),
          child: Column(
            children: [
              NoteAddObject(
                noteList: noteList,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  "待完成: ${unCompletedList.length}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              NoteListView(noteList: noteList, switchStatus: isShowAll),
            ],
          ),
        ));
  }
}

///**************************************************************
///*                           AppBar                           *
///**************************************************************
class BuildSwitch extends ConsumerStatefulWidget {
  final bool switchStatus;
  const BuildSwitch({super.key, this.switchStatus = true});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => BuildSwitchState();
}

class BuildSwitchState extends ConsumerState<BuildSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          "我的代辦事項",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        Row(
          children: [
            Text(
              "顯示已完成",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Switch(
                value: widget.switchStatus,
                onChanged: (v) {
                  setState(() {
                    ref
                        .read(isShowAllProvider.notifier)
                        .toggle(!widget.switchStatus);
                    //print("BuildSwitchState Change Stataus is: ${widget.switchStatus}");
                  });
                })
          ],
        )
      ],
    );
  }
}

///**************************************************************
///*                          新增 Note                          *
///**************************************************************
class NoteAddObject extends ConsumerStatefulWidget {
  final List<NoteData> noteList;
  const NoteAddObject({super.key, required this.noteList});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NoteAddObjectState();
}

class NoteAddObjectState extends ConsumerState<NoteAddObject> {
  String textFieldStr = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: TextEditingController(text: textFieldStr),
              decoration: InputDecoration(
                  labelText: "新增代辦事項",
                  //prefixIcon:
                  suffixIcon: IconButton(
                      onPressed: () {
                        int nListCount = widget.noteList.isNotEmpty
                            ? 10
                            : widget.noteList.length;
                        // 取目前陣列最大ID
                        int maxid = nListCount == 0
                            ? 0
                            : widget.noteList.map<int>((e) => e.id).reduce(max);
                        // 建立 note 物件
                        NoteData addnote =
                            NoteData(id: (maxid + 1), note: textFieldStr);

                        if (textFieldStr.isNotEmpty)
                          ref.read(noteDataProvider.notifier).addnote(addnote);

                        //print("========> nListCount: $nListCount");
                        //print("========> maxid: $maxid");
                        setState(() {
                          //print("========> Text: $textFieldStr");
                          textFieldStr = "";
                        });
                      },
                      icon: Icon(Icons.add))),
              style: Theme.of(context).textTheme.bodyMedium,
              onChanged: (inputValue) {
                textFieldStr = inputValue;
              },
            ),
          ),
        ],
      ),
    );
  }
}

///**************************************************************
///*                      新增 Note ListView                     *
///**************************************************************
class NoteListView extends ConsumerStatefulWidget {
  final List<NoteData> noteList;
  final bool switchStatus;
  const NoteListView(
      {super.key, required this.noteList, required this.switchStatus});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NoteListViewState();
}

class NoteListViewState extends ConsumerState<NoteListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView(
        children: [
          ...widget.noteList.where((note) {
            bool isShow = true;
            if (!widget.switchStatus) isShow = !note.isFinished;
            return isShow;
          }).map((e) {
            /*print(
                "========> id: ${e.id.toString()}, Note: ${e.note}, Status: ${e.status}");*/
            return ListTile(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          value: e.isFinished,
                          onChanged: ((cbx) {
                            setState(() {
                              //print(e.id.toString());
                              ref
                                  .read(noteDataProvider.notifier)
                                  .changeStatus(e.id);
                            });
                          })),
                      Expanded(
                        child: Text(
                          e.note,
                          style: TextStyle(
                              decoration: e.isFinished
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              ref.read(noteDataProvider.notifier).removenote(e);
                            });
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        e.getRepublicOfChinaYearDateTimeByCreateTime(),
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
              onTap: () {},
            );
          })
        ],
      ),
    );
  }
}
