import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/produk_detail_page.dart';
import 'package:flutter_application_1/pages/tambah_produk_page.dart';

class ProdukListPage extends StatefulWidget {
  const ProdukListPage({super.key});

  @override
  State<ProdukListPage> createState() => _ProdukListPageState();
}

class _ProdukListPageState extends State<ProdukListPage> {
  final List<Map<String, dynamic>> produk = [
    {'nama': 'Kursi Minimalis', 'harga': 350000, 'ikon': Icons.chair},
    {'nama': 'Meja Kerja Kayu', 'harga': 750000, 'ikon': Icons.table_restaurant},
    {'nama': 'Lampu Meja LED', 'harga': 120000, 'ikon': Icons.lightbulb},
    {'nama': 'Rak Buku Susun', 'harga': 480000, 'ikon': Icons.bookmarks},
    {'nama': 'Sofa Santai', 'harga': 1500000, 'ikon': Icons.weekend},
  ];

  Future<void> _bukaFormTambah() async {
    final hasil = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(builder: (context) => const TambahProdukPage()),
    );

    if (hasil != null && mounted) {
      setState(() {
        produk.add({...hasil, 'ikon': Icons.inventory_2});
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produk "${hasil['nama']}" berhasil ditambahkan')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: produk.length,
        itemBuilder: (context, index) {
          final item = produk[index];
          return ListTile(
            leading: Icon(item['ikon'], size: 36),
            title: Text(item['nama']),
            subtitle: Text('Rp ${item['harga']}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () async {
              final hasilPilihan = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProdukDetailPage(
                    namaProduk: item['nama'],
                    harga: item['harga'],
                    ikon: item['ikon'],
                  ),
                ),
              );
              if (hasilPilihan != null && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Anda memilih: $hasilPilihan')),
                );
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaFormTambah,
        child: const Icon(Icons.add),
      ),
    );
  }
}