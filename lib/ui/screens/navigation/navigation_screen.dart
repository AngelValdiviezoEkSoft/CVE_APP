import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

String rutaGen = '';

class NavigationScreen extends StatefulWidget {
  
  NavigationScreen(Key? key, {required ruta}) : super(key: key) {
    rutaGen = ruta;
  }

  @override
  State<NavigationScreen> createState() => NavigationScreenState();

}

class NavigationScreenState extends State<NavigationScreen>  {

  late final WebViewController _wvController;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _wvController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              isLoading = true; // Muestra el cargando
            });
          },
          onPageFinished: (url) {
            setState(() {
              isLoading = false; // Oculta el cargando
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(rutaGen));
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.home, color: Color(0xFF53C9EC)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          //title: const Text('Página informativa'),
          
        ),
      
      body: Container(
        color: Colors.transparent,
        width: size.width,
        height: size.height * 0.9,//300,
        child: 
        !isLoading ?
        WebViewWidget(controller: _wvController)
        :
        const Center(
          child: CircularProgressIndicator(color: Color(0xFF53C9EC),),
        ),
      ),
    );
  }

}
