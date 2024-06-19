import 'package:flutter/material.dart';
import 'package:klinik_app/model/pasien.dart';
import 'package:klinik_app/service/pasien_service.dart';
import 'package:klinik_app/ui/pasien_form_page.dart';
import 'package:klinik_app/ui/pasien_item_page.dart';
import 'package:klinik_app/ui/poli_form_page.dart';
import 'package:klinik_app/ui/poli_item_page.dart';
import 'package:klinik_app/widget/sidebar.dart';
import '../model/poli.dart';
import '../service/poli_service.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  PasienService _pasienService = PasienService();
  Future<List<Pasien>>? _pasienList;
  List<Pasien>? _retrievedPasienList;

  Future<void> _initRetrieval() async {
    _pasienList = _pasienService.retrievePasien();
    _retrievedPasienList = await _pasienService.retrievePasien();
  }

  @override
  void initState() {
    super.initState();
    _initRetrieval();
  }

  Future refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      _initRetrieval();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PasienForm()));
            },
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: FutureBuilder(
          future: _pasienList,
          builder: (BuildContext context, AsyncSnapshot<List<Pasien>> snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: _retrievedPasienList!.length,
              itemBuilder: (context, index){
                var pasien = _retrievedPasienList![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.redAccent,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.delete, color: Colors.white,),
                  ),
                  onDismissed: (direction){
                    _pasienService.deletePasien(pasien.id!);
                  },
                  direction: DismissDirection.endToStart,
                  child: PasienItemPage(pasien: pasien),
                );
              }
            );
          }
        ),
      ),
    );
  }
}
