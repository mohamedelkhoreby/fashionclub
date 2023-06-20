import 'package:splashscreen/app/constant.dart';
import 'package:splashscreen/app/extenstion.dart';
import 'package:splashscreen/data/response/responses.dart';
import 'package:splashscreen/domain/model/models.dart';
const EMPTY = "";
const ZERO = 0;
extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id.orEmpty() ?? Constants.empty,
        this?.name.orEmpty() ?? Constants.empty,
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
extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}
extension ForgotPasswordResponseMapper on ForgotPasswordResponse? {
  String toDomain() {
    return this?.support?.orEmpty() ?? Constants.empty;
  }
}
extension ServiceResponseMapper on ServiceResponse? {
  Service toDomain() {
    return Service(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY);
  }
}

extension StoreResponseMapper on StoreResponse? {
  Store toDomain() {
    return Store(
        this?.id?.orZero() ?? ZERO,
        this?.title?.orEmpty() ?? EMPTY,
        this?.brand?.orEmpty() ?? EMPTY,
        this?.desc?.orEmpty() ?? EMPTY,
        this?.price?.orEmpty() ?? EMPTY,
        this?.size?.orEmpty() ?? EMPTY,
        this?.image1?.orEmpty() ?? EMPTY,
        this?.image2?.orEmpty() ?? EMPTY,
        this?.image3?.orEmpty() ?? EMPTY,
    );
  }
}

extension BannerResponseMapper on BannerResponse? {
  BannerAd toDomain() {
    return BannerAd(this?.id?.orZero() ?? ZERO, this?.title?.orEmpty() ?? EMPTY,
        this?.image?.orEmpty() ?? EMPTY, this?.link?.orEmpty() ?? EMPTY);
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