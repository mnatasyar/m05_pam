import 'package:flutter/material.dart';
import 'package:m05/pertemuan05/pertemuan05_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan05Screen extends StatefulWidget {
  Pertemuan05Screen({Key? key}) : super(key: key);
  @override
  State<Pertemuan05Screen> createState() => _Pertemuan05ScreenState();
}

class _Pertemuan05ScreenState extends State<Pertemuan05Screen> {
  bool? soal1a = false;
  bool? soal1b = false;

  String soal2 = 'answ';

  bool kelasPagi = false;
  bool kelasSiang = false;

  bool tkj = false;
  bool rpl = false;
  bool sma = false;
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan05Provider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('M. Natasya Ramadan - 211112080'),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  '1. Memori yang berfungsi untuk tempat penyimpanan data sementara disebut....'),
              Row(
                children: [
                  Text('a.'),
                  SizedBox(
                    width: 15,
                  ),
                  Checkbox(
                      value: soal1a,
                      onChanged: (val) {
                        setState(() {
                          soal1a = val;
                        });
                      }),
                  Text('RAM'),
                ],
              ),
              Row(children: [
                Text('b.'),
                SizedBox(
                  width: 15,
                ),
                Checkbox(
                    value: soal1b,
                    onChanged: (val) {
                      setState(() {
                        soal1b = val;
                      });
                    }),
                Text('Random Access Memory'),
              ]),
              if (soal1a == false && soal1b == false)
                Container()
              else if (soal1a == true && soal1b == true)
                Text('Jawaban sudah benar',
                    style: TextStyle(color: Colors.green))
              else
                Text('Jawaban masih salah, coba lagi',
                    style: TextStyle(color: Colors.red)),
              const Text('2. Skema desain pembangunan jaringan disebut.....'),
              Row(
                children: [
                  Text('a.'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: 'Topologi',
                      groupValue: soal2,
                      onChanged: (val) {
                        setState(() {
                          soal2 = 'Topologi';
                        });
                      }),
                  Text('Topologi')
                ],
              ),
              Row(
                children: [
                  Text('b.'),
                  SizedBox(
                    width: 15,
                  ),
                  Radio(
                      value: 'Desain Jaringan',
                      groupValue: soal2,
                      onChanged: (val) {
                        setState(() {
                          soal2 = 'Desain Jaringan';
                        });
                      }),
                  Text('Desain Jaringan')
                ],
              ),
              if (soal2 == 'Desain Jaringan')
                Text('Masih Salah Masbroo!',
                    style: TextStyle(color: Colors.red))
              else if (soal2 == 'Topologi')
                Text('Benar!', style: TextStyle(color: Colors.green)),
              Text('Feedback Soal'),
              Text('Kelas'),
              Row(
                children: [
                  ChoiceChip(
                    label: Text('Pagi'),
                    selectedColor: Colors.blue[300],
                    selected: kelasPagi,
                    onSelected: (val) {
                      setState(() {
                        kelasPagi = val;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ChoiceChip(
                    label: Text('Siang'),
                    selectedColor: Colors.blue[300],
                    selected: kelasSiang,
                    onSelected: (val) {
                      setState(() {
                        kelasSiang = val;
                      });
                    },
                  ),
                ],
              ),
              const Text('Soal di atas telah dipelajari saat?..'),
              Row(
                children: [
                  FilterChip(
                      label: Text('Sekolah'),
                      selectedColor: Colors.blue[200],
                      selected: prov.statusSekolah,
                      onSelected: (val) {
                        prov.setSekolah = val;
                      }),
                  const SizedBox(
                    width: 15,
                  ),
                  FilterChip(
                      label: Text('Praktikum'),
                      selected: prov.statusPraktik,
                      onSelected: (val) {
                        prov.setPraktik = val;
                      }),
                  const SizedBox(
                    width: 15,
                  ),
                  FilterChip(
                      label: Text('Kursus'),
                      selected: prov.statusKursus,
                      onSelected: (val) {
                        prov.setKursus = val;
                      }),
                ],
              ),
              const Text('Peminatan saat sekolah?'),
              Container(
                child: Row(
                  children: [
                    Text(
                        "Peminatan yang dipilih: ${prov.selectedPeminatan.join(', ')}"),
                  ],
                ),
              ),
              Row(
                children: [
                  InputChip(
                    label: Text('TKJ'),
                    selectedColor: Colors.blue[300],
                    onSelected: (val) {
                      prov.togglePeminatan('TKJ');
                    },
                    selected: prov.selectedPeminatan.contains('TKJ'),
                  ),
                  InputChip(
                    label: Text('RPL'),
                    selectedColor: Colors.blue[300],
                    onSelected: (val) {
                      prov.togglePeminatan('RPL');
                    },
                    selected: prov.selectedPeminatan.contains('RPL'),
                  ),
                  InputChip(
                    label: Text('SMA'),
                    selectedColor: Colors.blue[300],
                    onSelected: (val) {
                      prov.togglePeminatan('SMA');
                    },
                    selected: prov.selectedPeminatan.contains('SMA'),
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
