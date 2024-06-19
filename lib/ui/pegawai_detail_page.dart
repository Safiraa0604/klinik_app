import 'package:flutter/material.dart';
import 'package:klinik_app/model/pegawai.dart';
import 'package:klinik_app/service/pegawai_service.dart';
import 'package:klinik_app/service/poli_service.dart';
import 'package:klinik_app/ui/pegawai_form_page.dart';
import 'package:klinik_app/ui/pegawai_form_update.dart';
import 'package:klinik_app/ui/poli_form_page.dart';
import 'package:klinik_app/ui/poli_form_update_page.dart';
import '../model/poli.dart';

class PegawaiDetailPage extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetailPage({super.key, required this.pegawai});

  @override
  State<PegawaiDetailPage> createState() => _PegawaiDetailPageState();
}

class _PegawaiDetailPageState extends State<PegawaiDetailPage> {
  PegawaiService _pegawaiServiceNew = PegawaiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pegawai"),),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama Pegawai : ${widget.pegawai.nm_pegawai!}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _tombolubah(),
              _tombolhapus()
            ],
          )
        ],
      )
    );
  }

  _tombolubah(){
    return ElevatedButton(
      onPressed: (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PegawaiUpdateForm(pegawai: widget.pegawai))
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
      child: Text("Ubah"),
    );
  }

  _tombolhapus(){
    return ElevatedButton(
      onPressed: (){
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            // tombol ya
            ElevatedButton(
              onPressed: () async {
                await _pegawaiServiceNew.deletePegawai(widget.pegawai.id!);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PegawaiForm()));
              },
              child: Text("YA"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            ),

            // tombol batal
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Tidak"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey, foregroundColor: Colors.black),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
      child: Text("Hapus"),
    );
  }
}
