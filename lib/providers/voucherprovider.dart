import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:venturomalang/models/vouchermoder.dart';
import 'package:venturomalang/services/voucherservice.dart';

class VoucherProvider with ChangeNotifier {
  List<VoucherModel> _vocer = [];
  List<VoucherModel> get vocer => _vocer;

  set vocer(List<VoucherModel> vocer) {
    _vocer = vocer;
    notifyListeners();
  }

  Future<void> getVoucher() async {
    try {
      List<VoucherModel> vocer = await VoucherService().getVoucher();
      _vocer = vocer;
    } catch (e) {
      print(e);
    }
  }
}