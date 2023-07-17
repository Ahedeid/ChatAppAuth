import 'package:chat_app_auth/sheared/skeletonWidget/baseShimmerWidget.dart';
import 'package:flutter/material.dart';

class CategoryScreenShimmerWidget extends StatelessWidget {
  const CategoryScreenShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Skeleton(height: size.height*0.05,),
        const SizedBox(height: 25),
        GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                mainAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF41413824),
                        blurRadius: 7,
                        offset: Offset(0, 8),
                      ) // chan
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: const Skeleton(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Skeleton(
                      width: size.width * 0.3,
                    ),
                    const SizedBox(height: 8),
                    Skeleton(
                      width: size.width * 0.2,
                    ),
                  ],
                ),
              );
            })
      ],
    );
  }
}
