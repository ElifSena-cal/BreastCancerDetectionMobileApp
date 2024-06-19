import 'package:flutter/material.dart';

import 'features/data/view/data_entry_view.dart';
import 'features/data/view/train_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTabs(),
    );
  }
}

class MyTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Toplam sekme sayısı
      child: Scaffold(
        appBar: AppBar(
          title: Text('Breast Cancer Detection'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Train'), // İlk sekme
              Tab(text: 'Data Entry'), // İkinci sekme
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TrainPage(), // İlk sekme içeriği
            DataEntryPage(), // İkinci sekme içeriği
          ],
        ),
      ),
    );
  }
}
