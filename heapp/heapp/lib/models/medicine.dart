class Medicine {
  final String name;
  final String type;
  final String iconDataPath;
  final int medicineColorIndex;
  Medicine({this.name, this.type, this.iconDataPath, this.medicineColorIndex});

  factory Medicine.fromDocument(Map<String, dynamic> docdata) {
    return Medicine(
      name: docdata["name"],
      type: docdata["type"],
      iconDataPath: docdata["iconDataPath"],
      medicineColorIndex: docdata["medicineColorIndex"],
    );
  }

  factory Medicine.returner() {
    return Medicine(name: "AAAA", type: "MAJE", medicineColorIndex: 0);
  }

  factory Medicine.returner2() {
    return Medicine(name: "EEEE", type: "DRUG", medicineColorIndex: 2);
  }
}
