class Api {
  static const _host = "http://192.168.3.198/api_stokbarang";

  static String _barang = "$_host/barang";

  // barang
  static String getBarang = "$_barang/view.php";
  static String addBarang = "$_barang/add.php";
  static String updateBarang = "$_barang/update.php";
  static String deleteBarang = "$_barang/delete.php";
}
