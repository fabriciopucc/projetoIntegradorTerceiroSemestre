import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class BotaoBuscarLocalizacao extends StatelessWidget {
  
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
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: loadLocation,
          child: Text("Obter localização"),
        ),
      ),
    );
  }
}