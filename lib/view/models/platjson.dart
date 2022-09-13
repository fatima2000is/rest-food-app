import 'dart:ffi';

class PlatJson {
  int? id;
  String? image;
  String? title;
  int? price;
  String? description;
  double? rating;

  PlatJson(
      {this.id,
      this.image,
      this.title,
      this.price,
      this.description,
      this.rating});

  PlatJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json[' title'];
    price = json['price'];
    description = json['description'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['image'] = image;
    data[' title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['rating'] = rating;
    return data;
  }
}
