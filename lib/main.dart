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
      home: KatalogProduk(),
    );
  }
}

// 1. Model Data Produk
class Product {
  final String name;
  final int price;
  final String imageUrl;
  final String city;
  final double rating;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.city,
    required this.rating,
  });
}

// 2. Halaman Utama (Katalog Produk)
class KatalogProduk extends StatelessWidget {
  KatalogProduk({super.key});

  // Data Dummy Produk
  final List<Product> products = [
    Product(
      name: 'Sepatu Sneakers Pria Kasual',
      price: 150000,
      imageUrl: 'https://picsum.photos/id/103/200/200',
      city: 'Jakarta Selatan',
      rating: 4.8,
    ),
    Product(
      name: 'Tas Ransel Laptop Anti Air',
      price: 85000,
      imageUrl: 'https://picsum.photos/id/119/200/200',
      city: 'Bandung',
      rating: 4.9,
    ),
    Product(
      name: 'Kacamata Hitam Fashion',
      price: 25000,
      imageUrl: 'https://picsum.photos/id/64/200/200',
      city: 'Surabaya',
      rating: 4.5,
    ),
    Product(
      name: 'Jam Tangan Pria Analog',
      price: 45000,
      imageUrl: 'https://picsum.photos/id/175/200/200',
      city: 'Semarang',
      rating: 4.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], 
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Katalog Rafeey',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        //profile 
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(width: 10), 
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,       
            childAspectRatio: 0.7,   
            crossAxisSpacing: 8,     
            mainAxisSpacing: 8,      
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            
            return Card(
              color: Colors.white,
              elevation: 2,
              clipBehavior: Clip.antiAlias, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    product.imageUrl,
                    height: 120, 
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            maxLines: 2, 
                            overflow: TextOverflow.ellipsis, 
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Rp ${product.price}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange, 
                            ),
                          ),
                          const Spacer(), 
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  product.city,
                                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Icon(Icons.star, size: 14, color: Colors.amber),
                              const SizedBox(width: 2),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// 3. --- HALAMAN BARU: PROFIL MAHASISWA ---
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Profil Saya',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70, // Ukuran foto
              backgroundImage: AssetImage('assets/images/foto_rafi.jpeg'), 
            ),
            const SizedBox(height: 20), 
            
            // Nama Pribadi
            const Text(
              'Muhammad Rafi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            
            // NIM
            const Text(
              'NIM: 2306086',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}