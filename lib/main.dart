import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TelaImc(),
    );
  }
}

class TelaImc extends StatefulWidget {
  const TelaImc({Key? key}) : super(key: key);

  @override
  State<TelaImc> createState() => _TelaImcState();
}

class _TelaImcState extends State<TelaImc> {
  TextEditingController controllerAlt = TextEditingController();
  TextEditingController controllerPeso = TextEditingController();

  String apertarBtn() {
    double altura = double.parse(controllerAlt.value.text);
    double peso = double.parse(controllerPeso.value.text);

    double auxiliar = altura * altura;
    double resposta = peso / auxiliar;

    print(resposta);
    return resposta.toStringAsFixed(2);
  }

  String resultado() {
    double value = double.parse(apertarBtn());

    if (value <= 18.5) {
      return "Magreza";
    } else if (value >= 18.5 && value <= 24.9) {
      return "Saudável";
    } else if (value >= 25 && value <= 29.9) {
      return "Sobrepeso";
    } else if (value >= 30 && value <= 34.9) {
      return "Obesidade grau l";
    } else if (value >= 35 && value <= 39.9) {
      return "Obesidade grau ll (severa)";
    } else {
      return "Obesidade grau lll (morbida)";
    }
  }

  Color? getColor() {
    double value = double.parse(apertarBtn());

    if (value <= 18.5) {
      return Colors.grey;
    } else if (value > 18.5 && value <= 24.9) {
      return Colors.green.shade700;
    } else if (value > 25 && value <= 29.9) {
      return Colors.yellow.shade700;
    } else if (value > 30 && value <= 34.9) {
      return Colors.orange;
    } else if (value > 35 && value <= 39.9) {
      return Colors.red;
    } else {
      return Colors.red.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de IMC")),
      body: Stack(
        children: [
          Container(
            color: Colors.green.shade50,
          ),
          Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Coloque a altura com o "."'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 70,
                        width: 150,
                        child: TextFormField(
                          controller: controllerAlt,
                          decoration:
                          const InputDecoration(hintText: "Digite o Altura..."),
                        )),
                    // SizedBox(width: 50,),
                    SizedBox(
                        height: 70,
                        width: 150,
                        child: TextFormField(
                          controller: controllerPeso,
                          decoration:
                          const InputDecoration(hintText: "Digite a Peso..."),
                        )),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    apertarBtn();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            content: Stack(
                              clipBehavior: Clip.none, alignment: Alignment.center,
                              children: <Widget>[
                                Container(
                                  width: double.infinity,
                                  height: 350,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        'RESULTADO DO SEU IMC',
                                        style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        apertarBtn().toString(),
                                        style: TextStyle(
                                          color: Colors.grey.shade700,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        resultado(),
                                        style: TextStyle(color: getColor(),fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.shade300,
                                                spreadRadius: 10,
                                                blurRadius: 40,
                                                offset: const Offset(0,0),
                                              )
                                            ]
                                        ),
                                        child: Container(
                                          child: Image.network(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1FgXIILjJ4oVHa9K2ZvS5tDNriBGpNfFg18qTG9_aMBdcjGIp1LOKx8KiEYvyQy2Ognc&usqp=CAU"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                    top: -80,
                                    child: Container(
                                        height: 120,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50)
                                        ),
                                        child: Image.network(
                                            "https://play-lh.googleusercontent.com/4JEFuhpoYnHFMk2xYO9HbS-wYBZq7CPXtzxE2vEAGYg3EvNr0dRNUyB1YYDw-sONXw",
                                            width: 150,
                                            height: 150)))
                              ],
                            ));
                      },
                    );
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       content: Column(
                    //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //         children: [
                    //           Text(
                    //             resultado(),
                    //           ),
                    //           Text(
                    //             apertarBtn().toString(),
                    //           ),
                    //           Container(
                    //             decoration: BoxDecoration(
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: Colors.grey.shade300,
                    //                   spreadRadius: 10,
                    //                   blurRadius: 40,
                    //                   offset: Offset(0,0),
                    //                 )
                    //               ]
                    //             ),
                    //             child: Image.network(
                    //                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1FgXIILjJ4oVHa9K2ZvS5tDNriBGpNfFg18qTG9_aMBdcjGIp1LOKx8KiEYvyQy2Ognc&usqp=CAU"),
                    //           )
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // );
                  },
                  child: const Text('VER IMC'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}