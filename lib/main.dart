import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Apps',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Screen1(),
    );
  }
}

class Katalog {
  final String nama;
  final String kategori;
  final String harga;
  final String deskripsi;

  Katalog({
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.deskripsi,
  });
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Katalog> daftarKatalog = [
      Katalog(
        nama: 'Katalog Sepatu',
        kategori: 'Pakaian & Gaya',
        harga: 'Rp 450.000',
        deskripsi: 'Sepatu sneakers kasual yang nyaman digunakan untuk aktivitas sehari-hari maupun bepergian. Desain modern dan tahan lama.',
      ),
      Katalog(
        nama: 'Katalog Tas',
        kategori: 'Aksesoris',
        harga: 'Rp 200.000',
        deskripsi: 'Tas ransel berkapasitas besar dengan material anti air. Cocok untuk kuliah atau bekerja membawa laptop.',
      ),
      Katalog(
        nama: 'Katalog Jaket',
        kategori: 'Pakaian & Gaya',
        harga: 'Rp 350.000',
        deskripsi: 'Jaket dengan material tebal yang cocok untuk cuaca dingin. Memiliki banyak saku multifungsi.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Katalog'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: daftarKatalog.length,
        itemBuilder: (context, index) {
          final item = daftarKatalog[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.image, color: Colors.grey, size: 30),
              ),
              title: Text(item.nama),
              subtitle: Text(item.kategori),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(katalog: item),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  final Katalog katalog;

  const Screen2({super.key, required this.katalog});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool isFavorite = false;
  int jumlahBeli = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Katalog'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Icon(Icons.image, size: 80, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              widget.katalog.nama,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.katalog.harga,
              style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F0FE),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Deskripsi Produk:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.katalog.deskripsi,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  label: Text(isFavorite ? 'Disukai' : 'Suka'),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        if (jumlahBeli > 0) {
                          setState(() {
                            jumlahBeli--;
                          });
                        }
                      },
                    ),
                    Text('$jumlahBeli', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {
                        setState(() {
                          jumlahBeli++;
                        });
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}