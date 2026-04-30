import 'package:flutter/material.dart';
import '../models/localizacao.dart';
import 'package:geolocator/geolocator.dart';

class TelaAmbientesCadastrados extends StatelessWidget {
  const TelaAmbientesCadastrados({super.key});

  @override
  Widget build(BuildContext context) {

    Future<Position?> getUserLocation() async {
      try {
        // Verifica permissão
        LocationPermission permission = await Geolocator.checkPermission();

        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
        }

        if (permission == LocationPermission.deniedForever) {
          print('Permissão negada permanentemente');
          return null;
        }

        // Obtém localização
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );

        return position;
      } catch (e) {
        print('Erro ao obter localização: $e');
        return null;
      }
    }

    void loadLocation() async {
      final pos = await getUserLocation();

      if (pos != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Localização atual"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Latitude: ${pos.latitude}'),
                  Text('Longitude: ${pos.longitude}')
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text("Entendido"),
                  onPressed: () {
                    Navigator.of(context).pop(); // Fecha o alerta
                  },
                ),
              ],
            );
          },
        );
      }
    }
    
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white), 
        backgroundColor: const Color.fromARGB(255, 138, 18, 236),
      ),
      body: Center(
        child: 
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 450,
            ),
            child: 
              Row(
                mainAxisAlignment: .center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: loadLocation,
                    child: Text("Obter localização"),
                  ),

                  SizedBox(
                    width: 350,
                    child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (context, index) {
                        final item = lista[index];

                        return Padding(
                          padding: EdgeInsets.all(16),
                          child: Card(
                            elevation: 5,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                Text('${item.nome}', style: TextStyle(fontWeight: FontWeight.bold),),

                                const SizedBox(height: 10),

                                Text('Latiude: ${item.lat}'),
                                Text('Longitude: ${item.lng}'),
                                const SizedBox(height: 10),

                                Text('Nível: ${item.nivel}'),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),  
                        );
                      },
                    )
                  ),

                  /*Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(12),
                      child: Column(
                        children: [
                          Text("Latitude: ?"),
                          Text("Longitude: ?")
                        ],
                      ),
                    ),
                  ),

                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Text("Latitude: ?"),
                        Text("Longitude: ?")
                      ],
                    ),
                  ),*/
                ],
          ),
        ),
      ),
    );
  }
}
