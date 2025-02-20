import 'package:flutter/material.dart';
import '../../../../../app/storage_util.dart';
import '../../../../../domain/model/models.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../menu/view/content_product.dart';

class LikePage extends StatefulWidget {
  const LikePage({super.key});

  @override
  LikePageState createState() => LikePageState();
}

class LikePageState extends State<LikePage> {
  static List<Store> likes = <Store>[];
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    _loadLikes();
  }

  Future<void> _loadLikes() async {
    likes = await _dbHelper.getLikes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: likes.isNotEmpty
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppStrings.price + likes[index].price,
                                        style: getBoldStyle(
                                            color: ColorManager.black,
                                            fontSize: AppValues.v8)),
                                    Text(
                                      likes[index].title,
                                      style: getRegularStyle(
                                          color: ColorManager.black,
                                          fontSize: AppValues.v8),
                                    ),
                                  ]),
                              IconButton(
                                onPressed: () async {
                                  await _dbHelper.deleteLike(likes[index]);
                                  setState(() {
                                    likes.removeAt(index);
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  size: 15,
                                ),
                                color: ColorManager.error,
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
              padding: EdgeInsets.only(
                  top: MediaQuery.sizeOf(context).height / AppValues.v3),
              child: Center(
                child: Text(
                  AppStrings.likeEmpty,
                  style: getRegularStyle4(
                      color: ColorManager.black, fontSize: AppValues.v10),
                ),
              ),
            ),
    );
  }
}
