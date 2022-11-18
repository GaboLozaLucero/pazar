import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/constants/constant_colors.dart';
import 'package:project/constants/size_form.dart';
import 'package:project/constants/text_styles.dart';
import 'package:project/data/models/stories.dart';
import 'package:project/ui/widgets/container/text_container.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({Key? key, this.stories, required this.function}) : super(key: key);

  final List<Story>? stories;
  final Function function;

  @override
  Widget build(BuildContext context) {
    double height = Get.height;
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
                borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                border: Border.all(
                  width: 1.0,
                  color: Colors.black,
                ),
                // image: DecorationImage(
                //   image: NetworkImage('${stories?[index].imageUrl}'),
                //   fit: BoxFit.fill,
                // ),
              ),
              height: height * 0.15,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(SizeForm.buttonRadius),
                    child: Image.network(
                      '${stories?[index].imageUrl}',
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: ConstantColors.buttonColor,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  OutlinedButton(
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
                        TextContainer(
                          text: '${stories?[index].name}',
                          style: textInDescriptionCard,
                        ),
                        TextContainer(
                          text: '${stories?[index].address}',
                          style: textCardStories,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
