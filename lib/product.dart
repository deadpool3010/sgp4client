import 'dart:convert';
import 'package:amaze/catmodel.dart';
import 'package:amaze/contsant.dart';
import 'package:amaze/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

FirebaseFirestore fire = FirebaseFirestore.instance;

class CatList extends StatefulWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  List<Catmodel> mainmodel = [];

  @override
  void initState() {
    super.initState();

    loadcat();
  }

  Future<void> loadcat() async {
    String data = await rootBundle.loadString("assets/cat.json");
    setState(() {
      mainmodel =
          (jsonDecode(data) as List).map((e) => Catmodel.fromMap(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: mainmodel.length,
        itemBuilder: (context, index) {
          Catmodel catmodel = mainmodel[index];
          return InkWell(
            onTap: () async {
              await catNavigation(context, catmodel.catname.toString());
            },
            child: buildImageWithName(
                catmodel.catname.toString(), catmodel.catimage.toString()),
          );
        },
      ),
    );
  }

  Widget buildImageWithName(String name, String imageUrl) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                height: 46,
                width: 46,
              ),
              SizedBox(height: 7),
              Text(
                name,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
