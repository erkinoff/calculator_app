import 'package:flutter/material.dart';
import 'package:calculator_app/src/screens/components/button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String text = "";
  String result = "";
  String lastText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///AppBar
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF36474F),
        elevation: 0.0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),

      ///Body
      body: Column(
        children: [
          ///Header
          Expanded(
            child: ColoredBox(
              color: const Color(0xFF36474F),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 20,
                  top: 50,
                ),
                child: SizedBox.expand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        result,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      const Center(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Color(0xFFABABAB),
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                          ),
                          child: SizedBox(
                            height: 3,
                            width: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///Footer
          Expanded(
            flex: 2,
            child: ColoredBox(
              color: Colors.blueGrey.shade900,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 40,
                ),
                child: SizedBox.expand(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ///1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            text: "AC",
                            fontSize: 22,
                            onTap: output,
                          ),
                          CustomButton(
                            fontSize: 22,
                            text: "C",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "%",
                            onTap: output,
                          ),
                          CustomButton(
                            color: Colors.white70,
                            textColor: Colors.blueGrey.shade900,
                            fontSize: 40,
                            text: "÷",
                            onTap: output,
                          ),
                        ],
                      ),

                      ///2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            text: "7",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "8",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "9",
                            onTap: output,
                          ),
                          CustomButton(
                            color: Colors.white70,
                            textColor: Colors.blueGrey.shade900,
                            fontSize: 40,
                            text: "×",
                            onTap: output,
                          ),
                        ],
                      ),

                      ///3
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            text: "4",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "5",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "6",
                            onTap: output,
                          ),
                          CustomButton(
                            color: Colors.white70,
                            textColor: Colors.blueGrey.shade900,
                            fontSize: 40,
                            text: "-",
                            onTap: output,
                          ),
                        ],
                      ),

                      ///4
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            text: "1",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "2",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "3",
                            onTap: output,
                          ),
                          CustomButton(
                            color: Colors.white70,
                            textColor: Colors.blueGrey.shade900,
                            fontSize: 40,
                            text: "+",
                            onTap: output,
                          ),
                        ],
                      ),

                      ///5
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            text: "",
                            onTap: output,
                          ),
                          CustomButton(
                            text: "0",
                            onTap: output,
                          ),
                          CustomButton(
                            text: ".",
                            fontSize: 40,
                            onTap: output,
                          ),
                          CustomButton(
                            color: Colors.orangeAccent,
                            textColor: Colors.blueGrey.shade900,
                            fontSize: 40,
                            text: "=",
                            onTap: output,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void output(String value) {
    /// Arifmetik amallar ajratib olindi
    RegExp operator = RegExp(r"[÷×\-+]");

    /// Agar result bo'sh bo'lmasa va amal kiritilsa resultga o'sha amal bajariladi
    if (result.isNotEmpty && value.contains(operator)) {
      text = result;
      result = "";
    }

    /// Agar result bo'sh bo'lmasa va son kiritilsa ekran tozalanib yangi amal bajariladi
    else if (result.isNotEmpty && value.contains(RegExp(r"[0-9]"))) {
      result = "";
      text = "";
    }

    /// Valueni qiymatlari uchun
    switch (value) {
      case "AC":
        {
          text = "";
          result = "";
        }
      case "C":
        {
          if (text.isNotEmpty) {
            text = text.substring(0, text.length - 1);
          }
        }
      case "=":
        {
          calculatorLogic();
        }
      case "%":
        {
          if (text.isNotEmpty && text.split(operator).last.isNotEmpty) {
            String lastNumber = text.split(operator).removeLast();
            text = text.replaceRange(text.length - lastNumber.length,
                text.length, (num.parse(lastNumber) / 100 * 1).toString());
          }
        }
      default:
        {
          /// Agar value son bo'lsa textga qo'shib boriladi
          if (value.contains(RegExp(r"[0-9]"))) {
            text += value;
          }

          /// Text bo'sh bo'lsa va arifmetik amallar yoki nuqta kiritilsa nol
          /// avtomatik qo'yiladi
          else if (text.isEmpty && value.contains(RegExp(r"[÷×\-+.]"))) {
            text = "0$value";
          }

          /// Value amal bo'lsa va textni oxiri amallar bilan tugamagan bo'lsa
          /// o'sha amal qo'shiladi
          else if (value.contains(operator) &&
              !"÷×-+".contains(text[text.length - 1])) {
            text += value;
          }

          /// Value amal bo'lsa va text amal bilan tugagan bo'lsa amal almashadi
          else if (value.contains(operator) &&
              "÷×-+".contains(text[text.length - 1])) {
            text = text.substring(0, text.length - 1) + value;
          }

          /// Nuqta qo'yiladi qachonki oxiri nuqta bilan tugamagan bo'lsa va
          /// oxirgi raqamda ham nuqta qatnashmagan bo'lsa
          else if (value == "." &&
              text[text.length - 1] != "." &&
              !text.split(operator).last.contains(".")) {
            text += value;
          }
        }
    }
    setState(() {});
  }

  void calculatorLogic() {
    /// Text bo'sh bo'lsa avtomatik 0 chiqadi
    if (text.isEmpty) {
      result = "0";
      setState(() {});
      return;
    }
    List<String> stringNumbers = text.split(RegExp(r"[÷×\-+]"))
      ..removeWhere((e) => e.isEmpty);
    List<num> numbers = stringNumbers.map((e) => num.parse(e)).toList();
    String actions = text.replaceAll(RegExp(r"[0-9.]"), "");
    int index = 0;

    ///Ko'paytiruv va bo'luv amallari birinchi bajarilishi uchun
    for (String action in ["×", "÷"]) {
      while (actions.contains(action, index)) {
        index = actions.indexOf(action, index);
        num tempResult = 0;
        if (index + 1 < numbers.length) {
          tempResult = action == "×"
              ? numbers[index] * numbers[index + 1]
              : numbers[index] / numbers[index + 1];
          numbers.removeRange(index, index + 2);
          numbers.insert(index, tempResult);
        }
        actions = actions.replaceFirst(action, "");
      }
    }
    num lastResult = numbers.first;

    index = 0;

    ///Endi faqat + va - amallari qoldi
    for (int i = 1; i < numbers.length; i++) {
      if (actions[index] == "+") {
        lastResult += numbers[i];
      } else {
        lastResult -= numbers[i];
      }
      index++;
    }
    result = lastResult.toString();
    setState(() {});
  }
}
