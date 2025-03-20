class UserProfileModel {
  String id;
  String uid;
  String name;
  String address;
  String imageUrl;

  UserProfileModel({
    required this.id,
    required this.uid,
    required this.name,
    required this.address,
    required this.imageUrl,
  });

  // Konversi dari Firestore ke Object
  factory UserProfileModel.fromMap(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return UserProfileModel(
      id: documentId,
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      address: data['address'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
    );
  }

  // Konversi ke Firestore
  Map<String, dynamic> toMap() {
    return {'uid': uid, 'name': name, 'address': address, 'imageUrl': imageUrl};
  }
}
