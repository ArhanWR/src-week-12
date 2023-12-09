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

## Praktikum 2: Menggunakan await/async untuk menghindari callbacks

Langkah 1 - 4 terdapat pada GIF

![Hasil](images/praktikum_2.gif)

Soal 4
Jelaskan maksud kode langkah 1 dan 2 tersebut!
- Langkah 1:
Pada langkah ini, menambahkan tiga metode asinkron (returnOneAsync, returnTwoAsync, dan returnThreeAsync) di dalam kelas _FuturePageState. Setiap metode ini menggunakan kata kunci async dan mengembalikan sebuah objek Future<int>. Masing-masing metode ini memiliki tugas yang mirip, yaitu menunda eksekusi selama 3 detik (menggunakan await Future.delayed(const Duration(seconds: 3));) dan kemudian mengembalikan nilai integer yang berbeda (1, 2, atau 3).

Ini memberikan ilustrasi sederhana dari bagaimana fungsi asinkron dapat digunakan untuk menangani operasi yang memerlukan waktu, seperti penundaan (delay) dalam contoh ini.

- Langkah 2:
Pada langkah ini, menambahkan metode count di bawah ketiga metode asinkron sebelumnya. Metode count ini juga menggunakan kata kunci async karena mengandung operasi asinkron di dalamnya.

Dalam metode count, terdapat variabel lokal total yang diinisialisasi dengan nilai 0. Selanjutnya, metode ini menggunakan await untuk memanggil ketiga metode asinkron sebelumnya (returnOneAsync, returnTwoAsync, dan returnThreeAsync) secara berurutan. Setelah masing-masing operasi asinkron selesai, nilai yang dikembalikan dari setiap metode ditambahkan ke variabel total.

Setelah itu, nilai total diubah menjadi string dan disimpan dalam variabel result. Akhirnya, setState dipanggil untuk memberi tahu Flutter bahwa terjadi perubahan dalam state dan tampilan perlu diperbarui.

Dengan cara ini, menggambarkan penggunaan fungsi asinkron dan penggunaan await untuk menangani tugas yang memerlukan waktu dalam lingkungan Flutter.

