## Tugas 7
### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak dapat diubah. Stateless widget akan memiliki tampilan yang selalu sama selama aplikasi dijalankan. Sementara itu, stateful widget merupakan widget dinamis yang tampilannya dapat berubah-ubah berdasarkan user actions atau ketika terjadi perubahan data selama aplikasi dijalankan. Stateful widget perlu di-build ulang untuk menampilkan perubahan yang terjadi, sementara itu stateless widget tidak membutuhkan build ulang.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. Scaffold -> widget untuk membuat sebuah halaman pada flutter
2. Row -> untuk menampilkan widget-widget secara horizontal
3. Center -> untuk menampilkan widget-widget secara vertikal
4. Center -> untuk memposisikan widget yang dibuat agar berada di tengah
5. Text -> untuk menampilkan teks
6. Icon -> untuk menggunakan icon yang telah disediakan flutter
7. Container -> untuk membungkus widget lain agar dapat diberikan padding, margin, background, ataupun dekorasi lain
8. FloatingActionButton -> untuk menampilkan button yang menempel pada layar
9. Padding -> untuk menambahkan padding 
10. Expanded -> untuk mengisi space yang tersedia dari row, column, atau flex parent-nya

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi setState(0 berfungsi untuk memberitahu widget bahwa ada perubahan yang terjadi pada stateful widget sehingga akan dilakukan build ulang pada widget tersebut agar perubahan dapat ditampilkan. Variabel yang akan di-build ulang adalah variabel-variabel yang diubah di dalam fungsi setState().

### Jelaskan perbedaan antara const dengan final.
final digunakan untuk mendeklarasikan variabel immutable (nilainya tidak nisa diubah setelah diinisiasi) yang nilainya belum ataupun sudah diketahui ketika program di-compile. Sementara itu, const digunakan untuk mendeklarasikan variabel immutable yang nilainya berupa konstan dan harus sudah diketahui ketika program di-compile. Apabila nilainya belum diketahui ketika program di-compile, maka akan terjadi error.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat program baru bernama counter_7
2. Membuat fungsi _decrementCounter() untuk melakukan pengurangan pada counter ketike tombol "-" ditekan.
3. Menambahkan teks "GANJIL" dan "GENAP" sesuai dengan angka pada counter dengan menambahkan potongan kode berikut.
```
if (_counter % 2 == 0)
                 const Text(
                    'GENAP',
                    style: TextStyle(color: Colors.red),
                 )
            else
                const Text(
                    'GANJIL',
                    style: TextStyle(color: Colors.blue),
                ),
```
4. Menambahkan tombol "-" dan block if sehingga tombol "-" tidak muncul ketika counter bernilai 0 dengan menambahkan potongan kode berikut
```
child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                if (_counter > 0) FloatingActionButton(
                    onPressed: _decrementCounter,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                ), // This trailing comma makes auto-formatting nicer for build methods.
                Expanded(child:Container()),
                FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                ), // This trailing comma makes auto-formatting nicer for build methods.
            ]
        ),
```
5. Menambahkan padding agar tampilan tombol lebih rapih.

## Tugas 8
### Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement
`Navigator.push` akan menambahkan rute lain ke atas tumpukan halaman (stack) yang ada sehingga halaman baru akan ditampilkan di atas halaman sebelumnya.
Sementara itu, `Navigator.pushReplacement` akan mengganti rute navigator saat ini dengan rute baru. Setelah halaman baru selesai ditampilkan, maka rute navigator sebelumnya akan dibuang.
### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `Drawer` -> widget navigasi yang dapat digeser/disembunyikan ke sisi kiri layar
2. `ListTile` -> widget yang biasanya diisi oleh beberapa teks, leading, dan trailing icons
3. `Form` -> widget container yang memungkinkan kita untuk mengelompokkan beberapa form field
4. `TextFormField` -> widget untuk menerima input berupa text
5. `DropDownButton` -> widget untuk menampilkan dropdown
6. `TextButton` -> widget untuk menampilkan tombol berisi teks yang secara default tidak memiliki border
###  Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
1. `onTap`
2. `onPressed`
3. `onChanged`
4. `onSaved`
### Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
Navigator akan menumpuk halaman-halaman seperti elemen-elemen di dalam stack. Saat halaman diganti dengan `Navigator.push`, maka halaman baru akan diletakkan di top of stack. Jika halaman diganti dengan `Navigator.pushReplacement`, maka halaman yang baru akan diletakkan pada posisi halaman saat ini (halaman saat ini akan dihapus dari stack). Sementara itu, jika dilakukan pemanggilan `Navigator.pop` maka halaman saat ini akan dihapus dari stack dan halaman sebelumnya akan ditampilkan.
### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat file form.dart dan data.dart.
2. Membuat drawer di masing-masing page untuk menavigasi ke halaman lain.
3. Menambahkan dua widget `TextFormField`, satu widget `DropDownButton`, dan satu widget `TextButton` pada form.dart untuk menerima dan menyimpan input.
4. Membuat class `Budget` dan List `listBudget` untuk menyimpan data yang diinput dalam bentuk instance dari class `Budget`.
5. Menggunakan widget `ListView` untuk menampilkan semua data yang telah diinput ke halaman `data.dart`.

## Tugas 9
###  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Bisa. Hal tersebut dapat dilakukan dengan cara manual decoding yang memanfaatkan built-in JSON decoder pada `dart:convert`. JSON string akan di-pass ke fungsi jsonDecode() untuk menghasilkan Map<String, dynamic>.
Namun, manual decoding tidak direkomendasikan untuk projek yang besar karena akan sulit untuk dilakukan dan di-maintain serta lebih rentan terjadi error.

### Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
1. `TextSpan` -> widget yang mendeskripsikan teks yang berada dalam satu paragraf yang dapat ditambahkan _style_ berbeda untuk tiap bagian pada paragraf tersebut.
2. `RichText` -> widget yang dapat menampilkan teks dengan beberapa  _style_ yang berbeda.
3. `FutureBuilder` -> widget yang digunakan untuk membuat widget berdasarkan snapshot terbaru dari interaksi dengan Future.

### Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
1. Menambahkan dependensi HTTP dengan cara melakukan perintah `flutter pub http` pada terminal proyek Flutter serta menambahkan 
potongan kode `<uses-permission android:name="android.permission.INTERNET" />` pada file `android/app/src/main/AndroidManifest.xml`. 
2. Membuat model dengan memanfaatkan website Quicktype dan disimpan pada file `watchlist_model.dart`.
3. Data diambil dengan menggunakan method `http.get`.
4. Objek yang didapatkan dikonversi menjadi model yang telah dibuat.
5. Data ditampilkan menggunakan `FutureBuilder`.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1.  Membuat model dari watchlist yang ada pada endpoint JSON pada aplikasi Django yang sudah pernah dibuat dengan memanfaatkan website QuickType.
2.  Membuat halaman watchlist dan menambahkan drawer.
3.  Membuat halaman detail untuk menampilkan detail dari setiap film.
4.  Menambahkan tombol kembali pada halaman detail.
