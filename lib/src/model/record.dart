class Records {
  final String name;
  final String address;
  final String contact;
  final String photo;
  final String url;

  Records(
      {required this.name,
      required this.address,
      required this.contact,
      required this.photo,
      required this.url});

  factory Records.fromJSON(Map<String, dynamic> json) {
    return Records(
        name: json["name"],
        address: json["address"],
        contact: json["contact"],
        photo: json["photo"],
        url: json["url"]);
  }
}
