import 'package:flutter/material.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({Key? key}) : super(key: key);

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Fuck me")),
        body: Column(children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: const Center(
                      child: Text(
                        "YOUR QUEST COMPANION",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: const DecorationImage(
                        image:
                            AssetImage('assets/images/companions/waleon.png'))),
              ),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  color: Colors.yellow,
                  child: const Text(
                    "YOUR SWEET BOY",
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
