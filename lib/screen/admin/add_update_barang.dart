import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stok_barang/model/barang.dart';
import 'package:stok_barang/screen/admin/list_barang.dart';
import 'package:stok_barang/widget/info.dart';

import '../../config/asset.dart';
import '../../event/event_db.dart';

class AddUpdateBarang extends StatefulWidget {
  Barang? barang;
  AddUpdateBarang({this.barang});

  @override
  State<AddUpdateBarang> createState() => _AddUpdateBarangState();
}

class _AddUpdateBarangState extends State<AddUpdateBarang> {
  var _formKey = GlobalKey<FormState>();
  var _controllerIdBarang = TextEditingController();
  var _controllerNamaBarang = TextEditingController();
  var _controllerDeskripsi = TextEditingController();
  var _controllerStok = TextEditingController();

  bool _isHidden = true;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.barang != null) {
      _controllerIdBarang.text = widget.barang!.idbarang!;
      _controllerNamaBarang.text = widget.barang!.namabarang!;
      _controllerDeskripsi.text = widget.barang!.deskripsi!;
      _controllerStok.text = widget.barang!.stok!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.barang != null
            ? Text('Update Barang')
            : Text('Tambah Barang'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.barang == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerIdBarang,
                  decoration: InputDecoration(
                      labelText: "Id Barang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNamaBarang,
                  decoration: InputDecoration(
                      labelText: "Nama Barang",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerDeskripsi,
                  decoration: InputDecoration(
                      labelText: "Deskripsi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerStok,
                  decoration: InputDecoration(
                      labelText: "Stok",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.barang == null) {
                        String message = await EventDb.AddBarang(
                          _controllerIdBarang.text,
                          _controllerNamaBarang.text,
                          _controllerDeskripsi.text,
                          _controllerStok.text,
                        );
                        info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerIdBarang.clear();
                          _controllerNamaBarang.clear();
                          _controllerDeskripsi.clear();
                          _controllerStok.clear();
                          Get.off(
                            ListBarang(),
                          );
                        }
                      } else {
                        EventDb.UpdateBarang(
                          _controllerIdBarang.text,
                          _controllerNamaBarang.text,
                          _controllerDeskripsi.text,
                          _controllerStok.text,
                        );
                        Get.off(
                          ListBarang(),
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.barang == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Mengatur warna teks menjadi putih
                      fontWeight: FontWeight
                          .w500, // Mengatur ketebalan teks menjadi sedikit tebal
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
