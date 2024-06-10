import 'package:get/get.dart';
import 'package:stok_barang/model/barang.dart';

class CBarang extends GetxController {
  Rx<Barang> _barang = Barang().obs;

  Barang get barang => _barang.value;

  void setBarang(Barang dataBarang) => _barang.value = dataBarang;
}
