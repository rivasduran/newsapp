import 'package:flutter/material.dart';
import 'package:newsapp/src/pages/tab1_page.dart';
import 'package:newsapp/src/pages/tab2_page.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //BUSCAMOS NUESTRA NAVEGACION DENTRO DE LOS PROVIDERS
    final navegacionModel = Provider.of<_NavegacionModel>(context);//ASI HACEMOS UNA INSTANCIA DE MI CLASE



    return BottomNavigationBar(
      //currentIndex: 0,//ESTO ES PARA ESPECIFICAR CUAL ESTA SELECCIONADO
      currentIndex: navegacionModel.paginaActual,
      //onTap: (i) => print('$i'),
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('Para ti')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Encabezados'))
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navegacionModel =  Provider.of<_NavegacionModel>(context);
    //final newService =  Provider.of<NewsService>(context);

    return PageView(
      controller: navegacionModel.pageController,
      //physics: BouncingScrollPhysics(),//ESTO ES PARA QUITAR ALGO A LA IZQUIERDA QUE DICE QUE NO TENEMOS MAS PAGINAS
      physics: NeverScrollableScrollPhysics(),
      children: [
        Tab1Page(),
        Tab2Page()
        // Container(
        //   color: Colors.green,
        // ),
      ],
    );
  }
}

//PROVIDER

class _NavegacionModel with ChangeNotifier{
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  

  int get paginaActual => this._paginaActual;
  set paginaActual( int valor ){
    this._paginaActual = valor;

    _pageController.animateToPage(
      valor,
      duration: Duration(
        milliseconds: 250
      ),
      curve: Curves.easeOut
    );

    //PARA AVISAR A OTROS WIDGETS QUE SE REDIBUJE ESTE VALOR EJECUTAMOS:
    notifyListeners();
  }


  PageController get pageController => this._pageController;
}