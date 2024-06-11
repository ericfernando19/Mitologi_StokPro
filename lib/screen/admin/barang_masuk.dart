import 'package:flutter/material.dart';

class BarangMasuk extends StatefulWidget {
  @override
  _BarangMasukState createState() => _BarangMasukState();
}

class _BarangMasukState extends State<BarangMasuk> {
  final _formKey = GlobalKey<FormState>();
  String _namaBarang = '';
  int _jumlahBarang = 0;
  String _tanggalMasuk = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang Masuk'),
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
                  labelText: 'Tanggal Masuk',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter tanggal masuk';
                  }
                  return null;
                },
                onSaved: (value) => _tanggalMasuk = value!,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Simpan data barang masuk ke database atau API
                    print('Nama Barang: $_namaBarang');
                    print('Jumlah Barang: $_jumlahBarang');
                    print('Tanggal Masuk: $_tanggalMasuk');
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
