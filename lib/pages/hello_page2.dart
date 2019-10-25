import 'package:aula/widgets/blue_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 2"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        "Voltar",
        () => _onClickVoltar(context),
        color: Colors.red,
      ),
    );
  }

  _onClickVoltar(context) {
    Navigator.pop(context, "Tela2");
  }
}
