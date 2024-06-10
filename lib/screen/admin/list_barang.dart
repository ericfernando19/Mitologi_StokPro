import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_barang/model/barang.dart';
import 'package:stok_barang/screen/admin/add_update_barang.dart';

import '../../config/asset.dart';
import '../../event/event_db.dart';

class ListBarang extends StatefulWidget {
  const ListBarang({super.key});

  @override
  State<ListBarang> createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  List<Barang> _listBarang = [];

  void getBarang() async {
    _listBarang = await EventDb.getBarang();
    print("Data barang: $_listBarang"); // Debug log untuk memeriksa data

    setState(() {});
  }

  @override
  void initState() {
    getBarang();
    super.initState();
  }

  void showOption(Barang? barang) async {
    var result = await Get.dialog(
        SimpleDialog(
          children: [
            ListTile(
              onTap: () => Get.back(result: 'update'),
              title: Text('Update'),
            ),
            ListTile(
              onTap: () => Get.back(result: 'delete'),
              title: Text('Delete'),
            ),
            ListTile(
              onTap: () => Get.back(),
              title: Text('Close'),
            )
          ],
        ),
        barrierDismissible: false);
    switch (result) {
      case 'update':
        Get.to(AddUpdateBarang(barang: barang))?.then((value) => getBarang());
        break;
      case 'delete':
        EventDb.deleteBarang(barang!.idbarang!).then((value) => getBarang());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Barang"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          _listBarang.length > 0
              ? ListView.builder(
                  itemCount: _listBarang.length,
                  itemBuilder: (context, index) {
                    Barang barang = _listBarang[index];
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        leading: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          barang.namabarang ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Text(
                              'Id Barang: ${barang.idbarang ?? ''}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Deskripsi: ${barang.deskripsi ?? ''}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Stok: ${barang.stok ?? ''}',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.more_vert),
                          onPressed: () {
                            showOption(barang);
                          },
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "Data Kosong",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddUpdateBarang())?.then((value) => getBarang());
          // Aksi saat ikon tambah diklik
          // Misalnya, navigasi ke halaman tambah barang
        },
        child: Icon(Icons.add),
        backgroundColor: Asset.colorPrimary,
      ),
    );
  }
}
