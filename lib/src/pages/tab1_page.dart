import 'package:flutter/material.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget{
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {


    //final newsService = Provider.of<NewsService>(context);
    final headlines = Provider.of<NewsService>(context).headlines;

    //newsService.headlines;
    // print('Vienen las noticias:');
    // print(headlines);

    //ListaNoticias( headlines,)
    
    return Scaffold(
      body: (headlines.length == 0)
      ? Center(
        child: CircularProgressIndicator(),
      )
      : ListaNoticias( headlines,)
      // body: Center(
      //   child: Text('Hola mundo 1')
      // )
    );
  }

  @override
  // TODO: implement wantKeepAlive
  //bool get wantKeepAlive => throw UnimplementedError();
  bool get wantKeepAlive => true;//ESTO ES PARA GUARDAR EL ESTADO DEL WIDGET Y NO QUITAR EL SCROLL
}

