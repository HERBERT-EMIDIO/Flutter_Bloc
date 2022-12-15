//Padrão Bloc : de 2017, baseado em stream, input e output são baseados em classe de eventos
import 'package:flutter/material.dart';

import 'clients_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Usando_Bloc',
      home: ClientsPage(),
    );
  }
}
