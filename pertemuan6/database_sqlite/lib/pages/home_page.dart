import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:database_sqlite/controllers/dbhelper.dart';
import 'package:database_sqlite/pages/entryform_page.dart';
import 'package:database_sqlite/models/item.dart';

//pendukung program asinkron
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item> itemList = [];

  @override
  void initState() {
    super.initState();
    updateListView();
  }

  @override
  Widget build(BuildContext context) {
    itemList ??= <Item>[];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
      ),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text("Tambah Item"),
              onPressed: () async {
                var item = await navigateToEntryForm(context, null);

                if (item == null) return;

                //TODO 2 Panggil Fungsi untuk Insert ke DB
                int result = await dbHelper.insert(item);
                if (result > 0) {
                  updateListView();
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Item?> navigateToEntryForm(BuildContext context, Item? item) async {
    var result = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
    }));

    return result;
  }

  ListView createListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.headlineSmall;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        final item = itemList[index];

        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              item.name,
              style: textStyle,
            ),
            subtitle: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.price.toString()),
                Text(item.stok.toString()),
              ],
            ),
            trailing: GestureDetector(
              child: const Icon(Icons.delete),
              onTap: () async {
                await dbHelper.delete(item.id);
                updateListView();
              },
            ),
            onTap: () async {
              var newItem = await navigateToEntryForm(context, item);
              if (newItem != null) {
                await dbHelper.update(newItem);
              }
              updateListView();
            },
          ),
        );
      },
    );
  }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          count = itemList.length;
        });
      });
    });
  }
}
