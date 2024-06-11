import 'package:flutter/material.dart';

class BarangKeluar extends StatefulWidget {
  @override
  _BarangKeluarState createState() => _BarangKeluarState();
}

class _BarangKeluarState extends State<BarangKeluar> {
  final _formKey = GlobalKey<FormState>();
  String _namaBarang = '';
  int _jumlahBarang = 0;
  String _tanggalKeluar = '';
  String _keterangan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang Keluar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter nama barang';
                  }
                  return null;
                },
                onSaved: (value) => _namaBarang = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Jumlah Barang',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter jumlah barang';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Jumlah barang harus berupa angka';
                  }
                  return null;
                },
                onSaved: (value) => _jumlahBarang = int.parse(value!),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Tanggal Keluar',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter tanggal keluar';
                  }
                  return null;
                },
                onSaved: (value) => _tanggalKeluar = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Keterangan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter keterangan';
                  }
                  return null;
                },
                onSaved: (value) => _keterangan = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Simpan data barang keluar ke database atau API
                    print('Nama Barang: $_namaBarang');
                    print('Jumlah Barang: $_jumlahBarang');
                    print('Tanggal Keluar: $_tanggalKeluar');
                    print('Keterangan: $_keterangan');
                  }
                },
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
