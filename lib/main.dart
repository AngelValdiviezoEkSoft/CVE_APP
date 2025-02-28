import 'dart:io';

import 'package:flutter/material.dart';
import 'package:info_cv_app/auth_service.dart';
import 'package:info_cv_app/page_navigate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MultiProvider(
      providers:[
        ChangeNotifierProvider(
          create: (_) => AuthService(),
          lazy: false,
        ),
      ],
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen()
    );
  }
}
//////////

class LoginScreen extends StatelessWidget {

  const LoginScreen(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF2EA3F2),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF2EA3F2),        
        title: const Center(child: Text("Ingrese sus credenciales", style: TextStyle(color: Colors.white),)),
      ),
      body: Center(
        child: Container(
          width: size.width,//double.infinity,
          height: size.height * 0.98,//* 1.3
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,   // Inicia desde la parte superior derecha
              end: Alignment.bottomLeft,
              colors: [Colors.blue.shade600, Colors.blue.shade600, Colors.white],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  width: size.width * 0.9,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    '¡Bienvenido de nuevo!',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                /*
                TextField(
                  decoration: InputDecoration(labelText: 'Usuario'),
                ),
                */
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: '',
                    labelText: 'Usuario',
                    labelStyle: TextStyle(color: Colors.white)
                  ),
                  //onChanged: (value) => loginForm.email = value,
                  /*
                  validator: (value) {
                    String pattern = regularExp.regexToEmail;
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El valor ingresado no luce como un correo';
                  },
                  */
                ),
                /*
                TextField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
                */
                SizedBox(height: size.height * 0.07,),
          
                TextField(
                  style: const TextStyle(color: Colors.white),
                      obscureText: authService.varIsOscured,
                      //controller: passWordTxt,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.white),
                        labelText: 'Contraseña',
                        suffixIcon: 
                        !authService.varIsOscured
                          ? IconButton(
                              onPressed: () {
                                authService.varIsOscured =
                                    !authService.varIsOscured;
                              },
                              icon: const Icon(Icons.visibility,
                                  size: 24,
                                  color: Colors.white),
                            )
                          : IconButton(
                              onPressed: () {
                                authService.varIsOscured =
                                    !authService.varIsOscured;
                              },
                              icon: const Icon(
                                  size: 24,
                                  Icons.visibility_off,
                                  color: Colors.white),
                            ),                                
                        
                      ),
                    ),
                  
                SizedBox(height: size.height * 0.07),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 115.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Acceder',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////

class InfoScreen extends StatelessWidget {

  const InfoScreen(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Información')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 115.0),
              child: ElevatedButton(
                onPressed: () => launchUrl(Uri.parse('https://www.youtube.com/@centrodeviajesecuador')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Canal de YouTube',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
              
            SizedBox(height: size.height * 0.04,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 115.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TerrenosScreen(null)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Información de Terrenos',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.04,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 115.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HouseCarouselScreen(null)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Información de Casas',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.04,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 115.0),
              child: ElevatedButton(
                onPressed: () => launchUrl(Uri.parse('https://wa.me/1234567890')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'WhatsApp',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
              
          ],
        ),
      ),
    );
  }
}

class TerrenosScreen extends StatelessWidget {
  
  TerrenosScreen(Key? key) : super(key: key);

  final List<String> houseImages = [
    'https://colombia.argos.co/wp-content/uploads/2023/04/banner-Tipos-de-terrenos-para-construir-tu-hogar-abril-100.jpg',
    'https://sucasacancun.com/wp-content/uploads/2019/06/Terreno-en-venta-scaled.jpg',
    'https://e6oe5g5k44d.exactdn.com/wp-content/uploads/2023/07/importancia-terreno-arquitectura.jpg',
    'https://rankim.com.br/blog/wp-content/uploads/2018/05/como-comprar-um-terreno-residencial-com-seguranca-veja-7-dicas.jpeg',
    'https://www.citymax-ant.com/wp-content/uploads/sites/8/2019/04/terreno-en-venta-Guatemala.jpg'
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Carrusel de Casas')),
      body: Center(
        child: Column(
          children: 
          [
            Container(
              width: size.width * 0.98,
              height: size.height * 0.25,
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: MediaQuery.of(context).size.width > 600 ? 3 / 1 : 16 / 9,
                  enlargeCenterPage: true,
                ),
                items: houseImages.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: size.height * 0.07,),
            Container(
              width: size.width * 0.98,
              height: size.height * 0.58,
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: const Text(
                //'',
                'Los terrenos disponibles cuentan con todos los servicios y están ubicados en zonas estratégicas. El hotel del centro es el más antiguo del pueblo y también es aquel que tiene más comodidades. Este hotel fue construido en 1911, pero primero se utilizó como casa de familia. En 1975 un inversionista compró esta propiedad y la reformó para transformarla en el hotel que hoy conocemos. Es un hotel pequeño, pero cuenta con servicio a la habitación, con pileta climatizada, con un restaurante de categoría, entre otras cosas. Nuestras casas están diseñadas con los mejores materiales y cuentan con acabados de lujo. El hotel del centro es el más antiguo del pueblo y también es aquel que tiene más comodidades. Este hotel fue construido en 1911, pero primero se utilizó como casa de familia. En 1975 un inversionista compró esta propiedad y la reformó para transformarla en el hotel que hoy conocemos. Es un hotel pequeño, pero cuenta con servicio a la habitación, con pileta climatizada, con un restaurante de categoría, entre otras cosas.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class HouseCarouselScreen extends StatelessWidget {

  HouseCarouselScreen(Key? key) : super(key: key);

  final List<String> houseImages = [
    'https://planner5d.com/blog/content/images/2023/05/dise-os-y-planos-de-casas-de-dos-pisos.jpg',
    'https://i.pinimg.com/550x/cf/ba/6d/cfba6d597fa88653ae0cf558278c02f5.jpg',
    'https://arquitectopablorestrepo.com/wp-content/uploads/2024/08/Diseno-casa-campestre-Los-Almendros-4-600x600.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUvhRDf1Y3hLB637xNq6NE0I0g63v-Nx9qSg&s',
    'https://i.pinimg.com/736x/e0/92/fe/e092fe3a4f11e2885b8c5b689c5a5b17.jpg'
  ];

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Info de Casas')),
      body: Center(
        child: Column(
          children: 
          [
            Container(
              width: size.width * 0.98,
              height: size.height * 0.25,
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: MediaQuery.of(context).size.width > 600 ? 3 / 1 : 16 / 9,
                  enlargeCenterPage: true,
                ),
                items: houseImages.map((imageUrl) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(imageUrl, fit: BoxFit.cover, width: double.infinity),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: size.height * 0.07,),
            Container(
              width: size.width * 0.98,
              height: size.height * 0.58,
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: const Text(
                'Nuestras casas están diseñadas con los mejores materiales y cuentan con acabados de lujo. El hotel del centro es el más antiguo del pueblo y también es aquel que tiene más comodidades. Este hotel fue construido en 1911, pero primero se utilizó como casa de familia. En 1975 un inversionista compró esta propiedad y la reformó para transformarla en el hotel que hoy conocemos. Es un hotel pequeño, pero cuenta con servicio a la habitación, con pileta climatizada, con un restaurante de categoría, entre otras cosas. Nuestras casas están diseñadas con los mejores materiales y cuentan con acabados de lujo. El hotel del centro es el más antiguo del pueblo y también es aquel que tiene más comodidades. Este hotel fue construido en 1911, pero primero se utilizó como casa de familia. En 1975 un inversionista compró esta propiedad y la reformó para transformarla en el hotel que hoy conocemos. Es un hotel pequeño, pero cuenta con servicio a la habitación, con pileta climatizada, con un restaurante de categoría, entre otras cosas.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {

  static const platform = MethodChannel('call_channel');

  static const platformEmail = MethodChannel('email_channel');

  final List<MenuOption> options = [
    MenuOption(icon: Icons.place, label: "Destinos", url: "https://centrodeviajesecuador.com/wp-content/uploads/2020/11/PLAN-GOLD1.jpg"),
    MenuOption(icon: Icons.home, label: "Membresías", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2020/12/MENBRES%C3%8DA.jpg'),
    MenuOption(icon: Icons.web, label: "Compra tu terreno", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2020/12/PLAN-TERRENO-2048x1536.jpg'),
    MenuOption(icon: Icons.info, label: "Tu casa programada", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2020/11/Webp.net-resizeimage-2-1.jpg'),    
    MenuOption(icon: Icons.archive_rounded, label: "Revista", url: 'https://centrodeviajesecuador.com/wp-content/uploads/2024/01/image-2-980x551.png'),
  ];

/*
  void openDialer() async {
    final Uri dialerUri = Uri.parse("tel: +593979856428");
    if (await canLaunchUrl(dialerUri)) {
      await launchUrl(dialerUri);
    } else {
      //print("No se pudo abrir el teclado de llamadas.");
    }
  }
  */

  void makePhoneCall() async {
    
    if(Platform.isAndroid){
      try {
        await platform.invokeMethod('makePhoneCall', {'phone': "+593979856428"});
      } on PlatformException catch (_) {
        //print("Error al hacer la llamada: ${e.message}");
      }
    }
    
  }

  void openEmailApp(email) async {    
    try {
      await platformEmail.invokeMethod('openEmailApp', {'email': email});
    } on PlatformException catch (_) {
      //print("Error al abrir la app de correos: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      /*
      drawer: Drawer(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú Principal',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                Navigator.pop(context); // Cierra el menú
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuración'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar Sesión'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      */
      appBar: AppBar(
        backgroundColor: const Color(0xFF53C9EC),        
        leading: GestureDetector(
          onTap: () {
            
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/logo_app_pequenio_blanco.png'),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () async {
              //openDialer();
              makePhoneCall();
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: size.width * 0.14,
              height: size.height * 0.05,
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(
                  Icons.call,
                  color: Colors.white, 
                ),
                color: Colors.white,
                tooltip: '(593-9) 79856428',
                onPressed: () async {
                  //openDialer();
                  makePhoneCall();
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              openEmailApp('info@centrodeviajesecuador.com');
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: size.width * 0.14,
              height: size.height * 0.05,
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(
                  Icons.mail,
                  color: Colors.white, 
                ),
                color: Colors.white,
                tooltip: 'info@centrodeviajesecuador.com',
                onPressed: () async { 
                  openEmailApp('info@centrodeviajesecuador.com');                 
                },
              ),
            ),
          ),        
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                  create: (_) => AuthService(),
                  child: const LoginScreen(null)),
                ),
              );
            },
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: size.width * 0.14,
              height: size.height * 0.05,
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white, 
                ),
                color: Colors.white,
                tooltip: 'Ingrese',
                onPressed: () async {
                  Navigator.push(
          context,
            MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                      create: (_) => AuthService(),
                      child: const LoginScreen(null)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(        
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://centrodeviajesecuador.com/wp-content/uploads/2020/11/PORTADA-PRINCIPAL-scaled.jpg'),
              fit: BoxFit.fitHeight, // Ajusta la imagen al tamaño del contenedor
              opacity: 0.3
            ),
          ),        
          child: Column(
            children: [
              /*
              Container(
                width: size.width,
                height: size.height * 0.15,
                color: Colors.transparent,
                child: Row(
                  children: [     
                    Container(
                      width: size.width * 0.35,
                      height: size.height * 0.04,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage('https://centrodeviajesecuador.com/wp-content/uploads/2021/07/NARBONI-CORPORATION-PNG.png'), // URL de la imagen
                          fit: BoxFit.fitHeight, // Ajusta la imagen al tamaño del contenedor
                          opacity: 0.1
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.45,
                      height: size.height * 0.12,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.02,),

                          const Text(
                            "Centro de Viajes Ecuador",
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
        
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          SizedBox(
                            width: size.width * 0.85,
                            height: size.height * 0.02,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Canterbury',
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  ScaleAnimatedText('SIEMPRE', textStyle: const TextStyle(color: Colors.black)),
                                  ScaleAnimatedText('VACACIONES SEGURAS', textStyle: const TextStyle(color: Colors.black)),
                                  ScaleAnimatedText('¡PLANIFICA Y LOGRA LO IMPOSIBLE!', textStyle: const TextStyle(color: Colors.black)),
                                ],
                                onTap: () {
                                },
                              ),
                            ),
                          )
                        ],
                      )
                      
                    ),
                  ],
                ),
              ),
              */
              Container(
                width: size.width,
                height: size.height * 0.15,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Stack(
                  children: [     
                    Positioned(
                      top: size.height * 0.03,
                      left: size.width * 0.235,
                      child: Container(
                        width: size.width * 0.35,
                        height: size.height * 0.09,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo_app_pequenio.png'),//Image(),//NetworkImage('https://centrodeviajesecuador.com/wp-content/uploads/2021/07/NARBONI-CORPORATION-PNG.png'), // URL de la imagen
                            fit: BoxFit.fitHeight, // Ajusta la imagen al tamaño del contenedor
                            opacity: 0.1
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.79,
                      height: size.height * 0.12,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: size.height * 0.02,),

                          Container(
                            color: Colors.transparent,
                            width: size.width * 0.75,
                            height: size.height * 0.03,
                            child: const Text(
                              "Centro de Viajes Ecuador",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
        
                          SizedBox(
                            height: size.height * 0.02,
                          ),

                          Container(
                            color: Colors.transparent,
                            width: size.width * 0.97,
                            height: size.height * 0.035,
                            alignment: Alignment.center,
                            child: DefaultTextStyle(
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Canterbury',
                              ),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                pause: const Duration(microseconds: 1000),

                                animatedTexts: [
                                  ScaleAnimatedText('VACACIONES SEGURAS SIEMPRE', textStyle: const TextStyle(color: Colors.black)),
                                  ScaleAnimatedText('¡PLANIFICA Y LOGRA LO IMPOSIBLE!', textStyle: const TextStyle(color: Colors.black)),
                                ],
                                onTap: () {
                                },
                              ),
                            ),
                          )
                          /*
                          const Text(
                            "VACACIONES SEGURAS",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: size.height * 0.004),
                          Text(
                            "SIEMPRE",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: size.height * 0.004), // Espacio entre la primera y segunda línea
                          Text(
                            "Centro de Viajes Ecuador",
                            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: size.height * 0.004), // Aumenta el espacio entre la segunda y tercera línea
                          Text(
                            "¡PLANIFICA Y LOGRA LO IMPOSIBLE!",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        */
                        ],
                      )
                      
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.68,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: GridView.builder(              
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,                
                      ),
                      itemCount: options.length,
                      itemBuilder: (context, index) {
                        return MenuTile(option: options[index]);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xFF142950),
        height: size.height * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: size.width * 0.01,),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://www.youtube.com/@centrodeviajesecuador',)),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: size.width * 0.17,
                height: size.height * 0.05,
                color: Colors.transparent,
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.youtube, color: Colors.white,),
                  color: Colors.white,                  
                  onPressed: () async {                                        
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://www.youtube.com/@centrodeviajesecuador',)),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://www.facebook.com/centrodeviajesecuador',)),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: size.width * 0.14,
                height: size.height * 0.05,
                color: Colors.transparent,
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white,),
                  color: Colors.white,                  
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://www.facebook.com/',)),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://www.instagram.com/centrodeviajesecuadorec/',)),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: size.width * 0.14,
                height: size.height * 0.05,
                color: Colors.transparent,
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white,),
                  color: Colors.white,                  
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://www.instagram.com/',)),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: size.width * 0.14,
                height: size.height * 0.05,
                color: Colors.transparent,
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white,),
                  color: Colors.white,                  
                  onPressed: () async {
                    launchUrl(Uri.parse('https://wa.me/593979856428?text=Unos%20de%20nuestros%20asesores%20se%20comunicara%20con%20usted'));
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://ec.linkedin.com/company/narbonicorp?trk=public_post_feed-actor-name&fbclid=PAY2xjawIl1XNleHRuA2FlbQIxMQABpt8RnB2MEMMis00GH4Hquz6axfRqy7xAtuH9r4MiSm8apL7fjoGfJXyTvQ_aem_2LR3oSPAZpWnTLw0Ylophg',)),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: size.width * 0.14,
                height: size.height * 0.05,
                color: Colors.transparent,
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white,),
                  color: Colors.white,                  
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://ec.linkedin.com/company/narbonicorp',)),
                    );
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://www.tiktok.com/@centrodeviajesecuadorof?_t=ZM-8u6yTh8chD3&_r=1 ',)),
                );
              },
              borderRadius: BorderRadius.circular(50),
              child: Container(
                width: size.width * 0.14,
                height: size.height * 0.05,
                color: Colors.transparent,
                child: IconButton(
                  icon: const FaIcon(FontAwesomeIcons.tiktok, color: Colors.white,),
                  color: Colors.white,                  
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: 'https://x.com/',)),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: size.width * 0.01,),
          ],
        ),
      )
    );
  }
}

class MenuOption {
  final IconData icon;
  final String label;
  final String url;

  MenuOption({required this.icon, required this.label, required this.url});
}

class MenuTile extends StatelessWidget {
  final MenuOption option;

  const MenuTile({Key? key, required this.option}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        String ruta = '';
        if(option.label == "Destinos"){          
          ruta = 'https://centrodeviajesecuador.com/destinos-turisticos/';
        }
        if(option.label == "Membresías"){
          ruta = 'https://centrodeviajesecuador.com/destinos-turisticos/';          
        }
        if(option.label == "Compra tu terreno"){
          ruta = 'https://centrodeviajesecuador.com/plan-terrenos/';          
        }
        if(option.label == "Tu casa programada"){
          ruta = 'https://centrodeviajesecuador.com/tu-casa-programada/';          
        }
        if(option.label == "Revista"){
          ruta = 'https://drive.google.com/file/d/1vvXUqg5oZ6zkmhZNjmdAZsTvO3xj4xOZ/view?usp=sharing';          
        }        

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InformativeScreen(null, ruta: ruta,)),
        );
      },
      child: Column(
        children: [
          Container(
            width: size.width * 0.45,
            height: size.height * 0.04,
            color: Colors.transparent,
            child: Text(option.label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))
          ),
          Container(
            width: size.width * 0.45,
            height: size.height * 0.15,            
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(option.url), // URL de la imagen
                fit: BoxFit.cover, // Ajusta la imagen al tamaño del contenedor
              ),
              borderRadius: BorderRadius.circular(20), // Bordes redondeados
            ),
          ),
          
        ],
      ),
    );
  }
}