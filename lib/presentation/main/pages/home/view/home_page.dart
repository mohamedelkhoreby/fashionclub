import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../../domain/model/models.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

import '../viewModel/home_viewmodel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = instance<HomeViewModel>();

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
                  ?.getScreenWidget(context, _getContentWidget(), () {
                _viewModel.start();
              }) ??
                  _getContentWidget();
            }),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<HomeViewObject>(
        stream: _viewModel.outputHomeData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getBannerWidget(snapshot.data?.banners)
            ],
          );
        });
  }

  Widget _getBannerWidget(List<BannerAd>? banners) {
    final height = MediaQuery.of(context).size.height;
    if (banners != null) {
      return CarouselSlider(
          items: banners.map((banner) => SizedBox(
            width: double.infinity,
            height: height,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
               // borderRadius: BorderRadius.circular(AppSize.s12),
                child: Image.network(banner.image, fit: BoxFit.cover),
              ),
            ),
          ))
              .toList(),
          options: CarouselOptions(
              scrollDirection: Axis.vertical,
              height: height,
              autoPlay: true,
              viewportFraction: 0.5,
              enableInfiniteScroll: true,
              enlargeCenterPage: false));
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