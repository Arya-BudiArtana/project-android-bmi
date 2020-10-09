import 'package:flutter/material.dart';
import 'dart:math';
import 'about.dart';

class BMIResult extends StatelessWidget {
  BMIResult(
      {@required this.tinggi_badan,
      @required this.berat_badan,
      @required this.nama_user,
      @required this.jenis_kelamin,
      @required this.tanggal,
      @required this.bulan,
      @required this.tahun,
      @required this.year_now});
  final int tinggi_badan;
  final int berat_badan;
  final String nama_user;
  final String jenis_kelamin;
  final int tanggal;
  final int bulan;
  final int tahun;
  final int year_now;

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    double rec = 18.5* pow(tinggi_badan / 100, 2);
    double rec1 = 24.9* pow(tinggi_badan / 100, 2);
    String rec2 = rec.toStringAsFixed(2);
    String rec3 = rec1.toStringAsFixed(2);
    int umur = year_now - tahun;
    String cBMI;
    String nama = nama_user.toLowerCase();
    String jk = jenis_kelamin.toLowerCase();
    if (bmi>=30) cBMI="Obese";
    else if (bmi>=25) cBMI="Overweight";
    else if (bmi>=18.5) cBMI="Normal";
    else cBMI="Underweight";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text('BMI Checker'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutRoute()),
              );
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

              Center(
              child: Container(
                child: Text(
                  "$nama",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 66,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue,
                  ),
                  
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(50.0),
                child: Text(
                  "$jk/$umur Tahun",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),

            Text(
              cBMI.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.red[200],
              ),
            ),
            Text(
              "Normal BMI Range",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.blue[800],
              ),
            ),
            Text(
              "18,5 - 24,9",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.orange,
              ),
            ),
             Center(
              child: Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "Berat badan yang harus anda capai agar BMI Normal adalah:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.redAccent,
                  ),
                  
                ),
              ),
            ),
            
            Text(
              "$rec2 Kg - $rec3 Kg",
              style: TextStyle(
                fontSize: 37,
                fontWeight: FontWeight.w800,
                color: Colors.blue[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
