import 'package:flutter/material.dart';
import '../../../../../domain/model/models.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../menu/view/content_product.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  LikePageState createState() => LikePageState();
}

class LikePageState extends State<LikePage> {
  static List<Store> likes = <Store>[];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: (likes.isNotEmpty)
            ? Column(
                children: [
                  GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 1,
                      primary: false,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(likes.length, (index) {
                        bool isSaved = likes.contains(likes[index]);
                        return Column(children: [
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContentProduct(
                                            stores: likes[index])));
                              },
                              child: Container(
                                height: 200,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  image: NetworkImage(likes[index].image1),
                                  fit: BoxFit.cover,
                                )),
                              )),
                          SizedBox(
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          AppStrings.price + likes[index].price,
                                          style: getBoldStyle(
                                              color: ColorManager.black,
                                              fontSize: AppSize.s8)),
                                      Text(
                                        likes[index].title,
                                        style: getRegularStyle(
                                            color: ColorManager.black,
                                            fontSize: AppSize.s8),
                                      ),
                                    ]),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (isSaved) {
                                        likes.remove(likes[index]);
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    isSaved
                                        ? Icons.favorite
                                        : Icons.favorite_outlined,
                                    size: 15,
                                  ),
                                  color: isSaved
                                      ? ColorManager.error
                                      : ColorManager.grey,
                                ),
                              ],
                            ),
                          ),
                        ]);
                      })),
                  const SizedBox(
                    height: 110,
                  )
                ],
              )
            : Padding(
              padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/AppPadding.p3),
              child: Center(
                      child: Text(
                              AppStrings.likeEmpty,
                              style: getRegularStyle4(
                                  color: ColorManager.black, fontSize: AppSize.s10),
                            ),
                    ),
            ),
            );
  }
}
