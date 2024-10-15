
import 'address.dart';
import 'company.dart';

class User{
  int id;
  String name;
  String username;
  String email;
  Company company;
  Address address;

  User({
    required this.id,
    required this.name, 
    required this.username,
    required this.email,
    required this.company,
    required this.address
  });

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      company: Company.fromJson(json["company"]),
      address: Address.fromJson(json["address"])
    );
  }

  @override
  String toString(){
    return "User $name with email ${email} from ${company.name}";
  }


}