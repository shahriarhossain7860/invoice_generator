import 'package:flutter/material.dart';
import 'package:invoice_generator/invoice_page.dart';

class InvoiceGenerator extends StatelessWidget {
  const InvoiceGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => const InvoicePage(),
      },
    );
  }
}
