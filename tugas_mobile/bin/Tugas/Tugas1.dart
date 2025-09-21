import 'dart:io';

void main() {
  // Input data karyawan
  stdout.write("Masukkan nama karyawan: ");
  String nama = stdin.readLineSync()!;

  stdout.write("Masukkan jumlah jam kerja dalam seminggu: ");
  int jamKerja = int.parse(stdin.readLineSync()!);

  stdout.write("Masukkan upah per jam: ");
  double upahPerJam = double.parse(stdin.readLineSync()!);

  stdout.write("Apakah karyawan tetap? (true/false): ");
  bool statusTetap = stdin.readLineSync()!.toLowerCase() == "true";

  // Hitung gaji bersih langsung
  double gajiBersih;
  if (statusTetap) {
    gajiBersih = jamKerja * upahPerJam * 0.90; // potong 10% langsung
  } else {
    gajiBersih = jamKerja * upahPerJam * 0.95; // potong 5% langsung
  }

  // Output hasil
  print("\n===== Slip Gaji Karyawan =====");
  print("Nama Karyawan : $nama");
  print("Status        : ${statusTetap ? "Tetap" : "Kontrak"}");
  print("Gaji Bersih   : Rp ${gajiBersih.toStringAsFixed(2)}");
}