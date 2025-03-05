import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  final double contentFontSize = 23;
  final double paddingLeft = 15;
  final double paddinIconButtonLeft = 10;
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Icon(Icons.arrow_back_ios),
          foregroundColor: Colors.blue,
          backgroundColor: Colors.black,
          shape: Border(bottom: BorderSide(color: Colors.grey, width: 0.3)),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 15),
                child: Row(children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.control_point)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz))
                ]))
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(left: paddingLeft, top: 8),
                child: Row(
                  children: [
                    FlutterLogo(
                      size: 20,
                      style: FlutterLogoStyle.markOnly,
                      //curve: Curves.bounceInOut,
                      //duration: Duration(seconds: 2),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "flutter",
                      style: TextStyle(
                          color: Colors.grey, fontSize: contentFontSize),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(left: paddingLeft),
                child: Row(children: [
                  Text(
                    "flutter",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(left: paddingLeft, top: 8),
                child: Wrap(children: [
                  Text(
                    "Flutter makes is easy and fast to build beautiful apps for mobile and beyond",
                    style: TextStyle(
                        color: Colors.white, fontSize: contentFontSize),
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(left: paddinIconButtonLeft, top: 20),
                child: Row(children: [
                  SizedIconButton(
                    setIcon: Icon(
                      Icons.link,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "fluter.dev",
                    style: TextStyle(
                        color: Colors.white, fontSize: contentFontSize),
                  )
                ])),
            Padding(
                padding: EdgeInsets.only(left: paddinIconButtonLeft, top: 0),
                child: Row(children: [
                  SizedIconButton(
                    setIcon: Icon(
                      Icons.star_border,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "169k",
                    style: TextStyle(
                        color: Colors.white, fontSize: contentFontSize),
                  ),
                  Text(
                    " stars",
                    style: TextStyle(
                        color: Colors.grey, fontSize: contentFontSize),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedIconButton(
                      setIcon: Icon(
                    Icons.share,
                    color: Colors.grey,
                  )),
                  Text(
                    "28.1k",
                    style: TextStyle(
                        color: Colors.white, fontSize: contentFontSize),
                  ),
                  Text(
                    " forks",
                    style: TextStyle(
                        color: Colors.grey, fontSize: contentFontSize),
                  ),
                ])),
            Padding(
              padding: EdgeInsets.only(left: paddingLeft, top: 17),
              child: Row(
                children: [
                  SetElevatedButton(
                    setWidth: 250,
                    setIcon: Icon(Icons.star_border, color: Colors.white),
                    setBackgroundColor: const Color.fromARGB(255, 53, 53, 54),
                    textStr: "Star",
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  SetElevatedButton(
                    setIcon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 15,
                    ),
                    setBackgroundColor: const Color.fromARGB(255, 53, 53, 54),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  SetElevatedButton(
                    setIcon: Icon(
                      Icons.snapchat,
                      color: Colors.white,
                      size: 17,
                    ),
                    setBackgroundColor: const Color.fromARGB(255, 53, 53, 54),
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 0, right: 0),
                child: Column(
                  children: [
                    Text(
                      "", //標題區塊
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 500, // 設定固定高度
                      child: ListView(
                        children: [
                          SetListTile(
                            imgPath: 'assets/Images/Pic1.png',
                            depiction: "Issues",
                            numberStr: "13,154",
                            setFontSize: contentFontSize,
                            showTopBorder: true,
                          ),
                          SetListTile(
                            imgPath: 'assets/Images/Pic2.webp',
                            depiction: "Pull requests",
                            numberStr: "219",
                            setFontSize: contentFontSize,
                          ),
                          SetListTile(
                            imgPath: 'assets/Images/Pic3.jpg',
                            depiction: "Actions",
                            numberStr: "",
                            setFontSize: contentFontSize,
                          ),
                          SetListTile(
                            imgPath: 'assets/Images/Pic4.png',
                            depiction: "Projects",
                            numberStr: "25",
                            setFontSize: contentFontSize,
                          ),
                          SetListTile(
                            imgPath: 'assets/Images/Pic5.png',
                            depiction: "Security",
                            numberStr: "7",
                            setFontSize: contentFontSize,
                            depictionDtl:
                                "Flutter 3.16 beta (October 11, 2, 2025",
                          ),
                          SetListTile(
                            imgIcon: Icons.more_horiz,
                            depiction: "More",
                            setFontSize: contentFontSize,
                            rightIcons: Icons.keyboard_arrow_up,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(padding: EdgeInsets.only(top: 17)),
          ],
        ),
        /*bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.control_point)),
                    ],
                  ),
                ),
                label: ""),
          ],
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
        ),*/
        backgroundColor: Colors.black,
      ),
    );
  }
}

class SetElevatedButton extends StatelessWidget {
  final double setWidth;
  final double setFontSize;
  final Icon setIcon;
  final Color setBackgroundColor;
  final Color setTextColor;
  final String? textStr;
  const SetElevatedButton(
      {super.key,
      this.setWidth = 65,
      this.setFontSize = 22.5,
      this.setIcon = const Icon(Icons.star),
      this.setBackgroundColor = Colors.blue,
      this.setTextColor = Colors.white,
      this.textStr});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            minimumSize: Size(setWidth, 55), // 按鈕大小
            maximumSize: Size(setWidth, 55), // 按鈕大小
            backgroundColor: setBackgroundColor, // 背景顏色
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              setIcon,
              if (textStr != null)
                SizedBox(
                  width: 5,
                ),
              if (textStr != null)
                Text(
                  textStr ?? "",
                  style: TextStyle(fontSize: setFontSize, color: setTextColor),
                ),
            ],
          ),
        ));
  }
}

class SizedIconButton extends StatelessWidget {
  final double setWidth;
  final double setHeight;
  final Icon setIcon;
  const SizedIconButton(
      {super.key,
      this.setWidth = 36,
      this.setHeight = 36,
      this.setIcon = const Icon(Icons.star)});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: setWidth,
      height: setHeight,
      child: IconButton(onPressed: () {}, icon: setIcon, iconSize: 20),
    );
  }
}

class SetListTile extends StatelessWidget {
  final String imgPath;
  final IconData imgIcon;
  final String depiction;
  final String depictionDtl;
  final String numberStr;
  final double setFontSize;
  final double setBoxWidth;
  final double setDtlBoxWidth;
  final Color backgroundColor;
  final bool showRigntIcon;
  final IconData rightIcons;
  final bool showTopBorder;
  final bool showBottomBorder;
  const SetListTile(
      {super.key,
      this.imgPath = "",
      this.imgIcon = Icons.star,
      this.depiction = "",
      this.depictionDtl = "",
      this.numberStr = "",
      this.setFontSize = 20,
      this.setBoxWidth = 10,
      this.setDtlBoxWidth = 50,
      this.backgroundColor = Colors.black,
      this.showRigntIcon = true,
      this.rightIcons = Icons.chevron_right,
      this.showTopBorder = false,
      this.showBottomBorder = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5), // 設定上下間距
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
              bottom: showBottomBorder
                  ? BorderSide(color: Colors.grey, width: 0.3)
                  : BorderSide.none,
              top: showTopBorder
                  ? BorderSide(color: Colors.grey, width: 0.3)
                  : BorderSide.none),
          borderRadius: BorderRadius.circular(0)),
      child: ListTile(
        title: Column(
          children: [
            Row(
              children: [
                imgPath.isNotEmpty
                    ?
                    // 左側圖片
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imgPath,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(imgIcon, color: Colors.blueGrey, size: 25),
                          SizedBox(width: 10),
                        ],
                      ),
                SizedBox(width: setBoxWidth),

                // 中間文字
                Expanded(
                  child: Text(
                    depiction,
                    style:
                        TextStyle(color: Colors.white, fontSize: setFontSize),
                    overflow: TextOverflow.ellipsis, // 避免文字過長溢出
                  ),
                ),

                // 右側數字 + 箭頭
                Row(
                  children: [
                    if (numberStr.isNotEmpty)
                      Text(
                        numberStr,
                        style: TextStyle(color: Colors.white),
                      ),
                    if (numberStr.isNotEmpty) SizedBox(width: 5), // 間距
                    if (showRigntIcon) Icon(rightIcons, color: Colors.white),
                  ],
                ),
              ],
            ),
            if (depictionDtl.isNotEmpty)
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: setDtlBoxWidth),
                      Expanded(
                        child: Text(
                          depictionDtl,
                          style: TextStyle(
                              color: Colors.white, fontSize: setFontSize),
                          overflow: TextOverflow.ellipsis, // 避免文字過長溢出
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: setDtlBoxWidth),
                      Text(
                        "A year ago·",
                        style: TextStyle(
                            color: Colors.grey, fontSize: setFontSize),
                        overflow: TextOverflow.ellipsis, // 避免文字過長溢出
                      ),
                      Text(
                        "Last",
                        style: TextStyle(
                            color: Colors.greenAccent, fontSize: setFontSize),
                        overflow: TextOverflow.ellipsis, // 避免文字過長溢出
                      ),
                    ],
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
