class SaleModel {
  int? totalPrice;
  int? cash;
  int? discount;
  int? time;
  int? plastik;
  int? smenaId;
  String? comment;

  SaleModel(
      {this.totalPrice,
      this.cash,
      this.discount,
      this.time,
      this.plastik,
      this.smenaId});

  SaleModel.fromJson(Map<String, dynamic> json) {
    totalPrice = json['total_price'];
    cash = json['cash'];
    discount = json['discount'];
    time = json['time'];
    plastik = json['plastik'];
    smenaId = json['smena_id'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['total_price'] = this.totalPrice;
    data['cash'] = this.cash;
    data['discount'] = this.discount;
    data['time'] = this.time;
    data['plastik'] = this.plastik;
    data['smena_id'] = this.smenaId;
    data['comment'] = this.comment;
    return data;
  }
}
