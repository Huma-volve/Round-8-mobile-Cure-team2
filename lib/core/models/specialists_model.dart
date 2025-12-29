class SpecialistsModel{
  final int id ;
  final String name ;
  final String? icon;
  SpecialistsModel({
    required this.id,
    required this.name,
     this.icon
    });
factory SpecialistsModel.fromJson(Map<String,dynamic>json)=>SpecialistsModel(
    id: json['id'],
    name: json['name'],
    icon: json['icon']) ; 






}