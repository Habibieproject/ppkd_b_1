class Note {
  String id;
  String title;
  String description;
  bool isChecked;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.isChecked,
  });

  // Konversi dari Firestore ke Object
  factory Note.fromMap(Map<String, dynamic> data, String documentId) {
    return Note(
      id: documentId,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isChecked: data['isChecked'] ?? false,
    );
  }

  // Konversi ke Firestore
  Map<String, dynamic> toMap() {
    return {'title': title, 'description': description, 'isChecked': isChecked};
  }
}
