import 'package:flutter/material.dart';
import 'package:database_sqlite/models/item.dart';

class EntryForm extends StatefulWidget {
  final Item? item;
  const EntryForm(this.item, {super.key});
  @override
  EntryFormState createState() => EntryFormState(item);
}

//class controller
class EntryFormState extends State<EntryForm> {
  Item? item;

  EntryFormState(this.item);
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController stokController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    nameController.text = item?.name ?? '';
    priceController.text = (item?.price ?? 0).toString();
    stokController.text = (item?.stok ?? 0).toString();

    //rubah
    return Scaffold(
      appBar: AppBar(
        title: item == null ? const Text('Tambah') : const Text('Ubah'),
        leading: const Icon(Icons.keyboard_arrow_left),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            // nama
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // harga
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Harga',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: TextField(
                controller: stokController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Stok',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {
                  //
                },
              ),
            ),
            // tombol button
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  // tombol simpan
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue, // Warna teks
                        //color: Theme.of(context).primaryColorDark,
                        //textColor: Theme.of(context).primaryColorLight,
                      ),
                      child: const Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (item == null) {
                          // tambah data
                          item = Item(
                              nameController.text, int.parse(priceController.text), int.parse(stokController.text));
                        } else {
                          // ubah data
                          item!.name = nameController.text;
                          item!.price = int.parse(priceController.text);
                        }
                        // kembali ke layar sebelumnya dengan membawa objek item
                        Navigator.pop(context, item);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  // tombol batal
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue, // Warna teks
                        //color: Theme.of(context).primaryColorDark,
                        //textColor: Theme.of(context).primaryColorLight,
                      ),
                      child: const Text(
                        'Cancel',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
