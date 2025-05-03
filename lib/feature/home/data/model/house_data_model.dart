class HouseDataModel {
  String? title;
  String? subtitle;
  String? description;
  int? badCount;
  int? bathCount;
  String? image;
  double? price;
  String? distance;

  HouseDataModel(
      {this.title,
        this.subtitle,
        this.description,
        this.badCount,
        this.bathCount,
        this.image,
        this.price,
        this.distance});

  HouseDataModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    badCount = json['badCount'];
    bathCount = json['bathCount'];
    image = json['image'];
    price = (json['price'] as num?)?.toDouble();
    distance = json['distance'];
  }
}
