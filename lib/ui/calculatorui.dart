import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double firstnum=0;

  double secondnum=0;

  String txttodisplay = " ";

  String result = '';

  String operations = '';

  String history='';

  void buttonclk(String buttontext) {
    if (buttontext == 'AC') {
      txttodisplay = " ";
      firstnum = 0;
      secondnum = 0;
      result = " ";
      history ="";
    }else if(buttontext=="."){
      if(result.contains(".")){
        print('alreadycontains');
        return;
      }else{
        result =result+buttontext;
      }

    }
    else if (buttontext == "+" ||
        buttontext == "-" ||
        buttontext == "*" ||
        buttontext == "/" ||
        buttontext == "%") {
      firstnum = double.parse(txttodisplay);
      result = "";
      operations = buttontext;
    //  history=firstnum.toString()+operations.toString();
    }
    else if (buttontext == "=") {
      secondnum = double.parse(txttodisplay);
      if (operations == "+") {
        result = (firstnum + secondnum).toString();
        history = firstnum.toString() + operations + secondnum.toString();
      }
      if (operations == "-") {
        result = (firstnum - secondnum).toString();
        history = firstnum.toString() + operations + secondnum.toString();
      }
      if (operations == "*") {
        result = (firstnum * secondnum).toString();
        history = firstnum.toString() + operations + secondnum.toString();

      }
      if (operations == "/") {
        result = (firstnum / secondnum).toString();
        history = firstnum.toString() + operations + secondnum.toString();
      }
      if (operations == "%") {
        result = (firstnum % secondnum).toString();
        history = firstnum.toString() + operations + secondnum.toString();

      }
      firstnum =0;
      secondnum =0;
      operations ="";
    }
      else {
      result = result + buttontext;
      print(result);
    }
    setState(() {
      txttodisplay = result;
      print(txttodisplay);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  history,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  txttodisplay,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFloatingActionButton(Colors.grey, 'AC'),
              buildFloatingActionButton(Colors.grey, '+/-'),
              buildFloatingActionButton(Colors.grey, '%'),
              buildFloatingActionButton(Colors.amber, '/'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFloatingActionButton(Colors.grey.shade800, '7'),
              buildFloatingActionButton(Colors.grey.shade800, '8'),
              buildFloatingActionButton(Colors.grey.shade800, '9'),
              buildFloatingActionButton(Colors.amber, '*'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFloatingActionButton(Colors.grey.shade800, '4'),
              buildFloatingActionButton(Colors.grey.shade800, '5'),
              buildFloatingActionButton(Colors.grey.shade800, '6'),
              buildFloatingActionButton(Colors.amber, '-'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildFloatingActionButton(Colors.grey.shade800, '1'),
              buildFloatingActionButton(Colors.grey.shade800, '2'),
              buildFloatingActionButton(Colors.grey.shade800, '3'),
              buildFloatingActionButton(Colors.amber, '+'),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  buttonclk("0");
                },
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Center(
                      child: Text(
                    '0',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  height: 70,
                  width: 170,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade800),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              buildFloatingActionButton(Colors.grey.shade800, '.'),
              SizedBox(
                width: 30,
              ),
              buildFloatingActionButton(Colors.grey.shade800, '='),
            ],
          )
        ],
      ),
    );
  }

  SizedBox buildFloatingActionButton(Color colors, String text) {
    return SizedBox(
      height: 80,
      width: 80,
      child: FloatingActionButton(
          backgroundColor: colors,
          child: Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            buttonclk(text);
          }),
    );
  }
}
