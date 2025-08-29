import 'dart:io';

void main() {
  print("=== PROGRAM HITUNG GAJI ===");
  
  // Input data
  stdout.write("Masukkan Nama : ");
  String? nama = stdin.readLineSync();
  
  // Input jam kerja
  int jamKerja;
  while (true) {
    stdout.write("Jam kerja per minggu : ");
    String? input = stdin.readLineSync();
    try {
      jamKerja = int.parse(input!);
      if (jamKerja > 0) break;
      print("Jam kerja harus lebih dari 0");
    } catch (e) {
      print("Input harus angka");
    }
  }
  
  // Input upah per jam
  double upah;
  while (true) {
    stdout.write("Upah per jam : ");
    String? input = stdin.readLineSync();
    try {
      upah = double.parse(input!);
      if (upah > 0) break;
      print("Upah harus lebih dari 0");
    } catch (e) {
      print("Input harus angka");
    }
  }
  
  // Input status
  bool isTetap;
  while (true) {
    stdout.write("Status karyawan (tetap/kontrak) : ");
    String? status = stdin.readLineSync()?.toLowerCase();
    if (status == "tetap") {
      isTetap = true;
      break;
    } else if (status == "kontrak") {
      isTetap = false;
      break;
    } else {
      print("Pilih 'tetap' atau 'kontrak'");
    }
  }
  
  // Hitung gaji
  double gajiKotor = jamKerja * upah;
  double pajak = isTetap ? gajiKotor * 0.10 : gajiKotor * 0.05;
  double gajiBersih = gajiKotor - pajak;
  
  // Tampilkan hasil
  print("\n--- SLIP GAJI ---");
  print("Nama: $nama");
  print("Jam kerja: $jamKerja jam/minggu");
  print("Upah per jam: Rp${upah.toStringAsFixed(0)}");
  print("Status: ${isTetap ? 'Tetap' : 'Kontrak'}");
  print("Gaji Kotor: Rp${gajiKotor.toStringAsFixed(0)}");
  print("Pajak (${isTetap ? '10%' : '5%'}): Rp${pajak.toStringAsFixed(0)}"); // PASTIKAN BARIS INI ADA
  print("Gaji Bersih: Rp${gajiBersih.toStringAsFixed(0)}");
  print("------------------");
}