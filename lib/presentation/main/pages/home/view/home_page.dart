import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../app/dependency_injection.dart';
import '../../../../../domain/model/models.dart';
import '../../../../common/state_renderer/state_renderer_impl.dart';

import '../viewModel/home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: SingleChildScrollView(
            child: StreamBuilder<FlowState>(
              stream: _viewModel.outputState,
              builder: (context, snapshot) {
                return snapshot.data?.getScreenWidget(
                      context,
                      _getContentWidget(constraints),
                      () {
                        _viewModel.start();
                      },
                    ) ??
                    _getContentWidget(constraints);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getContentWidget(BoxConstraints constraints) {
    return StreamBuilder<HomeViewObject>(
      stream: _viewModel.outputHomeData,
      builder: (context, snapshot) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_getBannerWidget(snapshot.data?.banners, constraints)],
        );
      },
    );
  }

  Widget _getBannerWidget(List<BannerAd>? banners, BoxConstraints constraints) {
    if (banners != null) {
      return CarouselSlider(
        items: banners
            .map(
              (banner) => SizedBox(
                width: double.infinity,
                height: constraints.maxHeight,
                child: ClipRRect(
                  child: Image.network(banner.image, fit: BoxFit.cover),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          scrollDirection: Axis.vertical,
          height: constraints.maxHeight,
          autoPlay: true,
          viewportFraction: 0.5,
          enableInfiniteScroll: true,
          enlargeCenterPage: false,
        ),
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
