import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stok_barang/model/barang.dart';
import 'package:stok_barang/widget/info.dart';

import '../config/api.dart';

class EventDb {
  static Future<List<Barang>> getBarang() async {
    List<Barang> listBarang = [];

    try {
      var response = await http.get(Uri.parse(Api.getBarang));
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var barang = responBody['barang'];

          barang.forEach((barang) {
            listBarang.add(Barang.fromJson(barang));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listBarang;
  }

  static Future<String> AddBarang(
      String idbarang, String namabarang, String deskripsi, String stok) async {
    String reason;
    try {
      var response = await http.post(Uri.parse(Api.addBarang), body: {
        'text_idbarang': idbarang,
        'text_namabarang': namabarang,
        'text_deskripsi': deskripsi,
        'text_stok': stok,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Barang Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }
    return reason;
  }

  static Future<void> UpdateBarang(
      String idbarang, String namabarang, String deskripsi, String stok) async {
    try {
      var response = await http.post(Uri.parse(Api.updateBarang), body: {
        'text_idbarang': idbarang,
        'text_namabarang': namabarang,
        'text_deskripsi': deskripsi,
        'text_stok': stok,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          info.snackbar('Berhasil Update Barang');
        } else {
          info.snackbar('Gagal Update Barang');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteBarang(String idbarang) async {
    try {
      var response = await http.post(Uri.parse(Api.deleteBarang), body: {
        'text_idbarang': idbarang,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          info.snackbar('Berhasil Delete Barang');
        } else {
          info.snackbar('Gagal Delete Barang');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
