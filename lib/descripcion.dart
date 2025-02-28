import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  final String name;
  final double price;
  final String location;
  final double rating;
  final String description;
  final String owner;
  final String email;
  final String image;

  const ItemDetailPage({
    required this.name,
    required this.price,
    required this.location,
    required this.rating,
    required this.description,
    required this.owner,
    required this.email,
    required this.image,
  });

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  String selectedCategory = 'Todos'; // Estado para la categoría seleccionada

  static const List<Map<String, String>> categories = [
    {'name': 'Fútbol', 'price': '\$20/hora', 'icon': 'sports_soccer'},
    {'name': 'Basket', 'price': '\$15/hora', 'icon': 'sports_basketball'},
    {'name': 'Volley', 'price': '\$18/hora', 'icon': 'sports_volleyball'},
  ];

  void _showReservation(BuildContext context, String name, String price) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reserva realizada para $name por $price')),
    );
  }

  // Método para filtrar las categorías según la selección
  List<Map<String, String>> getFilteredCategories() {
    if (selectedCategory == 'Todos') {
      return categories;
    } else {
      return categories
          .where((category) => category['name'] == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: Color(0xFF19382F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Foto destacada
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            // Detalles del complejo deportivo
            Text("Ubicación: ${widget.location}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Calificación: ", style: TextStyle(fontSize: 18)),
                Row(
                  children: List.generate(
                    5,
                    (index) => Icon(
                      index < widget.rating ? Icons.star : Icons.star_border,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("Descripción: ${widget.description}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Propietario: ${widget.owner}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Email: ${widget.email}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            // Tarjetas de categorías filtradas
            ...getFilteredCategories().map((category) => Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              _getIconForCategory(category['icon']!),
                              size: 24,
                              color: Color(0xFF84A05A),
                            ),
                            SizedBox(width: 8),
                            Text("Cancha de ${category['name']}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text("Precio: ${category['price']}",
                            style: TextStyle(fontSize: 18)),
                        SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () => _showReservation(
                              context, category['name']!, category['price']!),
                          child: Text("Reservar"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF84A05A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Botón para mostrar todos
              IconButton(
                icon: Icon(Icons.all_inclusive, color: Colors.white),
                onPressed: () {
                  setState(() {
                    selectedCategory = 'Todos';
                  });
                },
              ),
              // Botón de Fútbol
              IconButton(
                icon: Icon(Icons.sports_soccer, color: Colors.white),
                onPressed: () {
                  setState(() {
                    selectedCategory = 'Fútbol';
                  });
                },
              ),
              // Botón de Basketball
              IconButton(
                icon: Icon(Icons.sports_basketball, color: Colors.white),
                onPressed: () {
                  setState(() {
                    selectedCategory = 'Basket';
                  });
                },
              ),
              // Botón de Volleyball
              IconButton(
                icon: Icon(Icons.sports_volleyball, color: Colors.white),
                onPressed: () {
                  setState(() {
                    selectedCategory = 'Volley';
                  });
                },
              ),
            ],
          ),
        ),
        color: Color(0xFF19382F),
      ),
    );
  }

  // Método para obtener el icono según la categoría
  IconData _getIconForCategory(String icon) {
    switch (icon) {
      case 'sports_soccer':
        return Icons.sports_soccer;
      case 'sports_basketball':
        return Icons.sports_basketball;
      case 'sports_volleyball':
        return Icons.sports_volleyball;
      default:
        return Icons.sports;
    }
  }
}