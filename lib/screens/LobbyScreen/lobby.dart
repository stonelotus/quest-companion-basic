import 'package:flutter/material.dart';
import 'package:quest_companion/screens/LoginScreen/components/background.dart';
import 'package:quest_companion/services/misc/misc_service.dart';
import 'package:quest_companion/services/service_locator.dart';

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
        body: Background(
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 40),
                  child: const Text(
                    "YOUR QUEST\n     COMPANION",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
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
                            builder: (context) => const FocusScreen(
                                  companion: 'waleon',
                                )))
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
                            builder: (context) => const FocusScreen(
                                  companion: 'flames',
                                )))
                  },
                  child: const CompanionSlot(
                    companionName: 'flames',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: InkWell(
                  onTap: () => {
                    // apasare buton animalut, tranzwitie spre ecranul de focus
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FocusScreen(
                                  companion: 'turtle',
                                )))
                  },
                  child: const CompanionSlot(
                    companionName: 'turtle',
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
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(left: 120),
                margin: const EdgeInsets.only(bottom: 140),
                child: const Text(
                  "Current\nstreak\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(bottom: 170, left: 30),
                child: Text(
                  // getIt<UserService>().getCachedStreak().toString(),
                  getIt<MiscService>().goodStreak.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        )
      ]),
    ));
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
