import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Catmodel {
  String? catname;
  String? catimage;

  Catmodel({
    this.catname,
    this.catimage,
  });

  factory Catmodel.fromMap(Map<String, dynamic> map) {
    return Catmodel(catname: map['cat'], catimage: map['catimage']);
  }
}
