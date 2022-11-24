import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/watchlist.dart';
import 'package:counter_7/page/data.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/model/watchlist_model.dart';

class MyDetailPage extends StatelessWidget {
  final String title;
  final bool watched;
  final int rating;
  final String releaseDate;
  final String review;
  const MyDetailPage(
      {Key? key,
      required this.title,
      required this.watched,
      required this.rating,
      required this.releaseDate,
      required this.review})
      : super(key: key);
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        drawer: Drawer(
          child: Column(
            children: [
              // Menambahkan clickable menu
              ListTile(
                title: const Text('counter_7'),
                onTap: () {
                  // Route menu ke halaman utama
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Tambah Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFormPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('Data Budget'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyDataPage()),
                  );
                },
              ),
              ListTile(
                title: const Text('My Watchlist'),
                onTap: () {
                  // Route menu ke halaman form
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWatchlistPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                    child: Text(
                  title,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ))),
            Padding(
              // Menggunakan padding sebesar 8 pixels
              padding: const EdgeInsets.only(top: 30),
              child: RichText(
                text: TextSpan(
                  // Note: Styles for TextSpans must be explicitly defined.
                  // Child text spans will inherit styles from parent
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Release Date: ',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: releaseDate),
                  ],
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Rating: ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: rating.toString()),
                  TextSpan(text: '/5'),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Status: ',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  if (watched)
                    const TextSpan(text: "watched")
                  else
                    const TextSpan(text: "not watched yet"),
                ],
              ),
            ),
            Text(
              'Review: ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              review,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Padding(
              // Menggunakan padding sebesar 8 pixels
              padding: const EdgeInsets.only(top: 300),
              child: TextButton(
                child: const Text(
                  "Back",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyWatchlistPage()),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
