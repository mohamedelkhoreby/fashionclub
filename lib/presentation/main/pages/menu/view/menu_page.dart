import 'package:flutter/material.dart';
import 'package:splashscreen/presentation/main/pages/menu/viewModel/menu_viewmodel.dart';
import 'package:splashscreen/presentation/resources/color_manager.dart';
import 'package:splashscreen/presentation/resources/strings_manager.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../../domain/model/models.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../../likes/view/likes_page.dart';
import 'content_product.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  final MenuViewModel _viewModel = instance<MenuViewModel>();
  var like = LikePageState.likes;

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data
                      ?.getScreenWidget(context, _getContentWidget(like), () {
                    _viewModel.start();
                  }) ??
                  _getContentWidget(like);
            }),
      ),
    );
  }

  Widget _getContentWidget(like) {
    double screenHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<MenuViewObject>(
        stream: _viewModel.outputMenuData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getStoresWidget(snapshot.data?.stores, like, screenHeight),
            ],
          );
        });
  }

  Widget _getStoresWidget(List<Store>? stores, like, screenHeight) {
    if (stores != null) {
      return Column(
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
              children: List.generate(stores.length, (index) {
                bool isSaved  = like.contains(stores[index]);
                return Column(children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ContentProduct(
                              stores : stores[index]))
                        );
                          },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(stores[index].image1),
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
                              Text(AppStrings.price + stores[index].price,
                                  style: getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: AppSize.s8)),
                              Text(
                                stores[index].title,
                                style: getRegularStyle(
                                    color: ColorManager.black,
                                    fontSize: AppSize.s8),
                              ),
                            ]),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (isSaved) {
                                like.remove(stores[index]);
                              } else {
                                like.add(stores[index]);
                              }
                            });
                          },
                          icon: Icon(
                            isSaved ? Icons.favorite : Icons.favorite_outlined,
                            size: 15,
                          ),
                          color:
                          isSaved ? ColorManager.error : ColorManager.grey,
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
      );
    } else {
      return Container();
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
