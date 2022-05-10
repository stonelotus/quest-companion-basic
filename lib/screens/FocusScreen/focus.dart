import 'dart:async';

import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

import 'components/circular_countdown_timer.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({Key? key}) : super(key: key);
  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  Duration _duration = Duration(hours: 0, minutes: 0, seconds: 10);

  bool timerRunning = false;

  Timer scheduleTimeout([int milliseconds = 3000]) =>
      Timer(Duration(milliseconds: milliseconds), handleTimeout);

  void handleTimeout() {
    print("\nFcuk yes\n");
  }

  final CountDownController _countDownController = CountDownController();
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
                    "MIHAI", //TODO PetName
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
          child: InkWell(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const FocusScreen()))
            },
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
      ),
      Divider(
        color: Colors.black,
      ),
      Divider(
        color: Colors.black,
      ),
      TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () {
          // print(_countDownController.getTime());
          timerRunning = true;
          //  _countDownController.start();

          // print(_countDownController.getTime());
        },
        child: Text('START Focus'),
      ),
      Divider(
        color: Colors.black,
      ),
      timerRunning == true
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
    ]));
  }
}

class CountdownTimer extends StatelessWidget {
  const CountdownTimer({
    Key? key,
    required Duration duration,
    required CountDownController countDownController,
  })  : _duration = duration,
        _countDownController = countDownController,
        super(key: key);

  final Duration _duration;
  final CountDownController _countDownController;

  set timerRunning(bool timerRunning) {
    this.timerRunning = timerRunning;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CircularCountDownTimer(
        duration: _duration.inSeconds,
        initialDuration: 1,
        controller: _countDownController,
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.height / 2,
        ringColor: Colors.grey[300]!,
        ringGradient: null,
        fillColor: Colors.purpleAccent[100]!,
        fillGradient: null,
        backgroundColor: Colors.purple[500],
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
          // timerRunning = false;
        },
      ),
    );
  }
}
