import 'package:dice_randomised/dices_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Randomised Dices',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider<DicesNotifier>(
        create: (BuildContext context) => DicesNotifier(),
        child: const MyDiceRandomised(),
      ),
    );
  }
}

class MyDiceRandomised extends StatefulWidget {
  const MyDiceRandomised({super.key});

  @override
  State<MyDiceRandomised> createState() => _MyDiceRandomisedState();
}

class _MyDiceRandomisedState extends State<MyDiceRandomised> {
  @override
  Widget build(BuildContext context) {
    final notifier = context.read<DicesNotifier>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Randomised Dice',
          style: TextStyle(fontSize: 40),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DicesImage(),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.orange),
                ),
                onPressed: () {
                  notifier.getRandomDice();
                },
                child: const Icon(
                  Icons.help_outline,
                  size: 60,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}

class DicesImage extends StatelessWidget {
  const DicesImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DicesNotifier>(
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              value.firstDice.path,
              width: 150,
            ),
            Image.asset(
              value.secondDice.path,
              width: 150,
            )
          ],
        );
      },
    );
  }
}

