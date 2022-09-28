import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:venturomalang/models/produkmodel.dart';

class ProdukService {
  String baseurl = 'https://tes-mobile.landa.id/api';

  Future<List<ProdukModel>> getProduk() async {
    var url = Uri.parse('$baseurl/menus');
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['datas'];
      List<ProdukModel> produk = [];

      for (var item in data) {
        produk.add(ProdukModel.fromJson(item));
      }
      return produk;
    } else {
      throw Exception('Gagal Get Produk');
    }
  }
}