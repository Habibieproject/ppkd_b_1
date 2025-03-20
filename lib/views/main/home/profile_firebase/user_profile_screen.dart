import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ppkd_b_1/service/profile_service.dart';
import 'package:ppkd_b_1/views/main/home/profile_firebase/model/profile_firebase.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserProfileService _userService = UserProfileService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  XFile? _selectedImage;
  String? _imageUrl;
  String? _userUid;

  @override
  void initState() {
    super.initState();
    _userUid = FirebaseAuth.instance.currentUser?.uid;
  }

  // **1️⃣ Pilih Gambar dari Galeri**
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() => _selectedImage = image);
  }

  // **2️⃣ Tambah Data Profil**
  Future<void> _addUserProfile() async {
    if (_nameController.text.isEmpty ||
        _addressController.text.isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Semua field harus diisi")));
      return;
    }

    String? imageUrl = await _userService.uploadImage(
      _userUid!,
      _selectedImage!,
    );
    if (imageUrl != null) {
      UserProfileModel newUser = UserProfileModel(
        id: '',
        uid: _userUid!,
        name: _nameController.text,
        address: _addressController.text,
        imageUrl: imageUrl,
      );

      await _userService.addUserProfile(newUser);
      _nameController.clear();
      _addressController.clear();
      setState(() => _selectedImage = null);
    }
  }

  // **3️⃣ Tampilkan Data dalam ListView**
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Profiles")),
      body: StreamBuilder<List<UserProfileModel>>(
        stream: _userService.getUserProfiles(_userUid!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("Belum ada data pengguna"));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                title: Text(user.name),
                subtitle: Text(user.address),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _userService.deleteUserProfile(user.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  // **4️⃣ Dialog Tambah Data**
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tambah Profil"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: "Nama"),
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: "Alamat"),
              ),
              _selectedImage == null
                  ? Text("Pilih Gambar")
                  : Image.file(File(_selectedImage!.path), height: 100),
              TextButton(onPressed: _pickImage, child: Text("Pilih Gambar")),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Batal"),
            ),
            ElevatedButton(onPressed: _addUserProfile, child: Text("Simpan")),
          ],
        );
      },
    );
  }
}
