import 'dart:convert';
import 'package:http/http.dart' as http;

class FixturesInfo {
  final String? matchTitle, venue, matchType, team1, team2;
  final String? status;
  final String? dateTimeGMT;

  FixturesInfo(
    this.matchTitle,
    this.matchType,
    this.venue,
    this.team1,
    this.team2,
    this.status,
    this.dateTimeGMT,
  );
}

class FixturesModelApi {
  Future getFixtures() async {
    var url =
        'https://api.cricapi.com/v1/matches?apikey= enter your API key here';
    var responce = await http.get(Uri.parse(url));
    var json = jsonDecode(responce.body);
    var jsonFixturesData = json['data'];

    List<FixturesInfo> matches = [];
    for (Map x in jsonFixturesData) {
      FixturesInfo match = FixturesInfo(
        x['name'] ?? '-',
        x['matchType'] ?? '-',
        x['venue'] ?? '-',
        x['teams'][0] ?? '-',
        x['teams'][1] ?? '-',
        x['status'] ?? '-',
        x['dateTimeGMT'] ?? '-',
      );
      matches.add(match);
    }
    return matches;
  }
}
