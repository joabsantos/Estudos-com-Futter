import 'package:aula/pages/hello_listview.dart';
import 'package:aula/pages/hello_page1.dart';
import 'package:aula/pages/hello_page2.dart';
import 'package:aula/pages/hello_page3.dart';
import 'package:aula/utis/nav.dart';
import 'package:aula/widgets/blue_button.dart';
import 'package:aula/widgets/drawer_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(text: "TAB 1"),
            Tab(text: "TAB 2"),
          ]),
          title: Text(
            'Hello Flutter',
          ),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          _body(context),
          Container(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onClickFab();
          },
          child: Icon(Icons.add),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
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

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    () => _onClickNavigator(context, HelloListView())),
                BlueButton(
                    "Page 2 ", () => _onClickNavigator(context, HelloPage2())),
                BlueButton(
                    "Page 3", () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", () => _onClickSnack(context)),
                BlueButton("Dialog", () => _onDialog(context)),
                BlueButton("Toast", _onToast),
              ],
            )
          ],
        );
      },
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

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Olá flutter'),
      action: SnackBarAction(
          label: "OK", textColor: Colors.yellow, onPressed: () => print('ok')),
    ));
  }

  _onDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é tranquilão"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        });
  }

  _onToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onClickFab() {
    print("Adicionar");
  }
}
