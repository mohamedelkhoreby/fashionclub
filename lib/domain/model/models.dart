// model onBoarding
class SliderObject {
  String title;
  String body;

  SliderObject(this.title, this.body);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

// login models
class Customer {
  String id;
  String name;
  int numOfNotifications;

  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;

  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;

  Authentication(this.customer, this.contacts);
}
// home model
class Service {
  int id;
  String title;
  String image;

  Service(this.id, this.title, this.image);
}

class Store{
  int id;
  String title;
  String brand;
  String desc;
  String price;
  String size;
  String image1;
  String image2;
  String image3;
  Store(this.id, this.title,this.brand,this.desc,this.price,this.size,this.image1,this.image2,this.image3);
}

class BannerAd {
  int id;
  String title;
  String image;
  String link;

  BannerAd(this.id, this.title, this.image, this.link);
}

class HomeData {
  List<Service> services;
  List<Store> stores;
  List<BannerAd> banners;

  HomeData(this.services, this.stores, this.banners);
}

class HomeObject {
  HomeData data;
  HomeObject(this.data);
}
class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}