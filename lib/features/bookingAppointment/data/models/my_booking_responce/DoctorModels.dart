class DoctorModels {
  final int? id;
  final String? name;
  final String? image;
  final dynamic spec;
  final dynamic address;

  const DoctorModels({this.id, this.name, this.image, this.spec, this.address});

  factory DoctorModels.fromJson(Map<String, dynamic> json) => DoctorModels(
    id: json['id'] as int?,
    name: json['name'] as String?,
    image: json['image'] as String?,
    spec: json['spec'] as dynamic,
    address: json['address'] as dynamic,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'spec': spec,
    'address': address,
  };
}
