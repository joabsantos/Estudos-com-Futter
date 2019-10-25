import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
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

    return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          var dog = dogs[index];
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _img(dog.foto),
              Text(dog.nome,
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ))
            ],
          );
        });
  }

  _img(img) {
    return Container(
        child: Image.asset(
      img,
      fit: BoxFit.cover,
    ));
  }
}
