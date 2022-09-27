import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venturomalang/colors.dart';
import 'package:venturomalang/models/cartmodel.dart';
import 'package:venturomalang/providers/cartprovider.dart';

class KeranjangCard extends StatelessWidget {
  final CartModel cart;
  KeranjangCard(this.cart);
  @override
  Widget build(BuildContext context) {
    CartProvider cp = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: 10,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor6,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      cart.produk.gambar,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.produk.nama,
                      style: primarytextcolor.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(cart.produk.harga),
                      style: primarypricecolor,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/Vector.png',
                          width: 10,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Tambahkan Catatan',
                          style: primarytextcolor.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cp.reduceQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/min.png',
                      width: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    cart.jumlahpesan.toString(),
                    style: primarytextcolor.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      cp.addQuantity(cart.id);
                    },
                    child: Image.asset(
                      'assets/plus.png',
                      width: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}