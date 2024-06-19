import 'package:cloud_firestore/cloud_firestore.dart';

class Pegawai {
  final String? id;
  final String? nm_pegawai;
  final String? nip;
  final String? nomor_telepon;
  final String? email;
  final String? password;
  final String? tanggal_lahir;

  Pegawai({this.id, this.nip, this.nm_pegawai, this.nomor_telepon, this.email, this.password, this.tanggal_lahir});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nip': nip,
      'nm_pegawai': nm_pegawai,
      'nomor_telepon': nomor_telepon,
      'email': email,
      'password': password,
      'tanggal_lahir': tanggal_lahir,
    };
  }

  Pegawai.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        nm_pegawai = doc.data()!['nm_pegawai'],
        nip = doc.data()!['nip'],
        nomor_telepon = doc.data()!['nomor_telepon'],
        email = doc.data()!['email'],
        password = doc.data()!['password'],
        tanggal_lahir = doc.data()!['tanggal_lahir'];
}