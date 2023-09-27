class productModel {
  String id;
  String brand;
  String name;
  String price;
  int rating;
  String image;
  String description;
  productModel(this.id,this.brand,this.name,this.price,this.rating,this.image,this.description);
  factory productModel.fromJson(Map<String,dynamic> json){
    return productModel(
      json['id'].toString(),
      json["brand"].toString(),
      json["name"].toString(),
      json["price"].toString(),
      json["rating"],
      json["image_link"].toString(),
      json["description"].toString(),
    );
  }

}