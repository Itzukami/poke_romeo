import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_romeo/app/api/api.dart';
import 'package:poke_romeo/app/controller/masterController.dart';
import 'package:poke_romeo/app/models/allPokemon.dart';
import 'package:poke_romeo/app/models/indexpokemon.dart';
import 'package:poke_romeo/themes/theme.dart';

class Luminarias extends GetxService {
  final masterController = MasterController();
  // brightness = 0 / automatico
  // brightness = 1 / light
  // brightness = 2 / dark
  int setPhoneState() {
    if (masterController.brightnessPhone.contains('light')) {
      Get.changeTheme(TemaApp().lightTheme);
      return 0;
    } else {
      Get.changeTheme(TemaApp().darkTheme);
      return 0;
    }
  }

  int changeTheme(int state) {
    if (state == 0) {
      Get.changeTheme(TemaApp().lightTheme);
      return 1;
    } else if (state == 1) {
      Get.changeTheme(TemaApp().darkTheme);
      return 2;
    } else if (state == 2) {
      return setPhoneState();
    } else {
      return setPhoneState();
    }
  }
}

class ApiInject extends GetxService {
  final MasterController masterController = Get.find();
  final api = ApiConnect();
  Future<void> getAllPokemonService() async {
    masterController.indicePokemon.add(await api.getAllPokemon());

    if (masterController.indicePokemon.isNotEmpty) {
      for (var element in masterController.indicePokemon[0].results) {
        try {
          masterController.allPokemon.add(
            await api.getPokemon(element.url),
          );
        } catch (e) {
          Get.log('Ocurrio algo');
        }
      }
    }
  }
}

class TextEdition extends GetxService {
  final MasterController masterController = Get.find();
  String capitalizeOnlyFirstLater(String trim) {
    if (trim.length <= 1) {
      return trim.toUpperCase();
    }
    return '${trim[0].toUpperCase()}${trim.substring(1)}';
  }

  void filterPokemon(String text) {
    if (text == '' || text.isEmpty) {
      masterController.filterPokemon.value = masterController.allPokemon;
    } else if (text.length > 3) {
      var data = masterController.allPokemon
          .where((pokemon) => pokemon.name.toLowerCase().contains(text))
          .toList();
      masterController.filterPokemon.value = data;
    }
    masterController.filterPokemon.refresh();
  }
}
