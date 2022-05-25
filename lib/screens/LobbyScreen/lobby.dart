import 'package:flutter/material.dart';

import '../FocusScreen/focus.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({Key? key}) : super(key: key);

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text("NiceBar")),
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
      Row(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: InkWell(
                onTap: () => {
                  // apasare buton animalut, tranzitie spre ecranul de focus
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FocusScreen()))
                },
                child: const CompanionSlot(
                  companionName: 'waleon',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: InkWell(
                onTap: () => {
                  // apasare buton animalut, tranzitie spre ecranul de focus
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FocusScreen()))
                },
                child: const CompanionSlot(
                  companionName: 'waleon',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Center(
              child: InkWell(
                onTap: () => {
                  // apasare buton animalut, tranzitie spre ecranul de focus
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FocusScreen()))
                },
                child: const CompanionSlot(
                  companionName: 'waleon',
                ),
              ),
            ),
          )
        ],
      ),
      Divider(
        color: Colors.black,
      ),
      Expanded(
        flex: 3,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              color: Colors.yellow,
              child: const Text(
                "YOUR QUEST COMPANION",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
          ],
        ),
      )
    ]));
  }
}

class CompanionSlot extends StatelessWidget {
  final String companionName;
  const CompanionSlot({
    required this.companionName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
              image: AssetImage('assets/images/companions/' +
                  companionName.toString() +
                  '.png'))),
    );
  }
}
