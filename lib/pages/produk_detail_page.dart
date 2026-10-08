import 'package:flutter/material.dart';

class ProdukDetailPage extends StatelessWidget {
  final String namaProduk;
  final int harga;
  final IconData ikon;

  const ProdukDetailPage({
    super.key,
    required this.namaProduk,
    required this.harga,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(ikon, size: 120, color: Colors.blueGrey),
            ),
            const SizedBox(height: 16),
            Text(
              namaProduk,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Rp $harga'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, namaProduk);
              },
              child: const Text('Pilih Produk Ini'),
            ),
          ],
        ),
      ),
    );
  }
}