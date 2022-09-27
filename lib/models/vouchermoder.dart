class VoucherModel {
  int id;
  String kodevocer;
  double nominalvocer;

  VoucherModel({
    this.id,
    this.kodevocer,
    this.nominalvocer,
  });

  VoucherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toInt();
    kodevocer = json['kodevocer'];
    nominalvocer = json['nominalvocer'].toDouble();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kodevocer': kodevocer,
      'nonominalvocer': nominalvocer,
    };
  }
}