class ProdModel {
  int? id;
  String? name;
  int? price;
  String? disc;
  String? maincat;
  String? subcat;
  String? image;

  ProdModel({
    this.id,
    this.name,
    this.price,
    this.disc,
    this.maincat,
    this.subcat,
    this.image,
  });

  factory ProdModel.fromMap(Map<String, dynamic> map) {
    return ProdModel(
        id: map['id'],
        name: map['name'],
        price: map['price'],
        disc: map['disc'],
        maincat: map['maincat'],
        subcat: map['subcat'],
        image: map['image']);
  }

  // Map<String,dynamic>tojson(){
  //   return
  // }
}
