import 'dart:convert';
import 'package:http/http.dart' as http;

class UpdatesInfo {
  final String? source;
  final String? title;
  final String? description;
  final String? url;
  final String? img;

  UpdatesInfo(
    this.source,
    this.title,
    this.description,
    this.url,
    this.img,
  );
}

class UpdatesModelApi {
  Future getUpdates() async {
    var url =
        'https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=4772cb16f4b34f5fa2039b61f30774f6';
    var responce = await http.get(Uri.parse(url));
    var json = jsonDecode(responce.body);
    var jsonUpdatesData = json['articles'];

    List<UpdatesInfo> matches = [];
    for (Map x in jsonUpdatesData) {
      UpdatesInfo match = UpdatesInfo(
        x['source']['name'] ?? "-",
        x['title'] ?? '-',
        x['description'] ?? "-",
        x['url'],
        x['urlToImage'] ??
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDVPuMlKfGrFErmCt6hCuECLbbhekJF-GCtAJvPIZpHX5upTT-hABFlp8qZY8rkgaZ0DE&usqp=CAU',
        //   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNGw4f33nBFZ0aVWgfmhFrvck9qOrFUwkM72uA6ehmsnqrHr8RxYMcEUum6KXQgWdZwyQ&usqp=CAU',
        //   'https://www.signfix.com.au/wp-content/uploads/2017/09/placeholder-600x400.png',
        //    'https://www.motorworldindia.com/wp-content/uploads/revslider/home5/placeholder-1200x500.png',
        //  'https://static.vecteezy.com/system/resources/thumbnails/004/141/669/small/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
      );
      matches.add(match);
    }
    return matches;
  }
}
