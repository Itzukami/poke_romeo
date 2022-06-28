import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poke_romeo/app/controller/masterController.dart';
import 'package:poke_romeo/app/service/servicios.dart';

class HomeController extends GetxController {
  final MasterController masterController = Get.find();
  final ApiInject apiInject = Get.find();
  final Luminarias luminarias = Get.find();
  final textedition = TextEdition();
  final brightness = 0.obs;

  TextEditingController buscarPokemon = TextEditingController();

  @override
  void onInit() {
    apiInject.getAllPokemonService();
    textedition.filterPokemon('');
    super.onInit();
  }

  @override
  void onReady() {
    luminarias.setPhoneState();
    super.onReady();
  }

  @override
  void onClose() {}
}
