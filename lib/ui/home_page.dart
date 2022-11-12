import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/navigation/pages.dart';
import 'package:project/ui/widgets/card/main_menu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double _width = Get.width;
    double _height = Get.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: _height * 0.15,
                width: double.infinity,
                child: Image.asset(
                  './assets/images/logos.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: _height * 0.02,
              ),
              const Divider(
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: _height * 0.01,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SizeForm.margin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MainMenuCard(
                          title: 'mitos',
                          color: ConstantColors.mythColor,
                          image: './assets/images/myth_image.png',
                          description: 'Descubre los mitos',
                          onPress: () {
                            Get.toNamed(Routes.myths);
                          },
                        ),
                        MainMenuCard(
                            title: 'leyendas',
                            color: ConstantColors.legendColor,
                            image: './assets/images/legend_image.png',
                            description: 'Descubre las leyendas',
                            onPress: () {
                              Get.toNamed(Routes.legends);
                            }),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: _height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: SizeForm.margin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MainMenuCard(
                            title: 'mapa',
                            color: ConstantColors.mapColor,
                            image: './assets/images/map_image.png',
                            description: 'Conoce sus ubicaciones',
                            onPress: () {
                              Get.toNamed(Routes.map);
                            }),
                        MainMenuCard(
                            title: 'perfil',
                            color: ConstantColors.profileColor,
                            image: './assets/images/profile_image.png',
                            description: 'Revisa tu información',
                            onPress: () {
                              // Get.find<AuthController>().signOut();
                              Get.toNamed(Routes.profile);
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
