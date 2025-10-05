import 'dart:io';

void main() {
  // == Daftar Menu Solaria ==
  List<String> menuMakanan = [
    "Nasi Goreng Spesial",
    "Mie Goreng Ayam",
    "Kwetiau Sapi",
    "Ayam Teriyaki",
    "Sapo Tahu Seafood",
    "Nasi + Ayam Mentega",
    "Spaghetti Bolognaise"
  ];
  List<int> hargaMakanan = [35000, 30000, 40000, 45000, 50000, 42000, 26000];

  List<String> menuMinuman = [
    "Es Teh Manis",
    "Teh Panas",
    "Jus Alpukat",
    "Jus Mangga",
    "Lemon Tea",
    "Air Mineral"
  ];
  List<int> hargaMinuman = [7000, 6000, 15000, 14000, 12000, 5000];

  bool lanjut = true;

  while (lanjut) {
    List<String> pesanan = [];
    int total = 0;

    print("== SELAMAT DATANG DI RESTORAN SOLA dan RIA ==");

    // === PILIH MAKANAN ===
    print("\n--- Menu Makanan ---");
    for (int i = 0; i < menuMakanan.length; i++) {
      print("${i + 1}. ${menuMakanan[i]} - Rp${hargaMakanan[i]}");
    }

    stdout.write(
        "\nMasukkan nomor makanan (pisahkan dengan koma/spasi), atau ketik 'selesai' jika tidak ingin pesan lagi: ");
    String? inputMakanan = stdin.readLineSync();

    if (inputMakanan != null && inputMakanan.toLowerCase() != 'selesai') {
      // Pisahkan input dengan koma atau spasi
      List<String> pilihan = inputMakanan.split(RegExp(r'[,\s]+'));
      for (var p in pilihan) {
        int? nomor = int.tryParse(p);
        if (nomor != null && nomor > 0 && nomor <= menuMakanan.length) {
          pesanan.add(menuMakanan[nomor - 1]);
          total += hargaMakanan[nomor - 1];
        }
      }
    }

    // === PILIH MINUMAN ===
    print("\n--- Menu Minuman ---");
    for (int i = 0; i < menuMinuman.length; i++) {
      print("${i + 1}. ${menuMinuman[i]} - Rp${hargaMinuman[i]}");
    }

    stdout.write(
        "\nMasukkan nomor minuman (pisahkan dengan koma/spasi), atau ketik 'selesai' jika tidak ingin pesan lagi : ");
    String? inputMinuman = stdin.readLineSync();

    if (inputMinuman != null && inputMinuman.toLowerCase() != 'selesai') {
      List<String> pilihan = inputMinuman.split(RegExp(r'[,\s]+'));
      for (var p in pilihan) {
        int? nomor = int.tryParse(p);
        if (nomor != null && nomor > 0 && nomor <= menuMinuman.length) {
          pesanan.add(menuMinuman[nomor - 1]);
          total += hargaMinuman[nomor - 1];
        }
      }
    }

    // === RINGKASAN PESANAN ===
    if (pesanan.isEmpty) {
      print("\nAnda tidak memesan apapun.");
    } else {
      print("\n=== PESANAN ANDA ===");
      for (var item in pesanan) {
        int harga = 0;
        if (menuMakanan.contains(item)) {
          harga = hargaMakanan[menuMakanan.indexOf(item)];
        } else if (menuMinuman.contains(item)) {
          harga = hargaMinuman[menuMinuman.indexOf(item)];
        }
        print("- $item (Rp$harga)");
      }
      print("Total harga: Rp$total");

      // === PEMBAYARAN ===
      while (true) {
        stdout.write("Masukkan jumlah uang pembayaran: Rp");
        String? inputBayar = stdin.readLineSync();
        int? bayar = int.tryParse(inputBayar ?? "0");

        if (bayar != null && bayar >= total) {
          print("Terima kasih,Pembayarannya berhasil ini Kembalian Anda: Rp${bayar - total}");
          break;
        } else {
          print("Uang tidak cukup, tolong tambahkan uangmu!");
        }
      }
    }

    // === KONFIRMASI PESAN LAGI ===
    stdout.write("\nApakah ingin pesan lagi? (iya/tidak): ");
    String? jawab = stdin.readLineSync();
    if (jawab == null || jawab.toLowerCase() != 'iya') {
      lanjut = false;
      print("Terima kasih telah berkunjung ke Restoran Sola dan ria!");
    }
  }
}