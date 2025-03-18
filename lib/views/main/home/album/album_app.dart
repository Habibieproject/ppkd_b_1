import 'package:flutter/material.dart';
import 'package:ppkd_b_1/api/album/fetch_album/fetch.dart';
import 'package:ppkd_b_1/api/album/model/album.dart';
import 'package:ppkd_b_1/utils/constant/app_color.dart';

class AlbumAppScreen extends StatefulWidget {
  const AlbumAppScreen({super.key});

  @override
  State<AlbumAppScreen> createState() => _AlbumAppScreenState();
}

class _AlbumAppScreenState extends State<AlbumAppScreen> {
  late Future<AlbumResponse> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetch Data Example',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.secondaryColor,
      ),
      body: FutureBuilder<AlbumResponse>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            AlbumResponse? value = snapshot.data;
            return Text(value?.title ?? "", style: TextStyle(fontSize: 40));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
