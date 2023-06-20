class AppLaunchUrl{
  static Uri twitterUrl = Uri.parse('https://twitter.com/fashionclub23');
  static Uri instagramUrl= Uri.parse('https://www.instagram.com/fashionclub1653/');
  static Uri whatsappUrl= Uri.parse("https://wa.me/qr/EJ2DXIQ53AYLN1");
  static Uri emailLaunchUri =Uri(
    scheme: 'mailto',
    path: 'fc9883997@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'Rent some item',
      'body':'Code item:  \n period Rent:  \n size :  \n location:'
    }),
  );
  static Uri contactEmailUri =Uri(
    scheme: 'mailto',
    path: 'fc9883997@gmail.com',
    query: encodeQueryParameters(<String, String>{
      'subject': 'your complaints',
      'body':'Explain your complaints in detail and we will help you '
    }),
  );
}
String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}