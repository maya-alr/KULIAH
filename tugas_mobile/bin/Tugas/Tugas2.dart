import 'dart:io';

void main() {
  // Berikut ini Program Sistem Penilaian Mahasiswa dengan Conditional Statement

  // Meminta input skor dari user
  stdout.write("Masukkan skor Anda (0 - 100): ");
  String? input = stdin.readLineSync();

  // Konversi input ke integer
  int? skor = int.tryParse(input ?? "");

  // Validasi input
  if (skor == null || skor < 0 || skor > 100) {
    print("Error: Skor harus berupa angka antara 0 sampai 100.");
  } else {
    String grade;

    // Menentukan grade berdasarkan skor
    if (skor >= 85) {
      grade = "A";
    } else if (skor >= 70) {
      grade = "B";
    } else if (skor >= 60) {
      grade = "C";
    } else if (skor >= 50) {
      grade = "D";
    } else {
      grade = "E";
    }

    // Menampilkan hasil
    print("Skor Anda: $skor");
    print("Grade Anda: $grade");
  }
}