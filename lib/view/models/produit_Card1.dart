
class Produitjson {
  String? placeImage;
  String? placeName;
  List<String>? placeItems;
  int? minOrder;

  Produitjson(
      {this.placeImage, this.placeName, this.placeItems, this.minOrder});

  Produitjson.fromJson(Map<String, dynamic> json) {
    placeImage = json['placeImage'];
    placeName = json['placeName'];
    placeItems = json['placeItems'].cast<String>();
    minOrder = json['minOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['placeImage'] = placeImage;
    data['placeName'] = placeName;
    data['placeItems'] = placeItems;
    data['minOrder'] = minOrder;
    return data;
  }
}