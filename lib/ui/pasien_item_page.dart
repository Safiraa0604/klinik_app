import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/ui/pasien_detail_page.dart';
import '../../model/poli.dart';
import 'poli_detail_page.dart';

class PasienItemPage extends StatelessWidget {
  final Pasien pasien;

  const PasienItemPage({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => PasienDetailPage(pasien: pasien)));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(pasien.nm_pasien!, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
