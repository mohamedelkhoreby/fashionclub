import 'package:flutter/material.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../../app/storage_util.dart';
import '../../../../../domain/model/models.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';
import '../viewModel/menu_viewmodel.dart';
import 'content_product.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage>
    with SingleTickerProviderStateMixin {
  final MenuViewModel _viewModel = instance<MenuViewModel>();
  List<Store> likedStores = [];

  _bind() {
    _viewModel.start();
    _loadLikes(); // Load likes from DB
  }

  Future<void> _loadLikes() async {
    likedStores = await DatabaseHelper().getLikes();
    setState(() {}); // Refresh UI
  }

  Future<void> _toggleLike(Store store) async {
    setState(() {
      if (likedStores.any((s) => s.id == store.id)) {
        likedStores.removeWhere((s) => s.id == store.id);
        DatabaseHelper().deleteLike(store);
      } else {
        likedStores.add(store);
        DatabaseHelper().insertLike(store);
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

    TextScaler textScaler = MediaQuery.textScalerOf(context);
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context,
                    _getContentWidget(screenHeight, screenWidth, textScaler),
                    () {
                  _viewModel.start();
                }) ??
                _getContentWidget(screenHeight, screenWidth, textScaler);
          },
        ),
      ),
    );
  }

  Widget _getContentWidget(screenHeight, screenWidth, textScaler) {
    return StreamBuilder<MenuViewObject>(
      stream: _viewModel.outputMenuData,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getStoresWidget(snapshot.data?.stores ?? [], screenHeight,
                screenWidth, textScaler),
          ],
        );
      },
    );
  }

  Widget _getStoresWidget(
      List<Store> stores, screenHeight, screenWidth, TextScaler textScaler) {
    return stores.isNotEmpty
        ? GridView.count(
            crossAxisCount: 2,
            childAspectRatio: screenWidth / (screenHeight / 1.25),
            crossAxisSpacing: 2,
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 1),
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            children: stores.map((store) {
              bool isSaved = likedStores.any((s) => s.id == store.id);
              return Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContentProduct(stores: store),
                        ),
                      );
                    },
                    child: Container(
                      height: screenHeight / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(store.image1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppValues.v8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${AppStrings.price} ${store.price}",
                                style: getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: textScaler.scale(AppValues.v14))),
                            Text(
                              store.title,
                              style: getRegularStyle(
                                  color: ColorManager.black,
                                  fontSize: textScaler.scale(AppValues.v14)),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => _toggleLike(store),
                          icon: Icon(
                            isSaved ? Icons.favorite : Icons.favorite_border,
                            size: textScaler.scale(AppValues.v15),
                            color: isSaved
                                ? ColorManager.error
                                : ColorManager.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          )
        : Container();
  }

  @override
  void dispose() {
    //  _viewModel.dispose();
    super.dispose();
  }
}
