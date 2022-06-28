import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:poke_romeo/app/service/servicios.dart';
import 'package:intl/intl.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final f = NumberFormat("000", "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Obx(
          () => Row(
            children: [
              Text('Pokédex'),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Home'),
                  ],
                ),
              ),
              InkWell(
                onTap: () => {
                  controller.brightness.value = Get.find<Luminarias>()
                      .changeTheme(controller.brightness.value),
                },
                child: controller.brightness.value == 0
                    ? Icon(
                        Icons.brightness_6,
                      )
                    : controller.brightness.value == 1
                        ? Icon(
                            Icons.light_mode,
                          )
                        : Icon(
                            Icons.brightness_low,
                          ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).unfocus(),
        },
        child: Container(
          child: CustomPaint(
            size: Size(Get.width, (Get.height).toDouble()),
            painter: RPSCustomPainter(),
            child: SizedBox(
              width: Get.width,
              height: Get.height,
              child: Obx(
                () => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        controller: controller.buscarPokemon,
                        onChanged: (value) {
                          controller.textedition.filterPokemon(value);
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Buscar Pokemon',
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3, color: Colors.white),
                              borderRadius: BorderRadius.circular(8),
                            )),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    !controller.masterController.filterPokemon.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Image.asset(
                                'lib/app/assets/images/logoNoPokemon.png'),
                          )
                        : Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 8),
                                  child: SizedBox(
                                    width: Get.width,
                                    child: Text(
                                      'Pokemones Capturados: ${controller.masterController.filterPokemon.length}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: GridView.builder(
                                      itemCount: controller.masterController
                                          .filterPokemon.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      itemBuilder: (_, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2, vertical: 2),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: <Color>[
                                                Color.fromARGB(
                                                    255, 255, 208, 0),
                                                Color.fromARGB(255, 255, 208, 0)
                                                    .withOpacity(0.6),
                                                Color.fromARGB(255, 255, 208, 0)
                                                    .withOpacity(0.4),
                                                Color.fromARGB(255, 255, 208, 0)
                                                    .withOpacity(0.6),
                                                Color.fromARGB(
                                                    255, 255, 208, 0),
                                              ],
                                            ),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                10.0,
                                              ),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned.fill(
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            controller
                                                                .textedition
                                                                .capitalizeOnlyFirstLater(
                                                                    controller
                                                                        .masterController
                                                                        .filterPokemon[
                                                                            index]
                                                                        .name),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          Text(
                                                            '#${f.format(controller.masterController.filterPokemon[index].id)}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned.fill(
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller
                                                        .masterController
                                                        .filterPokemon[index]
                                                        .sprites
                                                        .versions
                                                        .generationV
                                                        .blackWhite
                                                        .animated
                                                        .frontDefault,
                                                    placeholder: (context,
                                                            url) =>
                                                        CircularProgressIndicator(),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            CachedNetworkImage(
                                                      imageUrl: controller
                                                          .masterController
                                                          .filterPokemon[index]
                                                          .sprites
                                                          .frontDefault,
                                                      placeholder: (context,
                                                              url) =>
                                                          CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons.error),
                                                    ),
                                                  ),

                                                  /*  Image.network(
                                                    controller
                                                        .masterController
                                                        .filterPokemon[index]
                                                        .sprites
                                                        .versions
                                                        .generationV
                                                        .blackWhite
                                                        .animated
                                                        .frontDefault,
                                                  ), */
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Get.theme.appBarTheme.backgroundColor!
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height * 0.0900000);
    path0.lineTo(0, size.height * 0.4000000);
    canvas.drawShadow(path0, Color.fromARGB(255, 0, 0, 0), 10, true);
    path0.lineTo(0, size.height * 0.4000000);
    canvas.drawShadow(path0, Color.fromARGB(255, 0, 0, 0), 10, true);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
