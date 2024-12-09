import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final User? user;

  HomePage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menentukan ucapan berdasarkan waktu saat ini
    String greeting = "";
    final hour = DateTime.now().hour;

    if (hour < 12) {
      greeting = "Selamat Pagi";
    } else if (hour < 15) {
      greeting = "Selamat Siang";
    } else if (hour < 18) {
      greeting = "Selamat Sore";
    } else {
      greeting = "Selamat Malam";
    }

    // Menampilkan email pengguna yang sedang login
    final String email = user?.email ?? "Email Tidak Ditemukan";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.home, size: 28),
            SizedBox(width: 10),
            Text('$greeting, $email'), // Menampilkan email di navbar
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Halo $email, Selamat Datang di Aplikasi Digital Bank!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
