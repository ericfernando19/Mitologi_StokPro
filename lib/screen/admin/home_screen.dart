import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stok_barang/config/asset.dart';
import 'package:stok_barang/screen/admin/list_barang.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StokPro APP',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map> _fragment = [
    {'title': 'Data Barang', 'view': ListBarang()},
  ];

  void _navigateToTambahBarang() {
    // Tambahkan navigasi ke halaman Tambah Barang di sini
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ListBarang()), // Ganti dengan halaman yang sesuai
    );
  }

  void _navigateToBarangMasuk() {
    // Tambahkan navigasi ke halaman Barang Masuk di sini
  }

  void _navigateToBarangKeluar() {
    // Tambahkan navigasi ke halaman Barang Keluar di sini
  }

  void _navigateToInfo() {
    // Tambahkan navigasi ke halaman Info di sini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Tambahkan aksi yang ingin dilakukan saat ikon orang diklik
                    },
                    icon: Icon(
                      Icons.person,
                      size: 28,
                      color: const Color.fromARGB(255, 79, 210, 84),
                    ),
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18,
                      color: const Color.fromARGB(255, 79, 210, 84),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Tambahkan aksi yang ingin dilakukan saat ikon orang diklik
                    },
                    icon: Icon(
                      Icons.notifications,
                      size: 28,
                      color: const Color.fromARGB(255, 79, 210, 84),
                    ),
                  ),
                ],
              ), // Tambahkan SizedBox untuk memberikan jarak
              Row(
                children: [
                  Text(
                    'Hai, Mas Koko',
                    style: TextStyle(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 79, 210, 84),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Text('Cari...'),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Tambahkan aksi ketika icon filter diklik
                    },
                    icon: const Icon(Icons.filter_list),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.all(16), // Atur padding sesuai kebutuhan
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 79, 210, 84),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang!di StokPro',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2), // Tambahkan jarak antara teks
                        Text(
                          'Kelola Stok Barang Dengan',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2), // Tambahkan jarak antara teks
                        Text(
                          'Mudah Bersama Kami',
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      '../asset/images/stok.png', // Ganti dengan path gambar Anda
                      width: 100, // Atur lebar gambar sesuai kebutuhan
                      height: 70, // Atur tinggi gambar sesuai kebutuhan
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    const Text(
                      'MENU',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _cardMenu(
                          title: 'Tambah Barang',
                          icon: '../asset/images/tambah.png',
                          color: const Color.fromARGB(255, 79, 210, 84),
                          fontColor: Colors.black,
                          onTap: _navigateToTambahBarang,
                        ),
                        _cardMenu(
                          title: 'Barang Masuk',
                          icon: '../asset/images/masuk.png',
                          color: const Color.fromARGB(255, 79, 210, 84),
                          fontColor: Colors.black,
                          onTap: _navigateToBarangMasuk,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _cardMenu(
                          title: 'Barang Keluar',
                          icon: '../asset/images/keluar.png',
                          color: const Color.fromARGB(255, 79, 210, 84),
                          fontColor: Colors.black,
                          onTap: _navigateToBarangKeluar,
                        ),
                        _cardMenu(
                          title: 'Info',
                          icon: '../asset/images/info1.png',
                          color: const Color.fromARGB(255, 79, 210, 84),
                          fontColor: Colors.black,
                          onTap: _navigateToInfo,
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            // Tambahkan aksi yang ingin dilakukan saat ikon kembali diklik
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        IconButton(
                          onPressed: () {
                            // Tambahkan aksi yang ingin dilakukan saat ikon kembali ke beranda diklik
                          },
                          icon: const Icon(Icons.home),
                        ),
                        IconButton(
                          onPressed: () {
                            // Tambahkan aksi yang ingin dilakukan saat ikon menu diklik
                          },
                          icon: const Icon(Icons.menu),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 146,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: color,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Pusatkan konten di dalam kolom
          children: [
            SizedBox(
              height: 100, // Atur tinggi gambar sesuai kebutuhan
              child: Image.asset(icon),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: fontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
