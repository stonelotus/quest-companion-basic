import 'dart:async';

import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get_it/get_it.dart';
import 'package:quest_companion/screens/LoginScreen/components/background.dart';
import 'package:quest_companion/services/firebase.dart';
import 'package:quest_companion/services/misc/misc_service.dart';
import 'package:quest_companion/services/service_locator.dart';
import 'package:quest_companion/services/user_service/user_service.dart';

import 'components/circular_countdown_timer.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({Key? key, required this.companion}) : super(key: key);
  final String companion;
  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  Duration _duration = Duration(hours: 0, minutes: 0, seconds: 10);

  String focusButtonText = "Start Focus";

  Timer scheduleTimeout([int milliseconds = 3000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  static const minimumCountdownTime = 5;
  void handleTimeout() {
    print("\nFcuk yes\n");
  }

  final CountDownController _countDownController = CountDownController();
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Advanced Drawer Example'),
        //   leading: IconButton(
        //     onPressed: _handleMenuButtonPressed,
        //     icon: ValueListenableBuilder<AdvancedDrawerValue>(
        //       valueListenable: _advancedDrawerController,
        //       builder: (_, value, __) {
        //         return AnimatedSwitcher(
        //           duration: Duration(milliseconds: 250),
        //           child: Icon(
        //             value.visible ? Icons.clear : Icons.menu,
        //             key: ValueKey<bool>(value.visible),
        //           ),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        // // appBar: AppBar(title: const Text("NiceBar")),fluttflu
        body: Background(
      child: Column(children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 140, top: 80),
                  child: const Center(
                    child: Text(
                      "WALEON", //TODO PetName
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Center(
            child: InkWell(
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        image: AssetImage('assets/images/companions/' +
                            widget.companion +
                            '.png'))),
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {
            // print(_countDownController.getTime());
            debugPrint(getIt<MiscService>().timerRunning.toString());

            getIt<MiscService>().timerRunning
                ? setState(() {
                    getIt<MiscService>().timerRunning = false;

                    focusButtonText = "START FOCUS";
                  })
                : setState(() {
                    // Start countdown
                    if (_duration.inSeconds >= minimumCountdownTime) {
                      getIt<MiscService>().timerRunning = true;
                      focusButtonText = "STOP FOCUS";
                    } else {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text('Not enough seconds'),
                                content: const Text(
                                    'You need to select at least 5 seconds'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ));
                    }
                  });
            //  _countDownController.start();

            // print(_countDownController.getTime());
          },
          child: Text(focusButtonText),
        ),
        getIt<MiscService>().timerRunning == true
            ? CountdownTimer(
                duration: _duration, countDownController: _countDownController)
            : DurationPicker(
                duration: _duration,
                onChange: (val) {
                  setState(() => _duration = val);
                },
                snapToMins: 5.0,
                baseUnit: BaseUnit.second,
              ),
        Expanded(flex: 2, child: Container())
      ]),
    ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({
    Key? key,
    required Duration duration,
    required CountDownController countDownController,
  })  : _duration = duration,
        _countDownController = countDownController,
        super(key: key);

  final Duration _duration;
  final CountDownController _countDownController;

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  // finishTimer(){
  //   setState
  // }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CircularCountDownTimer(
        duration: widget._duration.inSeconds,
        initialDuration: 1,
        controller: widget._countDownController,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        ringColor: Colors.grey[300]!,
        ringGradient: null,
        fillColor: Colors.blue[100]!,
        fillGradient: null,
        backgroundColor: Colors.green[300],
        backgroundGradient: null,
        strokeWidth: 20.0,
        strokeCap: StrokeCap.round,
        textStyle: TextStyle(
            fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
        textFormat: CountdownTextFormat.S,
        isReverse: true,
        isReverseAnimation: true,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          debugPrint('Countdown Started');
        },
        onComplete: () {
          debugPrint('Countdown Ended');
          setState(() {
            // int currentStreak =
            //     int.parse(getIt<UserService>().getCachedStreak());
            // currentStreak++;
            // getIt<UserService>().setCachedStreak(currentStreak);
            // updateUser({"streak": currentStreak});
            getIt<MiscService>().goodStreak++;

            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      title: const Text('Good job!'),
                      content: Text('You have waited for ' +
                          widget._duration.inSeconds.toString() +
                          ' seconds!!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => {
                            Navigator.pop(context, 'OK'),
                            getIt<MiscService>().timerRunning = false,
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ));
          });
        },
      ),
    );
  }
}
