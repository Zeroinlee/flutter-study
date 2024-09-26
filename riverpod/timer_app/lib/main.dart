import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerProvider(),
      child: const MaterialApp(
        home: TimerScreen(),
      ),
    );
  }
}

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('타이머 앱')),
      body: Center(
        child: Consumer<TimerProvider>(
          builder: (context, timerProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${timerProvider.seconds} 초',
                  style: const TextStyle(fontSize: 48),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Start the timer
                        timerProvider.startTimer();
                      },
                      child: const Text('시작'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Pause the timer
                        timerProvider.pauseTimer();
                      },
                      child: const Text('일시 정지'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Reset the timer
                        timerProvider.resetTimer();
                      },
                      child: const Text('리셋'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class TimerProvider with ChangeNotifier {
  int _seconds = 0;
  Timer? _timer;
  bool _isRunning = false;

  int get seconds => _seconds;
  bool get isRunning => _isRunning;

  void startTimer() {
    // TODO: Implement the startTimer method
    if (_isRunning) return;

    _isRunning = true;
    notifyListeners();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds++;
      notifyListeners();
    });
  }

  void pauseTimer() {
    // TODO: Implement the pauseTimer method
    if (!_isRunning) return;

    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }

  void resetTimer() {
    // TODO: Implement the resetTimer method
    _seconds = 0;
    _isRunning = false;
    _timer?.cancel();
    notifyListeners();
  }
}
