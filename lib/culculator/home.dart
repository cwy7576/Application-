import 'package:flutter/material.dart';

class HomePahe extends StatefulWidget {
  const HomePahe({Key? key}) : super(key: key);

  @override
  State<HomePahe> createState() => _HomePaheState();
}

class _HomePaheState extends State<HomePahe> {
  late int firnum;
  late int secondnum;

  String texttodisply = "";
  late String res;
  late String operationtoperform;

  void btnclicked(String btntext) {
    if (btntext == "C") {
      texttodisply = "";
      firnum = 0;
      secondnum = 0;
      res = "";
    } else if (btntext == "+" ||
        btntext == "-" ||
        btntext == "x" ||
        btntext == "/") {
      firnum = int.parse(texttodisply);
      res = "";
      operationtoperform = btntext;
    } else if (btntext == "=") {
      secondnum = int.parse(texttodisply);
      if (operationtoperform == "+") {
        res = (firnum + secondnum).toString();
      }
      if (operationtoperform == "-") {
        res = (firnum - secondnum).toString();
      }
      if (operationtoperform == "x") {
        res = (firnum * secondnum).toString();
      }
      if (operationtoperform == "/") {
        res = (firnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisply + btntext).toString();
    }

    setState(() {
      texttodisply = res;
    });
  }

  Widget custombutton(String btnval, {required Color Color}) {
    
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(18),
        child: OutlinedButton(
          onPressed: () => btnclicked(btnval),
          
          
          // ignore: unnecessary_string_interpolations
          child: Text('$btnval',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 115, 129, 133),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 34, 51, 54),
        centerTitle: false,
        title: const Text(
          ' Standard ',
          style: const TextStyle(
              color: Color.fromARGB(255, 248, 248, 248), fontSize: 18),
        ),
      ),
      body: Container(
        //  color: Color.fromARGB(255, 255, 164, 164),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomRight,
              child: Text(
                '$texttodisply',
                style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.w600,backgroundColor: Colors.white),
              ),
            )),
            Row(
              children: <Widget>[
                custombutton("7",Color:Colors.amber),
                custombutton("8",Color:Color.fromARGB(255, 0, 0, 0)),
                custombutton("9",Color:Colors.amber),
                custombutton("x",Color:Colors.amber),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("4",Color:Colors.amber),
                custombutton("5",Color:Colors.amber),
                custombutton("6",Color:Colors.amber),
                custombutton("-",Color:Colors.amber),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("1",Color:Colors.amber),
                custombutton("2",Color:Colors.amber),
                custombutton("3",Color:Colors.amber),
                custombutton("+",Color:Colors.amber),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C",Color:Colors.amber),
                custombutton("0",Color:Colors.amber),
                custombutton("=",Color:Colors.amber),
                custombutton("/",Color:Colors.amber),
              ],
            )
          ],
        ),
      ),
    );
  }
}
