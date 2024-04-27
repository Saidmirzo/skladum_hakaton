// class ProductModel {
//   int? id;
//   String? name;
//   String? description;
//   String? measure;
//   int? price;
//   String? image;
//   int? barOde;
//   String? barCodeType;
//   int? category;

//   ProductModel(
//       {this.id,
//       this.name,
//       this.description,
//       this.measure,
//       this.price,
//       this.image,
//       this.barOde,
//       this.barCodeType,
//       this.category});

//   ProductModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     measure = json['measure'];
//     price = json['price'];
//     image = json['image'];
//     barOde = json['bar_ode'];
//     barCodeType = json['bar_code_type'];
//     category = json['category'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['measure'] = measure;
//     data['price'] = price;
//     data['image'] = image;
//     data['bar_ode'] = barOde;
//     data['bar_code_type'] = barCodeType;
//     data['category'] = category;
//     return data;
//   }
// }
