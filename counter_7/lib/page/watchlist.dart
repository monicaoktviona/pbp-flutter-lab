import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist_model.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({Key? key}) : super(key: key);

  @override
  _MyWatchlistPageState createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  Future<List<Watchlist>> fetchToDo() async {
    var url = Uri.parse('https://pbp-katalog.herokuapp.com/mywatchlist/json');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object ToDo
    List<Watchlist> listWatchlist = [];
    for (var d in data) {
      if (d != null) {
        listWatchlist.add(Watchlist.fromJson(d));
      }
    }

    return listWatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watch List'),
        ),
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
        body: FutureBuilder(
            future: fetchToDo(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada to do list :(",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                      "${snapshot.data![index].fields.title}"),
                                ),
                                onTap: () {
                                  // Route menu ke halaman form
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyDetailPage(
                                              title: snapshot
                                                  .data![index].fields.title,
                                              watched: snapshot
                                                  .data![index].fields.watched,
                                              rating: snapshot
                                                  .data![index].fields.rating,
                                              releaseDate: snapshot.data![index]
                                                  .fields.releaseDate,
                                              review: snapshot
                                                  .data![index].fields.review,
                                            )),
                                  );
                                },
                              ),
                            ]));
                      });
                }
              }
            }));
  }
}
