import 'package:app/home_page.dart';
import 'package:app/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/google_sign_in_provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              user.displayName!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              user.email!,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.network(
                  user.photoURL!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.red[900],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.mail_outline),
            title: const Text(
              'Feedback',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse('mailto:srirammv04@gmail.com'),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.man),
            title: const Text(
              'ICC Mens Team Ranking',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse(
                  'https://www.icc-cricket.com/rankings/mens/team-rankings/t20i'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.woman),
            title: const Text(
              'ICC Womens Team Ranking',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse(
                  'https://www.icc-cricket.com/rankings/womens/team-rankings/t20i'),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.male),
            title: const Text(
              'ICC Mens Player Ranking',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse(
                  'https://www.icc-cricket.com/rankings/mens/player-rankings/t20i'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.female),
            title: const Text(
              'ICC Womens Player Ranking',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse(
                  'https://www.icc-cricket.com/rankings/womens/player-rankings/t20i'),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.leaderboard_outlined),
            title: const Text(
              'IPL Leaderboard',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse('https://www.iplt20.com/matches/points-table'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list_alt_rounded),
            title: const Text(
              'IPL Stats',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse('https://www.iplt20.com/stats/2023'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.groups_3),
            title: const Text(
              'Fantasy Cricket Tips',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () => launchUrl(
              Uri.parse('https://www.crictracker.com/fantasy-cricket-tips/'),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onTap: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
          ),
        ],
      ),
    );
  }
}
