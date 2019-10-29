import 'package:aula/utis/nav.dart';
import 'package:flutter/material.dart';

import 'dog_page.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print('lista');

                setState(() {
                  _gridView = false;
                });


              }),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print('grid');
                setState(() {
                  _gridView = true;
                });
              }),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    var dogs = [
      Dog("Cao 1", 'assets/images/1.jpg'),
      Dog("Cao 2", 'assets/images/2.jpg'),
      Dog("Cao 3", 'assets/images/3.png'),
      Dog("Cao 4", 'assets/images/4.png'),
      Dog("Cao 5", 'assets/images/5.jpg'),
    ];

    if (_gridView) {
      return GridView.builder(
          itemCount: dogs.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    } else {
      return ListView.builder(
          itemCount: dogs.length,
          itemExtent: 300,
          itemBuilder: (context, index) {
            return _itemView(dogs, index);
          });
    }

  }

  _itemView(List<Dog> dogs, int index) {
    var dog = dogs[index];
    return GestureDetector(
      onTap: (){
        push(context,DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black54, borderRadius: BorderRadius.circular(16)),
              child: Text(dog.nome,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }

  _img(img) {
    return Container(
        child: Image.asset(
      img,
      fit: BoxFit.cover,
    ));
  }
}
