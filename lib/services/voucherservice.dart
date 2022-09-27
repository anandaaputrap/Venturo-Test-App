import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:venturomalang/models/vouchermoder.dart';

class VoucherService {
  String baseUrl = 'https://tes-mobile.landa.id/api';

  Future<List<VoucherModel>> getVoucher() async {
    var url = Uri.parse('$baseUrl/vouchers');
    var headers = {'Content-type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['datas'];
      List<VoucherModel> vocer = [];

      for (var item in data) {
        vocer.add(VoucherModel.fromJson(item));
      }

      return vocer;
    } else {
      throw Exception('Gagal Get Produk');
    }
  }
}