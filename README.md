## Tugas 7
###Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.
Stateless widget adalah widget yang tidak dapat diubah. Stateless widget akan memiliki tampilan yang selalu sama selama aplikasi dijalankan. Sementara itu, stateful widget merupakan widget dinamis yang tampilannya dapat berubah-ubah berdasarkan user actions atau ketika terjadi perubahan data selama aplikasi dijalankan. Stateful widget perlu di-build ulang untuk menampilkan perubahan yang terjadi, sementara itu stateless widget tidak membutuhkan build ulang.

###Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
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

###Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi setState(0 berfungsi untuk memberitahu widget bahwa ada perubahan yang terjadi pada stateful widget sehingga akan dilakukan build ulang pada widget tersebut agar perubahan dapat ditampilkan. Variabel yang akan di-build ulang adalah variabel-variabel yang diubah di dalam fungsi setState().

###Jelaskan perbedaan antara const dengan final.
final digunakan untuk mendeklarasikan variabel immutable (nilainya tidak nisa diubah setelah diinisiasi) yang nilainya belum ataupun sudah diketahui ketika program di-compile. Sementara itu, const digunakan untuk mendeklarasikan variabel immutable yang nilainya berupa konstan dan harus sudah diketahui ketika program di-compile. Apabila nilainya belum diketahui ketika program di-compile, maka akan terjadi error.

###Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
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
