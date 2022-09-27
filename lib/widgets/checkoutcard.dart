import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:venturomalang/colors.dart';
import 'package:venturomalang/models/produkmodel.dart';
import 'package:venturomalang/providers/cartprovider.dart';

class CheckoutCard extends StatelessWidget {
  final ProdukModel product;
  CheckoutCard(this.product);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

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
                      product.gambar,
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
                      product.nama,
                      style: primarytextcolor.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency(name: 'Rp ', decimalDigits: 0)
                          .format(product.harga),
                      style: primarypricecolor,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  cartProvider.addCart(product);
                },
                child: Image.asset(
                  'assets/Vector(4).png',
                  width: 16,
                ),
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