import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_api/PremierLeagueModel.dart';
import 'package:url_launcher/url_launcher.dart'; // Tambahkan package url_launcher di pubspec.yaml


class DetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Team team = Get.arguments; // Menerima data dari navigasi

    // Fungsi untuk membuka URL
    void _launchURL(String url) async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        print("Could not launch 'https://$url' ");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(team.strTeam),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stadium: ${team.strStadium}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Location: ${team.strLocation}',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 12),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              team.strDescriptionEn ?? "No description available",
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              'Follow Us:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                if (team.strFacebook != null && team.strFacebook!.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () => _launchURL(team.strFacebook!),
                  ),
                if (team.strInstagram != null && team.strInstagram!.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.camera_alt, color: Colors.purple),
                    onPressed: () => _launchURL(team.strInstagram!),
                  ),
                if (team.strYoutube != null && team.strYoutube!.isNotEmpty)
                  IconButton(
                    icon: Icon(Icons.video_library, color: Colors.red),
                    onPressed: () => _launchURL(team.strYoutube!),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
