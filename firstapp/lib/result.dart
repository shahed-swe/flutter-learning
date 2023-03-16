import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final num result;
  final Function resetHandler;

  Result(this.result, this.resetHandler);

  String get resultText {
    var textnormal = "Sultan dine Ajaira";
    if (result < 15) {
      textnormal = "Ay hay kuttar mangsho $result";
    } else {
      textnormal = "Na mangsho thik e ase $result";
    }
    return textnormal;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultText,
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 36,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: () => resetHandler(),
            child: Text("Back"),
          )
        ],
      ),
    );
  }
}
