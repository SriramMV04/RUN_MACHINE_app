import 'dart:convert';
import 'package:http/http.dart' as http;

class MatchInfo {
  final String matchTitle, venue, team1, team2, flag1, flag2;
  final dynamic run1, wicket1, overs1;
  final dynamic run2, wicket2, overs2;
  final String status;

  MatchInfo(
    this.matchTitle,
    this.venue,
    this.team1,
    this.team2,
    this.flag1,
    this.flag2,
    this.run1,
    this.wicket1,
    this.overs1,
    this.run2,
    this.wicket2,
    this.overs2,
    this.status,
  );
}

class LiveScoreModelApi {
  Future getLiveScore() async {
    var url =
        'https://api.cricapi.com/v1/currentMatches?apikey= enter your API key here';
    var responce = await http.get(Uri.parse(url));
    var json = jsonDecode(responce.body);
    var jsonMatchData = json['data'];

    List<MatchInfo> matches = [];
    for (var x in jsonMatchData) {
      MatchInfo match = MatchInfo(
        x['name'] ?? 'TBA',
        x['venue'] ?? 'TBA',
        x['teamInfo'][0]['shortname'] ?? 'TBA',
        x['teamInfo'][1]['shortname'] ?? 'TBA',
        x['teamInfo'][0]['img'] ??
            'https://www.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584341.jpg',
        x['teamInfo'][1]['img'] ??
            'https://www.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584341.jpg',
        x['score'].length > 0 ? x['score'][0]['r'] : '0',
        x['score'].length > 0 ? x['score'][0]['w'] : '0',
        x['score'].length > 0 ? x['score'][0]['o'] : '0',
        x['score'].length > 1 ? x['score'][1]['r'] : '0',
        x['score'].length > 1 ? x['score'][1]['w'] : '0',
        x['score'].length > 1 ? x['score'][1]['o'] : '0',
        x['status'],
      );
      matches.add(match);
    }
    return matches;
  }
}
