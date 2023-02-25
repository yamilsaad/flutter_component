import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //!infinit scroll
    scrollController.addListener(() {
      //'{print('scrollController.position.pixels}, ${scrollController.position.maxScrollExtent}')//*Toma los datos del scroll y se pueden ver en laconsola!
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //  add5();
        ////*el add5 es reemplazado por el fetchData porque no quiero que esté tomando todo el tiempo la informacion de carga.
        //*esto permite que haya una espera determinada por el Future!
        fetchData();
      }
    });
  }

  //*El Future me va a permitir hacer una espera mientras espero los rsultados es decir hasta que cargen ls imagenes en relacion a las cantidades indicadas!
  Future fetchData() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    add5();

    isLoading = false;
    setState(() {});

    //La logica siguiente es para que cuando el scroll se haga hacia arriba no produzca el mismo salto que debe hacer cuando llega al final!
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn);
  }

  //Sumar elementos al scrollController
  void add5() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});

    /*Future<void> onRefresh() async {
      await Future.delayed(const Duration(seconds: 2));
      final lastId = imagesIds.last;
      imagesIds.clear();
      imagesIds.add(lastId + 1);
      add5();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    //*El MediaQuery nos da la información del dispositivo pudiendo manifular los objetos en relacion del dispositivo!!
    //* El size sabe el ancho y el alto de la pantalla!
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removeViewPadding(
        context: context,
        removeTop: true,
        removeLeft: true,

        //! El Widget Stack me permite poner un widget encima de otro como si fueran cartas, a diferencia de un Column o un Row!!!
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: () async {
                Future.delayed(const Duration(seconds: 3));
                final lastId = imagesIds.last;
                imagesIds.clear();
                imagesIds.add(lastId + 1);
                add5();
              },
              child: ListView.builder(
                  physics:
                      const BouncingScrollPhysics(), //*formato de scroll de IOS!
                  controller: scrollController,
                  itemCount: imagesIds.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FadeInImage(
                        width: double
                            .infinity, //*Toma todo el ancho del contenedor!
                        height: 300,
                        fit: BoxFit.cover, //*Ocupa todo el espacio de la caja!
                        placeholder: const AssetImage('assets/jar-loading.gif'),
                        image: NetworkImage(
                            'https://picsum.photos/500/300?image=${imagesIds[index]}'));
                  }),
            ),
            if (isLoading) //este condicional es para el Loading para que aparezca y desaparezca
              //*Positioned funciona dentro del Stack y sirve para posicionar el el widget!
              Positioned(
                  bottom: 40,
                  left: size.width * 0.5 - 30,
                  child: const _LoadingIcon())
          ],
        ),
      ),
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        shape: BoxShape.circle,
      ),
      child: const CircularProgressIndicator(color: AppTheme.primary),
    );
  }
}
