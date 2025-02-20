import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

import '../../../../../domain/model/models.dart';
import '../../../../resources/color_manager.dart';
import '../../../../resources/strings_manager.dart';
import '../../../../resources/style_manager.dart';
import '../../../../resources/values_manager.dart';

class ContentProduct extends StatefulWidget {
  const ContentProduct({super.key, required this.stores});

  final Store stores;

  @override
  State<ContentProduct> createState() => _ContentProductState();
}

class _ContentProductState extends State<ContentProduct> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height / 2;
    final width =MediaQuery.sizeOf(context).width;
    List image = [
      widget.stores.image1,
      widget.stores.image2,
      widget.stores.image3,
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          foregroundColor: ColorManager.black,
          title: Text(
            widget.stores.title,
            style: getBoldStyle(
                color: ColorManager.black, fontSize: AppValues.v12),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: image
                      .map((stores) => SizedBox(
                          width: width,
                          height: height,
                          child: Container(
                            width:MediaQuery.sizeOf(context).width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(stores as String),
                              fit: BoxFit.cover,
                            )),
                          )))
                      .toList(),
                  options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      height: height,
                      autoPlay: false,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      })),
              Center(
                child: CarouselIndicator(
                  cornerRadius: 0,
                  space: 1,
                  height: 1,
                  width: 30,
                  count: image.length,
                  index: currentIndex,
                  color: ColorManager.lightGrey,
                  activeColor: ColorManager.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppValues.v15, top: AppValues.v20),
                child: Text(
                  widget.stores.title,
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: AppValues.v20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppValues.v15,
                    right: AppValues.v5,
                    top: AppValues.v2),
                child: Text(
                  widget.stores.desc,
                  style: getRegularStyle(
                      color: ColorManager.lightGrey, fontSize: AppValues.v12),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildDivider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppValues.v15,
                    right: AppValues.v5,
                    top: AppValues.v8),
                child: Text(
                  AppStrings.priceDetails.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: AppValues.v12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppValues.v15,
                    right: AppValues.v5,
                    top: AppValues.v8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.price +
                              widget.stores.price +
                              AppStrings.time24,
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: AppValues.v8),
                        ),
                        Text(
                          AppStrings.price +
                              getDiscount(30.0, 2, widget.stores.price) +
                              AppStrings.time48,
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: AppValues.v8),
                        ),
                        Text(
                          AppStrings.price +
                              getDiscount(40.0, 7, widget.stores.price) +
                              AppStrings.timeWeek,
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: AppValues.v8),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          buildDiscount(AppStrings.discount30),
                          const SizedBox(
                            height: 15,
                          ),
                          buildDiscount(AppStrings.discount40),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              buildDivider(),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppValues.v15,
                    right: AppValues.v5,
                    top: AppValues.v8),
                child: Text(
                  AppStrings.moreDetails.tr(),
                  style: getSemiBoldStyle(
                      color: ColorManager.black, fontSize: AppValues.v12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppValues.v15,
                    right: AppValues.v5,
                    top: AppValues.v8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.brandDetails.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: AppValues.v8),
                        ),
                        Text(
                          AppStrings.sizeDetails.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: AppValues.v8),
                        ),
                        Text(
                          AppStrings.codeForRentDetails.tr(),
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: AppValues.v8),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.stores.brand,
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: AppValues.v8),
                          ),
                          Text(
                            widget.stores.size,
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: AppValues.v8),
                          ),
                          Text(
                            getId(widget.stores.id),
                            style: getRegularStyle(
                                color: ColorManager.black,
                                fontSize: AppValues.v8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorManager.openPink,
                  boxShadow: [
                    BoxShadow(color: ColorManager.openPink, spreadRadius: 5),
                  ],
                ),
                height: 40,
                width: width,
                child: Center(
                  child: Text(
                    AppStrings.remember.tr(),
                    textScaler: const TextScaler.linear(2.0),
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: AppValues.v4),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Container buildDiscount(String discount) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorManager.openPink,
        boxShadow: [
          BoxShadow(color: ColorManager.openPink, spreadRadius: 5),
        ],
      ),
      height: 15,
      child: Center(
        child: Text(
          discount,
          textScaler: const TextScaler.linear(2.0),
          style: getSemiBoldStyle(
              color: ColorManager.black, fontSize: AppValues.v4),
        ),
      ),
    );
  }

  String getId(int code) {
    String id = '$code';
    return id;
  }

  Divider buildDivider() {
    return Divider(
      color: ColorManager.lightGrey,
      height: 0.5,
      thickness: 0.4,
      indent: 80,
      endIndent: 80,
    );
  }

  String getDiscount(double percentage, int numOfDay, String price) {
    double a = double.parse(price);
    double b = (a * numOfDay);
    double c = (percentage * b) / 100;
    double d = (b) - c;
    String f = '$d';
    return f;
  }
}
