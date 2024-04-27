class SaleItemModel {
  int? id;
  int? saleId;
  int? productId;
  int? price;
  int? amount;
  int? summa;

  SaleItemModel(
      {this.id,
      this.saleId,
      this.productId,
      this.price,
      this.amount,
      this.summa});

  SaleItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saleId = json['sale_id'];
    productId = json['product_id'];
    price = json['price'];
    amount = json['amount'];
    summa = json['summa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sale_id'] = this.saleId;
    data['product_id'] = this.productId;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['summa'] = this.summa;
    return data;
  }
}
