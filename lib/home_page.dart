import 'package:aula/pages/hello_listview.dart';
import 'package:aula/pages/hello_page1.dart';
import 'package:aula/pages/hello_page2.dart';
import 'package:aula/pages/hello_page3.dart';
import 'package:aula/utis/nav.dart';
import 'package:aula/widgets/blue_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Hello Flutter',
          ),
          centerTitle: true,
        ),
        body: _body(context));
  }

  _body(context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img('assets/images/1.jpg'),
          _img('assets/images/2.jpg'),
          _img('assets/images/3.png'),
          _img('assets/images/4.png'),
          _img('assets/images/5.jpg'),
        ],
      ),
    );
  }

  Column _buttons(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton(
                "ListView", () => _onClickNavigator(context, HelloListView())),
            BlueButton(
                "Page 2 ", () => _onClickNavigator(context, HelloPage2())),
            BlueButton(
                "Page 3", () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("Snack", _onClickSnack),
            BlueButton("Dialog", _onDialog),
            BlueButton("Toast", _onToast),
          ],
        )
      ],
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }

  _img(img) {
    return Container(
      child: Image.asset(img),
    );
  }


  void _onClickNavigator(context, Widget page) async {
    String s = await push(context, page);
    print(s);
  }

  _onClickSnack() {}

  _onDialog() {}

  _onToast() {}
}