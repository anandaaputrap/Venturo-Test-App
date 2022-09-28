// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venturomalang/colors.dart';
import 'package:venturomalang/providers/cartprovider.dart';
import 'package:venturomalang/providers/produkprovider.dart';
import 'package:venturomalang/providers/voucherprovider.dart';
import 'package:venturomalang/widgets/checkoutcard.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ProdukProvider pp = Provider.of<ProdukProvider>(context);
    CartProvider cp = Provider.of<CartProvider>(context);
    VoucherProvider vp = Provider.of<VoucherProvider>(context);

    pp.getProduk();
    vp.getVoucher;
    print('Jumlah Produk : ${pp.produk.length}');
    print('Jumlah Voucher : ${vp.vocer.length}');

    Widget header() {
      return AppBar(
        backgroundColor: bgColor6,
        elevation: 0,
        centerTitle: true,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultmargin),
        children: pp.produk
            .map(
              (product) => CheckoutCard(product),
            )
            .toList(),
      );
    }

    Widget customBottomNav() {
      return Container(
        decoration: BoxDecoration(
          color: bgColor4,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 180,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultmargin,
                vertical: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Pesanan',
                        style: primarytextcolor.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      Text(
                        '(${cp.totalProduct()} Menu)',
                        style: primarytextcolor.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                        .format(cp.totalPrice()),
                    style: primarypricecolor.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: bgColor3,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultmargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/Vector(2).png',
                        height: 20,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Voucher',
                        style: primarytextcolor.copyWith(
                            fontSize: 18, fontWeight: bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Input Voucher',
                        style: primarytextcolor.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: inputtext,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Vector(3).png',
                    height: 15,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Pembayaran",
                          style: primarytextcolor.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(
                                  name: 'Rp ', decimalDigits: 0)
                              .format(cp.totalPrice()),
                          style: primarypricecolor,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                    height: 40,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: pricecolor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pesan Sekarang',
                            style: secondarytextcolor.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor6,
      appBar: header(),
      body: content(),
      bottomNavigationBar: customBottomNav(),
      resizeToAvoidBottomInset: false,
    );
  }
}