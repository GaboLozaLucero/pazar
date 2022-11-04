import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/data/models/stories.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({Key? key, this.stories, required this.function}) : super(key: key);

  final List<Story>? stories;
  final Function function;

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
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  width: 1.0,
                  color: Colors.black,
                ),
                image: DecorationImage(
                  image: NetworkImage('${stories?[index].imageUrl}'),
                  fit: BoxFit.fill,
                ),
              ),
              height: height * 0.15,
              width: double.infinity,
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: SizeForm.margin / 4, horizontal: SizeForm.margin / 2),
                  ),
                ),
                onPressed: () {
                  function(index);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(SizeForm.margin / 4),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(SizeForm.textBackgroundRadius),
                      ),
                      child: Text(
                        '${stories?[index].name}',
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(SizeForm.margin / 4),
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(SizeForm.textBackgroundRadius),
                      ),
                      child: Text(
                        '${stories?[index].address}',
                        style: textCardStories,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
