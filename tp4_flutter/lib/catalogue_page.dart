import 'package:flutter/material.dart';
import 'product.dart';
import 'added_list.dart';
import 'added_products_page.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  final List<Product> catalogue = const [
    Product("Téléphone", 1200, Icons.smartphone),
    Product("Casque Bluetooth", 150, Icons.headphones),
    Product("Montre connectée", 300, Icons.watch),
    Product("Chargeur USB", 40, Icons.battery_charging_full),
    Product("Clavier Sans Fil", 80, Icons.keyboard),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MiniShop Store",
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: Badge(
                label: Text('${addedProducts.length}'),
                backgroundColor: const Color(0xFFFF6F00),
                child: const Icon(Icons.shopping_cart_outlined, size: 28),
              ),
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddedProductsPage(),
                  ),
                );
                setState(() {});
              },
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Color(0xFF1A237E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: const Text(
              "Découvrez nos produits High-Tech",
              style: TextStyle(color: Colors.white70, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              itemCount: catalogue.length,
              itemBuilder: (context, index) {
                final p = catalogue[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A237E).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        p.icon,
                        color: const Color(0xFF1A237E),
                        size: 28,
                      ),
                    ),
                    title: Text(
                      p.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        "${p.price.toStringAsFixed(0)} DT",
                        style: const TextStyle(
                          color: Color(0xFFFF6F00),
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: const Color(0xFF1A237E),
                      child: IconButton(
                        icon: const Icon(Icons.add_shopping_cart,
                            color: Colors.white, size: 20),
                        onPressed: () {
                          setState(() {
                            addedProducts.add(p);
                          });
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: const Color(0xFF1A237E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              content: Row(
                                children: [
                                  const Icon(Icons.check_circle,
                                      color: Colors.greenAccent),
                                  const SizedBox(width: 10),
                                  Text("${p.name} ajouté au panier"),
                                ],
                              ),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}