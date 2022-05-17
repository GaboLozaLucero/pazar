import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/widgets/card/main_menu_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = Get.width;
    double _height = Get.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(SizeForm.margin),
          child: Column(
            children: [
              SizedBox(
                height: _height * 0.15,
                child: Image.asset('./assets/images/logo.png'),
              ),
              SizedBox(
                height: _height * 0.02,
              ),
              const Divider(
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: _height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  MainMenuCard(
                    title: 'mitos',
                    color: ConstantColors.mythColor,
                    image: './assets/images/myth_image.png',
                    description: 'Descubre los mitos',
                  ),
                  MainMenuCard(
                    title: 'leyendas',
                    color: ConstantColors.legendColor,
                    image: './assets/images/legend_image.png',
                    description: 'Descubre los mitos',
                  ),
                ],
              ),
              SizedBox(
                height: _height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  MainMenuCard(
                    title: 'mapa',
                    color: ConstantColors.mapColor,
                    image: './assets/images/map_image.png',
                    description: 'Descubre los mitos',
                  ),
                  MainMenuCard(
                    title: 'perfil',
                    color: ConstantColors.profileColor,
                    image: './assets/images/profile_image.png',
                    description: 'Descubre los mitos',
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
