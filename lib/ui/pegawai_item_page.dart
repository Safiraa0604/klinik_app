import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/ui/pegawai_detail_page.dart';
import '../../model/poli.dart';
import 'poli_detail_page.dart';

class PegawaiItemPage extends StatelessWidget {
  final Pegawai pegawai;

  const PegawaiItemPage({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(context, MaterialPageRoute(builder:
            (context) => PegawaiDetailPage(pegawai: pegawai)));
      },
      child: Card(
        elevation: 2,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          title: Text(pegawai.nm_pegawai!, style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
