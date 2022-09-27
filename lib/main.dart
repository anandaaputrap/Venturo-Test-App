import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:venturomalang/pages/checkoutpage.dart';
import 'package:venturomalang/pages/keranjangpage.dart';
import 'package:venturomalang/providers/cartprovider.dart';
import 'package:venturomalang/providers/produkprovider.dart';
import 'package:venturomalang/providers/transaksiprovider.dart';
import 'package:venturomalang/providers/voucherprovider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProdukProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransaksiProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VoucherProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => KeranjangPage(),
          '/checkout': (context) => CheckoutPage(),
        },
      ),
    );
  }
}