import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lucare/shared/routes/app_routes.dart';

class BarItem extends StatefulWidget {
  const BarItem({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BarItemState();
}

class _BarItemState extends State {
  static int _pagina = 0;

  void _selecionaPagina(int index) {
    if (_pagina == index) {
      return;
    }

    switch (index) {
      case 0:
        Modular.to.pushNamed(AppRoutes.HOME);
        break;
      case 1:
        Modular.to.pushNamed(AppRoutes.CONSULTA_LISTA);
        break;

      default:
    }

    setState(() {
      _pagina = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.business),
          label: 'Medicamento',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Consulta',
        ),
      ],
      currentIndex: _pagina,
      onTap: _selecionaPagina,
    );
  }
}
