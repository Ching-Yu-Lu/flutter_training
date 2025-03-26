import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_firsts/data/NoteData.dart';
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

class NoteScreen extends ConsumerStatefulWidget {
  const NoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => NoteScreenState();
}

class NoteScreenState extends ConsumerState<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    // 監聽
    final noteList = ref.watch(noteDataProvider);
    return Scaffold(
        appBar: AppBar(toolbarHeight: 50, title: BuildSwitch()),
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 15, top: 25),
          child: Column(
            children: [
              NoteAddObject(
                noteList: noteList,
              ),
              NoteListView(noteList: noteList),
            ],
          ),
        ));
  }
}

///**************************************************************
///*                        建立CheckBox                        *
///**************************************************************
class BuildSwitch extends StatefulWidget {
  const BuildSwitch({super.key});

  @override
  BuildSwitchState createState() => BuildSwitchState();
}

class BuildSwitchState extends State<BuildSwitch> {
  bool setSwitchStatus = true;

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
                value: setSwitchStatus,
                onChanged: (v) {
                  setState(() {
                    setSwitchStatus = !setSwitchStatus;
                    //print("BuildSwitchState Change Stataus is: $setSwitchStatus");
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
  final List<noteData> noteList;
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
                        noteData addnote = noteData(
                            id: (maxid + 1), note: textFieldStr, status: "");
                        ref.read(noteDataProvider.notifier).addnote(addnote);

                        print("========> nListCount: $nListCount");
                        print("========> maxid: $maxid");
                        setState(() {
                          print("========> Text: $textFieldStr");
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
  final List<noteData> noteList;
  const NoteListView({super.key, required this.noteList});

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
          ...widget.noteList.map((e) {
            /*print(
                "========> id: ${e.id.toString()}, Note: ${e.note}, Status: ${e.status}");*/
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: e.isFinished,
                      onChanged: ((cbx) {
                        setState(() {
                          print(e.id.toString());
                          e.isFinished = !e.isFinished;
                          ref
                              .read(noteDataProvider.notifier)
                              .changeStatus(e.id);
                        });
                      })),
                  Expanded(
                      child: Text(
                          "id: ${e.id.toString()}, Note: ${e.note}, Status: ${e.status}")),
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete))
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
