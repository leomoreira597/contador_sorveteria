import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrementa() {
    setState(() {
      count --;
    });
    print (count);
  }

  void encrementa() {
    setState(() {
      count ++;
    });
    print (count);
  }

  bool get seVazio => count == 0;
  bool get seCheio => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imagens/sorvete.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                seCheio ? 'Lotado!!' : 'Pode entrar!',
                style: TextStyle(
                  fontSize: 30,
                  color: seCheio ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(padding: const EdgeInsets.all(32),
                child: Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 100,
                    color: seCheio ? Colors.red : Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: seVazio ? null : decrementa,
                    style: TextButton.styleFrom(
                      backgroundColor: seVazio ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Saiu',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  TextButton(
                    onPressed: seCheio ? null : encrementa,
                    style: TextButton.styleFrom(
                      backgroundColor: seCheio ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Entrou!!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}


