import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Praktikum',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: false,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stranger Things App'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.0),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'DESKRIPSI',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'EPISODE',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Stack(
            children: [
              Container(
                height: 225,
                color: Colors.red[900],
                alignment: Alignment.bottomCenter,
                child: Text(
                  '"EVERY ENDING HAS A BEGINNING"',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.rukita.co/stories/wp-content/uploads/2022/06/gal_6256e03c134302-21646502-74347358.jpg'),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Stranger Things adalah serial televisi fiksi ilmiah, Fantasi, Horor dari Amerika Serikat yang dibuat, ditulis, diarahkan, dan diproduksi oleh The Duffer Brothers.',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'BERITA',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://imgix.bustle.com/uploads/image/2017/10/18/410515ac-36a5-45fb-924e-ecc4b4f160b8-will-byers-stranger-things.jpg?w=1200&h=630&fit=crop&crop=faces&fm=jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Will akan menjadi pusat Stranger Things Season 5',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  )),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Jakarta September 7, 2023',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.theatlantic.com/thumbor/Ll-QTKiXVh_8Advzvaaixe1VEdE=/426x167:7076x3908/960x540/media/img/mt/2017/10/downloadAsset/original.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Judul Episode Pertama Stranger Things 5 Terkuak',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  )),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Jakarta September 2, 2023',
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
