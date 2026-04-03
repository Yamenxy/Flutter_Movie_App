
class Profilemodel {
  static const String collectionName="ProfileCollection";
  String id;
  String? image;
  String? name;
  String? phone;
  Profilemodel({
    required this.id,
    this.image,
     this.name,
     this.phone,
});
  factory Profilemodel.fromFireStore(Map<String,dynamic> json,String id){
    return Profilemodel(
      id: id,
      image: json["image"],
      name: json["name"],
      phone: json["phone"],
    );
  }
  Map<String,dynamic> toFireStore(){
    return{
      "id":id,
      "image":image,
      "name":name,
      "phone":phone,

    };
  }
}