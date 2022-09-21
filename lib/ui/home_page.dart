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
        body: Padding(
          padding: const EdgeInsets.all(SizeForm.margin),
          child: Column(
            children: [
              SizedBox(
                height: _height * 0.1,
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
                children: [
                  MainMenuCard(
                    title: 'mitos',
                    color: ConstantColors.mythColor,
                    image: './assets/images/myth_image.png',
                    description: 'Descubre los mitos',
                    onPress: (){
                      Get.toNamed(Routes.signIn);
                    },
                  ),
                  MainMenuCard(
                    title: 'leyendas',
                    color: ConstantColors.legendColor,
                    image: './assets/images/legend_image.png',
                    description: 'Descubre las leyendas',
                      onPress: (){
                        Get.toNamed(Routes.signIn);
                      }
                  ),
                ],
              ),
              SizedBox(
                height: _height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MainMenuCard(
                    title: 'mapa',
                    color: ConstantColors.mapColor,
                    image: './assets/images/map_image.png',
                    description: 'Conoce sus ubicaciones',
                      onPress: (){
                        Get.toNamed(Routes.map);
                      }
                  ),
                  MainMenuCard(
                    title: 'perfil',
                    color: ConstantColors.profileColor,
                    image: './assets/images/profile_image.png',
                    description: 'Revisa tu información',
                      onPress: (){
                        Get.toNamed(Routes.signIn);
                      }
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
