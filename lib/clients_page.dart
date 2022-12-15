import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usando_bloc/blocs/client.dart';
import 'package:usando_bloc/blocs/client_events.dart';
import 'package:usando_bloc/blocs/client_state.dart';
import 'blocs/client_bloc.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  //final clientsList = [];
  late final ClientBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ClientBloc();
    bloc.add(LoadClientEvent());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  String randomName() {
    final rand = Random();
    return "Edson Arantes do Nascimento";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOGADORES'),
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              bloc.add(
                AddClientEvent(
                  client: Client(
                    nome: randomName(),
                  ),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: BlocBuilder<ClientBloc, ClientState>(
              bloc: bloc,
              builder: (context, state) {
                if (state is ClientInitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ClientSuccessState) {
                  final clientsList = state.clients;

                  //final clientsList = snapshot.data?.clients ?? [];
                  return ListView.separated(
                    itemCount: clientsList.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: ClipRect(
                          child: Text(clientsList[index].nome.substring(0, 1)),
                        ),
                      ),
                      title: Text(clientsList[index].nome),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          bloc.add(
                            RemoveClientEvent(
                              client: clientsList[index],
                            ),
                          );
                        },
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                  );
                }
                return Container();
              }),
        ),
      ),
    );
  }
}
