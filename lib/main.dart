import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController hightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados";

  void _resetfields() {
    weightController.text = "";
    hightController.text = "";
    setState(() {
      this._infoText = "Informe seus dados";
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse("${weightController.text}");
      double hight = double.parse("${hightController.text}") / 100;
      double imc = weight / (hight * hight);
      if (imc <= 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)}) ";
      } else if (imc >= 18.6 && imc <= 24.9) {
        _infoText = "Peso Ideal(${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc <= 29.9) {
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc <= 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc <= 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40.0) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculador de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetfields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.person_outline, size: 120.0, color: Colors.green),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Peso (KG)",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                  controller: weightController,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.green)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20.0),
                  controller: hightController,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: calculate,
                      child: Text(
                        "Calcular",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  _infoText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 25.0),
                )
              ],
            ),
          )),
    );
  }
}
