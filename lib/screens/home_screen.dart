import 'package:flutter/material.dart';

import '../models/item_model.dart';
import '../models/catalogo_service.dart';
import '../widgets/custom_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/custom_drawer.dart';
import 'detalle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemModel> _todosLosAutos = [];
  List<ItemModel> _autosFiltrados = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _obtenerDatos();
  }

  Future<void> _obtenerDatos() async {
    final datos = await CatalogoService.cargarCatalogo();
    setState(() {
      _todosLosAutos = datos;
      _autosFiltrados = datos;
      _cargando = false;
    });
  }

  void _filtrarBusqueda(String query) {
    final resultados = _todosLosAutos.where((item) {
      final titulo = item.titulo.toLowerCase();
      final subtitulo = item.subtitulo.toLowerCase();
      final busqueda = query.toLowerCase();
      return titulo.contains(busqueda) || subtitulo.contains(busqueda);
    }).toList();

    setState(() {
      _autosFiltrados = resultados;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catálogo de Vehículos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1E293B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          SearchBarWidget(
            placeholder: 'Buscar modelo o característica...',
            onChanged: _filtrarBusqueda,
          ),
          Expanded(
            child: _cargando
                ? const Center(child: CircularProgressIndicator())
                : _autosFiltrados.isEmpty
                ? const Center(
                    child: Text(
                      'No se encontraron vehículos',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _autosFiltrados.length,
                    itemBuilder: (context, index) {
                      final item = _autosFiltrados[index];
                      return CustomCard(
                        item: item,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalleScreen(item: item),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
