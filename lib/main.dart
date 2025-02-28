import 'package:flutter/material.dart';
import 'descripcion.dart'; // Importa la página de detalles separada

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Complex',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // Mapa de categorías con sus respectivos ítems
  final Map<String, List<Item>> categories = {
    "Soccer 6": [
      Item(
        image: 'assets/images/cancha01.jpg',
        name: 'Soccer Field 1',
        price: 100000,
        location: "Location 1",
        rating: 4.5,
        description: "Campo de Soccer 6 con césped natural",
        owner: "Carlos",
        email: "carlos@example.com",
      ),
      Item(
        image: 'assets/images/cancha06.jpg',
        name: 'Soccer Field 2',
        price: 120000,
        location: "Location 2",
        rating: 4.0,
        description: "Amplio campo para partidos intensos",
        owner: "Miguel",
        email: "miguel@example.com",
      ),
    ],
    "Soccer 9": [
      Item(
        image: 'assets/images/cancha03.jpg',
        name: 'Soccer Field 3',
        price: 150000,
        location: "Location 3",
        rating: 4.2,
        description: "Cancha de Soccer 9 con luz nocturna",
        owner: "Luis",
        email: "luis@example.com",
      ),
      Item(
        image: 'assets/images/cancha04.jpg',
        name: 'Soccer Field 4',
        price: 130000,
        location: "Location 4",
        rating: 4.3,
        description: "Espacioso y bien mantenido",
        owner: "Ana",
        email: "ana@example.com",
      ),
    ],
    "Volleyball": [
      Item(
        image: 'assets/images/cancha05.jpg',
        name: 'Volleyball Court 1',
        price: 80000,
        location: "Location 5",
        rating: 4.7,
        description: "Cancha de Volleyball al aire libre",
        owner: "Sofía",
        email: "sofia@example.com",
      ),
    ],
    "Basketball": [
      Item(
        image: 'assets/images/cancha02.jpg',
        name: 'Basketball Court 1',
        price: 90000,
        location: "Location 6",
        rating: 4.6,
        description: "Cancha de Basketball indoor",
        owner: "Juan",
        email: "juan@example.com",
      ),
    ]
  };

  @override
  Widget build(BuildContext context) {
    // Combina todos los ítems de todas las categorías en una sola lista
    List<Item> allItems =
        categories.values.expand((items) => items).toList();

    return Scaffold(
      backgroundColor: Color(0xFFDDE6D5),
      appBar: AppBar(
        backgroundColor: Color(0xFF84A05A),
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Icon(Icons.shopping_cart, color: Colors.white),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          // Sección de usuario
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF19382F),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Asegúrate de tener la imagen en: assets/images/profile.jpg
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                      radius: 30,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ivan Peralta",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text("VIP",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Rp 980.528",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Text("18 Orders",
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Barra de búsqueda
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Buscar complejo deportivo",
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Ya no se muestra la fila de categorías
          // Grid de productos (se muestran todos los ítems)
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
                children: allItems.map((item) {
                  return ItemCard(
                    image: item.image,
                    name: item.name,
                    price: item.price,
                    location: item.location,
                    rating: item.rating,
                    description: item.description,
                    owner: item.owner,
                    email: item.email,
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Modelo para cada ítem (complejo deportivo)
class Item {
  final String image;
  final String name;
  final double price;
  final String location;
  final double rating;
  final String description;
  final String owner;
  final String email;

  Item({
    required this.image,
    required this.name,
    required this.price,
    required this.location,
    required this.rating,
    required this.description,
    required this.owner,
    required this.email,
  });
}

class ItemCard extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final String location;
  final double rating;
  final String description;
  final String owner;
  final String email;

  const ItemCard({
    required this.name,
    required this.image,
    required this.price,
    required this.location,
    required this.rating,
    required this.description,
    required this.owner,
    required this.email,
  });

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool _isHovered = false;
  bool _isTextHovered = false; // Nuevo estado para el hover del texto

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
        child: Card(
          color: Color(0xFF19382F), // Cambia el color de fondo aquí
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Image.asset(widget.image, height: 80),
                SizedBox(height: 8),
                Text(
                  "Rp ${widget.price}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                MouseRegion(
                  onEnter: (_) => setState(() => _isTextHovered = true),
                  onExit: (_) => setState(() => _isTextHovered = false),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ItemDetailPage(
                            name: widget.name,
                            price: widget.price,
                            location: widget.location,
                            rating: widget.rating,
                            description: widget.description,
                            owner: widget.owner,
                            email: widget.email,
                            image: widget.image,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "Más Detalles",
                      style: TextStyle(
                        color: _isTextHovered ? Colors.amber : Colors.white, // Cambia el color aquí
                      ),
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