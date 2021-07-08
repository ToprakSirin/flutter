import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class DateTimePickerKullanimi extends StatefulWidget {
  @override
  _DateTimePickerKullanimiState createState() =>
      _DateTimePickerKullanimiState();
}

class _DateTimePickerKullanimiState extends State<DateTimePickerKullanimi> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();
    DateTime firstDate = DateTime(2021, suan.month - 3);
    DateTime lastDate = DateTime(2021, suan.month, suan.day + 20);

    TimeOfDay suankiSaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(
        title: Text("Date  Time Picker"),
        backgroundColor: Colors.orange.shade400,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green),
                child: Text("Tarih Seç"),
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: suan,
                    firstDate: firstDate,
                    lastDate: lastDate,
                  ).then(
                    (secilenTarih) {
                      debugPrint(secilenTarih.toString());
                      debugPrint(secilenTarih!.toIso8601String());
                      debugPrint(
                          secilenTarih.millisecondsSinceEpoch.toString());
                      debugPrint(secilenTarih.toUtc().toIso8601String());
                      debugPrint(
                          secilenTarih.add(Duration(days: 20)).toString());
                      var yeniDate = DateTime.parse(
                          secilenTarih.toUtc().toIso8601String());
                      debugPrint(yeniDate.toIso8601String());
                      print(formatDate(secilenTarih, [yyyy, '-', mm, '-', dd]));
                      print(formatDate(secilenTarih, [dd, '-', mm, '-', dd]));
                    },
                  );
                },
              ),
              ElevatedButton(
                child: Text('Saat Seç'),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () {
                  showTimePicker(context: context, initialTime: suankiSaat)
                      .then((secilenSaat) {
                    debugPrint(secilenSaat!.format(context));
                    debugPrint(secilenSaat.hour.toString() +
                        ":" +
                        secilenSaat.minute.toString());
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
