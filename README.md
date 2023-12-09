# books

## Praktikum 1: Mengunduh Data dari Web Service (API)

Langkah 1 - 5 dan soal 1 - 2 terdapat pada GIF
![Hasil](images/praktikum_1.gif)

<b>Tentang Soal 3</b>
Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError!
- Substring:
result = value.body.toString().substring(0, 450);
Dalam baris ini, nilai body dari objek yang dikembalikan oleh fungsi getData diubah menjadi string (toString()), dan kemudian diambil sebagian dengan menggunakan metode substring(0, 450). Artinya, hanya sebagian pertama dari string (mulai dari indeks 0 hingga indeks 449) yang disimpan dalam variabel result.
Misalnya, jika value.body adalah string panjangnya 1000 karakter, maka result akan berisi 450 karakter pertama dari string tersebut.

- catchError:
}).catchError((_){
  result = 'An error occurred';
  setState(() {});
});
Bagian ini menggunakan metode catchError untuk menangkap dan menangani kesalahan yang mungkin terjadi saat eksekusi fungsi getData. Jika ada kesalahan, blok kode di dalamnya akan dieksekusi. Dalam hal ini, jika terjadi kesalahan, variabel result diatur menjadi string "An error occurred", dan kemudian setState dipanggil. setState digunakan untuk memberi tahu Flutter bahwa ada perubahan dalam state yang memerlukan pembaruan tampilan.
Parameter _ digunakan sebagai variabel yang mewakili objek kesalahan yang ditangkap.

