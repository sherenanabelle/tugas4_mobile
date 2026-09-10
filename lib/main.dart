import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Apps',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class CatalogItem {
  final String title;
  final String price;
  final String description;

  CatalogItem({
    required this.title,
    required this.price,
    required this.description,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CatalogItem> items = [
      CatalogItem(
        title: 'Kopi Susu Gula Aren',
        price: 'Rp 22.000',
        description: 'Paduan espresso dengan susu segar dan gula aren pilihan.',
      ),
      CatalogItem(
        title: 'Matcha Latte',
        price: 'Rp 28.000',
        description: 'Teh hijau murni Jepang dipadu dengan susu lembut.',
      ),
      CatalogItem(
        title: 'Croissant Butter',
        price: 'Rp 25.000',
        description: 'Roti kering renyah di luar dan lembut di dalam.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Katalog'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.category, color: Colors.blue),
              title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item.price),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(item: item),
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

class DetailScreen extends StatefulWidget {
  final CatalogItem item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Katalog'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.item.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.item.price,
              style: TextStyle(fontSize: 18, color: Colors.blue[700], fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD), 
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Text(
                widget.item.description,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
            const SizedBox(height: 20),

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
              label: Text(isFavorite ? 'Disukai' : 'Sukai Item Ini'),
            ),
          ],
        ),
      ),
    );
  }
}