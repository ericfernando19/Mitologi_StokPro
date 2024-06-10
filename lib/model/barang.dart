class Barang {
  String? idbarang;
  String? namabarang;
  String? deskripsi;
  String? stok;

  Barang({this.idbarang, this.namabarang, this.deskripsi, this.stok});

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        idbarang: json['idbarang'],
        namabarang: json['namabarang'],
        deskripsi: json['deskripsi'],
        stok: json['stok'],
      );

  Map<String, dynamic> toJson() => {
        'idbarang': this.idbarang,
        'namabarang': this.namabarang,
        'deskripsi': this.deskripsi,
        'stok': this.stok,
      };
}
