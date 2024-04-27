class ProductModel {
  int? id;
  String? name;
  String? description;
  String? measure;
  int? price;
  String? image;
  String? barcode;
  String? barcodeType;
  int? count;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.measure,
    this.price,
    this.image,
    this.barcode,
    this.barcodeType,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    measure = json['measure'];
    price = json['price'];
    image = json['image'];
    barcode = json['barcode'];
    barcodeType = json['barcode_type'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['measure'] = this.measure;
    data['price'] = this.price;
    data['image'] = this.image;
    data['barcode'] = this.barcode;
    data['barcode_type'] = this.barcodeType;
    return data;
  }
}
