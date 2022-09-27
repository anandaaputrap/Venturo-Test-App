import 'package:venturomalang/services/produkservice.dart';

class ProdukModel {
  int id;
  String nama;
  double harga;
  String tipe;
  String gambar;

  ProdukModel({
    this.id,
    this.nama,
    this.harga,
    this.tipe,
    this.gambar,
  });

  ProdukModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    harga = double.parse(json['harga'].toString());
    tipe = json['tipe'];
    gambar = json['gambar'];

  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'tipe': tipe,
      'gambar' : gambar,
    };
  }
}