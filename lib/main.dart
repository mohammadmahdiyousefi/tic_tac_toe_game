import 'package:flutter/material.dart';

void main() {
  runApp(APP());
}

class APP extends StatefulWidget {
  APP({Key? key}) : super(key: key);

  @override
  State<APP> createState() => _APPState();
}

class _APPState extends State<APP> {
  //متغیر تعویض نوبت
  var turn = 'O';
  //متغیر های امتیاز
  int X = 0;
  int O = 0;
  //متغیر های وضعیت برنده
  var status = ['winner is X', 'Winner is O', ' Draw'];
  bool winstatus = false;
  //متغیر برای ذخیره سازه وضعیت پر بودن خانه ها
  List<String> XandOlist = ['', '', '', '', '', '', '', '', ''];
  //برای پیغام
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          //برای ایجاد دکمه ریست
          actions: [
            IconButton(
                onPressed: () {
                  clen(flag: false);
                },
                icon: Icon(Icons.refresh))
          ],
          title: Text('Tic Tac Toe'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[900],
        ),
        body: SafeArea(
            child: Column(
          children: [
            //متد برای بردر های قرمز و ابی
            getScoreboard(),
            SizedBox(
              height: 20,
            ),
            //امتیاز
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$O',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    '$X',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            //نمایش برنده و مساوی شدم
            Expanded(
                flex: 1,
                //ویزیبل برای زمانی هست که می خواهیم سه چیز در زمانی خواص نشان داده شود
                child: Visibility(
                  visible: winstatus,
                  child: Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(170, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(color: Colors.white, width: 1)),
                      onPressed: () {
                        clen(flag: true);
                      },
                      child: Text(
                        status[i],
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: 15,
            ),
            //متد گرفتن مربع های بازی
            getgried(turn),
            getturn(turn)
          ],
        )),
      ),
    );
  }

//تابع برای تغیر وضعیت بعد کلیک کردن
  void taped(int index) {
    print(index);
    setState(() {
      if (XandOlist[index] == '' && winstatus == false) {
        if (turn == 'O') {
          turn = 'X';
          XandOlist[index] = 'O';
        } else {
          turn = 'O';
          XandOlist[index] = 'X';
        }
        chekwin();
      }
    });
  }

//تابع قوانین بازی
  void chekwin() {
    if (XandOlist[0] == XandOlist[1] &&
        XandOlist[1] == XandOlist[2] &&
        XandOlist[0] != '') {
      if (XandOlist[0] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist[3] == XandOlist[4] &&
        XandOlist[4] == XandOlist[5] &&
        XandOlist[3] != '') {
      if (XandOlist[3] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist[6] == XandOlist[7] &&
        XandOlist[7] == XandOlist[8] &&
        XandOlist[6] != '') {
      if (XandOlist[6] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist[0] == XandOlist[3] &&
        XandOlist[3] == XandOlist[6] &&
        XandOlist[0] != '') {
      if (XandOlist[0] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist[1] == XandOlist[4] &&
        XandOlist[4] == XandOlist[7] &&
        XandOlist[1] != '') {
      if (XandOlist[1] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist[2] == XandOlist[5] &&
        XandOlist[5] == XandOlist[8] &&
        XandOlist[2] != '') {
      if (XandOlist[2] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist[0] == XandOlist[4] &&
        XandOlist[4] == XandOlist[8] &&
        XandOlist[0] != '') {
      if (XandOlist[0] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist[2] == XandOlist[4] &&
        XandOlist[4] == XandOlist[6] &&
        XandOlist[2] != '') {
      if (XandOlist[2] == 'O') {
        O++;
        i = 1;
      } else {
        X++;
        i = 0;
      }
      winstatus = true;
    } else if (XandOlist.contains('') == false) {
      i = 2;
      winstatus = true;
      print('drow');
    }
  }

//تابع پاک کر دن یا ریست بازی
  void clen({bool flag = true}) {
    setState(() {
      for (int i = 0; i < 9; i++) {
        XandOlist[i] = '';
      }
      winstatus = false;
      if (flag == false) {
        X = 0;
        O = 0;
      }
    });
  }

  Widget getturn(var turn) {
    return Expanded(
      flex: 1,
      child: Text(
        'Turn  $turn',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget getgried(var turn) {
    return Expanded(
      flex: 10,
      //ایجاد خانه های مربعی شکل مانند اینستا کنار هم
      child: GridView.builder(
        //تعداد خانه ها
        itemCount: 9,
        //تعداد خانه ها در یک ردیف افقی
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        //نوع ان خانه ها که در اینجا از نوع جسشر ویجت اند
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              taped(index);
              print(turn);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Center(
                  child: Text(XandOlist[index],
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: XandOlist[index] == 'O'
                              ? Colors.red
                              : Colors.blue)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget getScoreboard() {
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
              width: 150,
              height: 45,
              child: Center(
                  child: Text(
                'Player O',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          ),
          DecoratedBox(
            position: DecorationPosition.background,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Container(
              width: 150,
              height: 45,
              child: Center(
                  child: Text(
                'Player X',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
