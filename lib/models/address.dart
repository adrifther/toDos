
class Address{
  String street;
  String suite;
  String zipcode;

  Address({required this.street, required this.suite, required this.zipcode});

  factory Address.fromJson(Map<String,dynamic> json){
    return Address(
        street: json["street"],
        suite: json["suite"],
        zipcode: json["zipcode"]);
  }

}