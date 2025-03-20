// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_firsts/data/store.dart';
import 'package:flutter_firsts/objItems/SetElevatedButton.dart';
import 'package:flutter_firsts/objItems/Star.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UberEatsScore extends ConsumerStatefulWidget {
  const UberEatsScore({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UberEatsScore> {
  int currentRating = 3;
  Color textFormFieldFillColor = Colors.white;
  BorderSide borderSide =
      BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid);
  @override
  Widget build(BuildContext context) {
    //print('==========> ConsumerState storeListen');
    // 監聽
    final storeListen = ref.watch(storeProvider);
    return GestureDetector(
      // 使空白處可以點擊
      behavior: HitTestBehavior.translucent,
      // 點擊後失去當前的Focus(request一個空的Focus給它)
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 100,
            title: Column(
              children: [
                Row(
                  children: [
                    // 左邊圖示
                    Icon(Icons.close),
                    // 中間標題
                    Spacer(),
                    Text(
                      'Rate your order',
                      style: TextStyle(fontSize: 22),
                    ),
                    Spacer(),
                    // 右邊圖示
                    SetElevatedButton(
                      setWidth: 13,
                      setHeight: 11,
                      setRadius: 20,
                      setBtnText: 'Share',
                      setIcon: Icon(Icons.share, color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Rate this store",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    /* 商店敘述 */
                    Text(
                      "How did you like Mr.Wish鮮果茶玩家 淡水老街店?",
                      style: TextStyle(fontSize: 18),
                      maxLines: 2,
                    ),
                    /* 星星 */
                    Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(children: [
                          for (int i = 1; i <= 5; i++)
                            Star(
                              filled: i <= currentRating,
                              onPressed: () => {
                                setState(() {
                                  currentRating = i;
                                })
                              },
                            ),
                        ])),
                    /*輸入框顯示*/
                    if (currentRating >= 5)
                      Focus(
                          child: TextFormField(
                            autofocus: true,
                            decoration: InputDecoration(
                              labelText: '' /*文字浮水印*/,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: borderSide),
                              filled: true,
                              fillColor: textFormFieldFillColor,
                            ),
                            minLines: 3,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: TextStyle(fontSize: 18),
                          ),
                          onFocusChange: (hasFocus) {
                            setState(() {
                              textFormFieldFillColor = hasFocus
                                  ? Colors.white
                                  : const Color.fromARGB(221, 163, 165, 165);
                              borderSide = hasFocus
                                  ? BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                      style: BorderStyle.solid)
                                  : BorderSide.none;
                            });
                          }),
                    /*標題 Rate items*/
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Text(
                            "Rate items",
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            storeListen.when(
                data: (stroeDatas) {
                  final filteredStores = stroeDatas.toList();
                  //print('============> itemCount: ${filteredStores.length}');
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true, //just set this property
                        itemCount: filteredStores.length,
                        itemBuilder: (context, index) {
                          //print('============> index: $index');
                          final storeItem = filteredStores[index];
                          final isNotLike = ref
                              .watch(likeOrNotProvider)
                              .contains("down_${storeItem.id}");
                          //print('============> imgName: ${storeItem.imgName}');
                          return ListTile(
                            minVerticalPadding: 10,
                            /* 圖片 */ // Hero => 動畫
                            leading: null,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              10) // Adjust the radius as needed
                                          ),
                                      child: Image.asset(
                                        'assets/images/${storeItem.imgName}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                        constraints:
                                            BoxConstraints(maxWidth: 190),
                                        child: Text(
                                          storeItem.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        )),
                                    Spacer(),
                                    /* 讚 */
                                    SetNormalElevatedButton(
                                      btnName: ("down_${storeItem.id}"),
                                      btnReverseName: ("up_${storeItem.id}"),
                                      setIconDataChecked: Icons.thumb_down,
                                      setIconDataUnChecked:
                                          Icons.thumb_down_off_alt,
                                      storedata: storeItem,
                                    ),
                                    /* 倒讚 */
                                    SetNormalElevatedButton(
                                      btnName: ("up_${storeItem.id}"),
                                      btnReverseName: ("down_${storeItem.id}"),
                                      setIconDataChecked: Icons.thumb_up,
                                      setIconDataUnChecked:
                                          Icons.thumb_up_off_alt,
                                      storedata: storeItem,
                                    )
                                  ],
                                ),
                                if (isNotLike)
                                  Wrap(
                                    children: [
                                      SetTextElevatedButton(
                                        btnName:
                                            ("UnlikeBtn_1_${storeItem.id}"),
                                        setText: "Soggy or leaky",
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SetTextElevatedButton(
                                        btnName:
                                            ("UnlikeBtn_2_${storeItem.id}"),
                                        setText: "Messy presentation",
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SetTextElevatedButton(
                                        btnName:
                                            ("UnlikeBtn_3_${storeItem.id}"),
                                        setText: "Cold or melted",
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SetTextElevatedButton(
                                        btnName:
                                            ("UnlikeBtn_4_${storeItem.id}"),
                                        setText: "Small portion",
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      SetTextElevatedButton(
                                        btnName:
                                            ("UnlikeBtn_5_${storeItem.id}"),
                                        setText: "Not so tasty",
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                            onTap: () {},
                          );
                        }),
                  );
                },
                error: (error, stack) => Center(child: Text('Error: $error')),
                loading: () => const Center(child: CircularProgressIndicator()))
          ],
        ),
        /* 固定在底部按鈕 */
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  // 設定圓角矩形邊框圓角半徑
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
