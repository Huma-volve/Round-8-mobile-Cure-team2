class ListViewModel {
  final String urlImage;
  final String medicalSpecialty;

  ListViewModel({required this.urlImage, required this.medicalSpecialty});
}

class ClassName {
  List<ListViewModel> get listModel => [
        ListViewModel(urlImage: '', medicalSpecialty: ''),
        ListViewModel(urlImage: '', medicalSpecialty: ''),
        ListViewModel(urlImage: '', medicalSpecialty: ''),
        ListViewModel(urlImage: '', medicalSpecialty: ''),
        ListViewModel(urlImage: '', medicalSpecialty: ''),
      ];
}
