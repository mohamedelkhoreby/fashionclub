import 'package:fashionclub/app/extenstion.dart';

import '../../app/constant.dart';
import '../../domain/model/models.dart';
import '../response/responses.dart';

const empty = "";
const zero = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name?.orEmpty() ?? Constants.empty,
        this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone.orEmpty() ?? Constants.empty,
        this?.email.orEmpty() ?? Constants.empty,
        this?.link.orEmpty() ?? Constants.empty);
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  Service toDomain() {
    return Service(this?.id?.orZero() ?? zero, this?.title?.orEmpty() ?? empty,
        this?.image?.orEmpty() ?? empty);
  }
}

extension StoreResponseMapper on StoreResponse? {
  Store toDomain() {
    return Store(
      this?.id?.orZero() ?? zero,
      this?.title?.orEmpty() ?? empty,
      this?.brand?.orEmpty() ?? empty,
      this?.desc?.orEmpty() ?? empty,
      this?.price?.orEmpty() ?? empty,
      this?.size?.orEmpty() ?? empty,
      this?.image1?.orEmpty() ?? empty,
      this?.image2?.orEmpty() ?? empty,
      this?.image3?.orEmpty() ?? empty,
    );
  }
}

extension BannerResponseMapper on BannerResponse? {
  BannerAd toDomain() {
    return BannerAd(this?.id?.orZero() ?? zero, this?.title?.orEmpty() ?? empty,
        this?.image?.orEmpty() ?? empty, this?.link?.orEmpty() ?? empty);
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> mappedServices =
        (this?.data?.services?.map((service) => service.toDomain()) ??
                const Iterable.empty())
            .cast<Service>()
            .toList();

    List<Store> mappedStores =
        (this?.data?.stores?.map((store) => store.toDomain()) ??
                const Iterable.empty())
            .cast<Store>()
            .toList();

    List<BannerAd> mappedBanners =
        (this?.data?.banners?.map((bannerAd) => bannerAd.toDomain()) ??
                const Iterable.empty())
            .cast<BannerAd>()
            .toList();

    var data = HomeData(mappedServices, mappedStores, mappedBanners);
    return HomeObject(data);
  }
}
