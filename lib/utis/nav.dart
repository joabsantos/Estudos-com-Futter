import 'package:flutter/material.dart';

push(context, page) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return page;
  }));
}
