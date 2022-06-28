import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:poke_romeo/app/models/allPokemon.dart';
import 'package:poke_romeo/app/models/indexpokemon.dart';

class MasterController extends GetxController {
  final brightnessPhone =
      SchedulerBinding.instance.window.platformBrightness.toString().obs;
  final allPokemon = <AllPokemon>[].obs;
  final filterPokemon = <AllPokemon>[].obs;
  final indicePokemon = <Index>[].obs;
}
