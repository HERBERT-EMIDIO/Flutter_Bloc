import 'package:usando_bloc/blocs/client.dart';

class ClientsRepository {
  final List<Client> _clients = [];

  List<Client> loadClients() {
    _clients.addAll([
      Client(nome: "Lionel Messi "),
      Client(nome: "Neymar Júnior"),
      Client(nome: "Kylian Mbappé"),
      Client(nome: "Herbert Felipe"),
    ]);
    return _clients;
  }

  List<Client> addClient(Client client) {
    _clients.add(client);
    return _clients;
  }

  List<Client> removeClient(Client client) {
    _clients.remove(client);
    return _clients;
  }
}
