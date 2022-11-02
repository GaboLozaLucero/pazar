import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/data/models/stories.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({Key? key, this.stories}) : super(key: key);

  final List<Story>? stories;

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
    double width = Get.width;
    return ListView.builder(
        itemCount: stories?.length,
        itemBuilder: (context, index) {
          if (stories!.isEmpty) {
            return const Center(
              child: Text('Aún no hay historias que contar'),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  width: 2.0,
                  color: Colors.black,
                ),
                image: DecorationImage(
                  image: NetworkImage('${stories?[index].imageUrl}'),
                  fit: BoxFit.fill,
                ),
              ),
              height: height * 0.15,
              width: width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      '${stories?[index].name}',
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      '${stories?[index].address}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
