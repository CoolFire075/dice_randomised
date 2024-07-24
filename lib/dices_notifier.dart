import 'dart:math';

import 'package:dice_randomised/dices_variant.dart';
import 'package:flutter/cupertino.dart';

class DicesNotifier extends ChangeNotifier {
  DicesVariant firstDice = DicesVariant.dice_1;
  DicesVariant secondDice = DicesVariant.dice_1;
  int firstNumber = 1;
  int secondNumber = 1;

  void getRandomDice() {
    firstNumber = Random().nextInt(6);
    secondNumber = Random().nextInt(6);
    firstDice = chooseDice(firstNumber);
    secondDice = chooseDice(secondNumber);
    notifyListeners();
  }

  DicesVariant chooseDice(int number) {
    DicesVariant dice = switch (number) {
      0 => DicesVariant.dice_1,
      1 => DicesVariant.dice_2,
      2 => DicesVariant.dice_3,
      3 => DicesVariant.dice_4,
      4 => DicesVariant.dice_5,
      5 => DicesVariant.dice_6,
      _ => DicesVariant.dice_1,
    };
    return dice;
  }
}
