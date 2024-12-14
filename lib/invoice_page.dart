import 'package:flutter/material.dart';
import 'package:invoice_generator/invoice_data.dart';
class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice Page"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Invoice Details",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Table Widget
            Table(
              border: TableBorder.all(color: Colors.black54),
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
              },
              children: [
                // Header Row
                const TableRow(
                  decoration: BoxDecoration(color: Colors.blueAccent),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Description", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Qty", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Price", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Total", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),

                // Dynamic Rows from invoiceItems
                ...invoiceItems.map((item) {
                  double total = item['qty'] * item['price']; // Total calculation
                  return TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item['description']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(item['qty'].toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("RM ${item['price']}"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("RM ${total.toStringAsFixed(2)}"),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
