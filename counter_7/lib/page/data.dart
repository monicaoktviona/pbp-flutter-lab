import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/watchlist.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyDataPage());

class MyDataPage extends StatelessWidget {
  const MyDataPage({Key? key}) : super(key: key);
// This widget is the root
// of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // home : new ListViewBuilder(),  NO Need To Use Unnecessary New Keyword
        home: const ListViewBuilder());
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Budget"),
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
                  MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
          itemCount: listBudget.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
              mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(listBudget[index].judulBudget),
                    ),
                    subtitle: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                          Text(listBudget[index].nominalBudget.toString()),
                          Expanded(child:Container()),
                          Text(listBudget[index].jenisBudget),

                        ],

                    )
                  ),
                ]
              )
            );
          }),
    );
  }
}