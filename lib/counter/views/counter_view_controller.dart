import 'dart:async';

import 'package:doinz/utils/app_extensions.dart';
import 'package:doinz/utils/snack_bar.dart';
import 'package:doinz/utils/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterViewControllerProvider =
    StateNotifierProvider<CounterViewController, double>((ref) {
  return CounterViewController(ref: ref);
});

class CounterViewController extends StateNotifier<double> {
  final Ref _ref;
  CounterViewController({required Ref ref})
      : _ref = ref,
        super(0);

  Timer? time;

  //! turn to counter
  void countForward() {
    if (time == null) {
      time = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        state = state + 0.1;
      });
    } else {
      time!.cancel();
      time = null;
    }
  }

  //! reset counter
  void resetCounter() {
    state = 0;
  }

  //! perform calculation
  void calculate({
    required BuildContext context,
    required String input,
  }) {
    //! separate input into a list of strings for processing
    List<String> words = input.split(' ');
    words.toString().log();
    String action;
    double influencingNumber;

    if (words.length != 2 && words.length != 3) {
      showBanner(
        context: context,
        theMessage: 'Wrong/incomplete input',
        theType: NotificationType.failure,
      );
    } else if (words.length == 2) {
      action = words[0];
      influencingNumber = double.tryParse(words[1])!;

      //! the action to perform
      switch (action) {
        case 'add':
          state = state + influencingNumber;
          _ref.read(counterListControllerProvider.notifier).addToList(
                action: 'added',
                type: 'to',
                influence: influencingNumber.toString(),
                stateFRom: state.toString(),
                statee: (state - influencingNumber).toString(),
              );
          break;
        case 'subtract':
          state = state - influencingNumber;
          _ref.read(counterListControllerProvider.notifier).addToList(
                action: 'subtracted',
                type: 'from',
                influence: influencingNumber.toString(),
                stateFRom: state.toString(),
                statee: (state + influencingNumber).toString(),
              );
          break;
        default:
          showBanner(
            context: context,
            theMessage: 'Wrong/incomplete input',
            theType: NotificationType.failure,
          );
      }
    } else if (words.length == 3) {
      action = '${words[0]} ${words[1]}';
      action.log();
      influencingNumber = double.tryParse(words[2])!;

      //! the action to perform
      switch (action) {
        case 'subtract from':
          state = influencingNumber - state;
          _ref.read(counterListControllerProvider.notifier).addToList(
                action: 'subtracted',
                type: 'from',
                influence: (influencingNumber - state).toString(),
                stateFRom: state.toString(),
                statee: (influencingNumber).toString(),
              );
          break;
        case 'divide by':
          if (influencingNumber == 0) {
            showBanner(
              context: context,
              theMessage: 'Elementary school says nope 😗',
              theType: NotificationType.failure,
            );
          } else {
            state = state / influencingNumber;
          }

          break;
        case 'multiply by':
          state = state * influencingNumber;
          break;

        default:
          showBanner(
            context: context,
            theMessage: 'Wrong/incomplete input',
            theType: NotificationType.failure,
          );
      }
    }
  }
}

//! list

final counterListControllerProvider =
    StateNotifierProvider<CounterListController, List<String>>((ref) {
  return CounterListController();
});

class CounterListController extends StateNotifier<List<String>> {
  CounterListController() : super([]);

  void addToList({
    required String action,
    required String type,
    required String influence,
    required String statee,
    required String stateFRom,
  }) {
    state = [...state, 'You $action $influence $type $statee  -->  $stateFRom'];
  }

  void resetList() {
    state = [];
  }
}
