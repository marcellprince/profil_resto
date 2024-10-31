import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};

  MainApp({super.key}) {
    biodata['name'] = 'Rm. Sedap Rasa';
    biodata['email'] = 'resto@sedaprasa.com';
    biodata['phone'] = '+62345678910';
    biodata['location'] = 'https://maps.google.com';
    biodata['image'] = 'rumah_makan.jpg';
    biodata['desc'] = 'Best place to enjoy a variety of delicious foods.';
    biodata['address'] = '123 Flavor Street, Culinary City';
    biodata['hours'] = 'Mon - Fri: 9 AM - 9 PM\nSat - Sun: 10 AM - 10 PM';
    biodata['menu'] =
        '1. Soto Ayam\n2. Nasi Goreng\n3. Mie Goreng\n4. Es Teh Manis';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Resto Profile",
      home: Scaffold(
        appBar: AppBar(
          title: Text(biodata['name'] ?? 'Resto'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              teksKotak(Colors.black, biodata['name'] ?? ''),
              Image(image: AssetImage('assets/${biodata["image"] ?? ''}')),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  btnContact(Icons.email, Colors.green[900],
                      "mailto:${biodata['email']}"),
                  btnContact(
                      Icons.map, Colors.blueAccent, biodata['location']!),
                  btnContact(Icons.phone, Colors.deepPurple,
                      "tel:${biodata['phone']}"),
                ],
              ),
              SizedBox(height: 20),
              teksKotak(Colors.black38, 'Deskripsi'),
              Text(
                biodata['desc'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              teksKotak(Colors.black38, 'List Menu'),
              Container(
                alignment: Alignment.centerLeft, // Align menu list to the left
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  biodata['menu'] ?? '',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 20),
              teksKotak(Colors.black38, 'Alamat'),
              Text(
                biodata['address'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              teksKotak(Colors.black38, 'Jam Buka'),
              Text(
                biodata['hours'] ?? '',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container teksKotak(Color bgColor, String teks) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor),
      child: Text(
        teks,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          launch(uri);
        },
        child: Icon(icon),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: EdgeInsets.all(16),
        ),
      ),
    );
  }

  Future<void> launch(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak dapat memanggil : $uri');
    }
  }
}
