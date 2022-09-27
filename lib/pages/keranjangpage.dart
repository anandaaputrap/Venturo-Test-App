// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:venturomalang/colors.dart';
import 'package:venturomalang/providers/cartprovider.dart';
import 'package:venturomalang/providers/transaksiprovider.dart';
import 'package:venturomalang/widgets/keranjangcard.dart';

class KeranjangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cp = Provider.of<CartProvider>(context);
    TransaksiProvider tp =
        Provider.of<TransaksiProvider>(context);

    handleCheckout() async {
      if (await tp.checkout(
        cp.carts,
        cp.totalPrice(),
      )) {
        cp.carts = [];
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    }

    Widget header() {
      return AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: bgColor2,
        elevation: 0,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultmargin),
        children: cp.carts
            .map(
              (cart) => KeranjangCard(cart),
            )
            .toList(),
      );
    }

    Widget customButtomNav() {
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
                        'assets/Vector.png',
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
                horizontal: defaultmargin,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/Vector1.png',
                    height: 25,
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
                    height: 50,
                    child: TextButton(
                      onPressed: handleCheckout,
                      style: TextButton.styleFrom(
                        backgroundColor: pricecolor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Bayar Sekarang',
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
      backgroundColor: bgColor2,
      appBar: header(),
      body: content(),
      bottomNavigationBar:
          cp.carts.length == 0 ? SizedBox() : customButtomNav(),
    );
  }
}