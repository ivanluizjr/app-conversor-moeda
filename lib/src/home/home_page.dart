import 'package:flutter/material.dart';
import 'package:projeto/src/home/home_controller.dart';
import 'package:projeto/src/home/repositories/api_hgbrasil.dart';
import 'package:projeto/src/shared/widgets/buildTextField.dart';
import '../shared/constants/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final api = ApiHgBrasil();
  final controller = HomePageController();

  @override
  Widget build(BuildContext context) {
    const String tituloApp = 'Conversor de Moedas';
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(tituloApp),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
        future: api.getData(),
        builder: (context, snapshot) {
          //*============== Inicio Switch ===================
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: Text(
                  kSwtichText,
                  style: TextStyle(color: Colors.green, fontSize: 30.0),
                  textAlign: TextAlign.center,
                ),
              );
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    kDefaultText,
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                );
              } else {
                controller.dolar =
                    snapshot.data!["results"]["currencies"]["USD"]["buy"];
                controller.euro =
                    snapshot.data!["results"]["currencies"]["EUR"]["buy"];

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.attach_money,
                        size: 180.0,
                        color: Colors.green,
                      ),
                      BuildTextField(
                        label: kReal,
                        prefix: kSimbolReal,
                        controller: controller.realController,
                        onChanged: controller.realChanged,
                      ),
                      const Divider(),
                      BuildTextField(
                        label: kDolar,
                        prefix: kSimbolDolar,
                        controller: controller.dolarController,
                        onChanged: controller.dolarChanged,
                      ),
                      const Divider(),
                      BuildTextField(
                        label: kEuros,
                        prefix: kSimbolEuro,
                        controller: controller.euroController,
                        onChanged: controller.euroChanged,
                      ),
                    ],
                  ),
                );
              }
          }
          //*============== Fim Switch ===================
        },
      ),
    );
  }
}
