import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stream_provider/pages/ticker/ticker_provider.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticker'),
      ),
      body: Center(
        child: tickerValue.when(
          data: (ticks) => Text(formatTimer(ticks)),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }

  String formatTimer(int ticks) {
    final minutes = zeroPaddedTwoDigits((ticks / 60) % 60);
    final seconds = zeroPaddedTwoDigits(ticks % 60);

    return '$minutes:$seconds';
  }

  zeroPaddedTwoDigits(double d) {
    return d.floor().toString().padLeft(2, '0');
  }
}
