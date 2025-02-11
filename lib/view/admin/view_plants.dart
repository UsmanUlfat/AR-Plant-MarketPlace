
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewPlantsScreen extends StatelessWidget {
  const ViewPlantsScreen({super.key});

  Future<void> updateCategory(String plantId, String newCategory) async {
    await FirebaseFirestore.instance.collection('plants').doc(plantId).update({'category': newCategory});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Plants'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('plants').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final plants = snapshot.data!.docs;
          return ListView.builder(
            itemCount: plants.length,
            itemBuilder: (context, index) {
              final plant = plants[index].data() as Map<String, dynamic>;
              final plantId = plants[index].id;
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.green.withOpacity(0.1),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(plant['name'] ?? 'No Plant Name'),
                      PopupMenuButton<String>(
                        icon: const Icon(Icons.edit),
                        onSelected: (value) async {
                          await updateCategory(plantId, value);
                        },
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'Indoor',
                            child: Text('Indoor'),
                          ),
                          const PopupMenuItem(
                            value: 'Outdoor',
                            child: Text('Outdoor'),
                          ),
                          const PopupMenuItem(
                            value: 'Garden',
                            child: Text('Garden'),
                          ),
                          const PopupMenuItem(
                            value: 'Supplement',
                            child: Text('Supplement'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(plant['image_url']),
                  ),
                  children: [
                    const Text(
                      'Plant Information',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 50),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(plant['image_url']),
                    ),
                    const SizedBox(height: 50),
                    ListTile(
                      leading: const Icon(Icons.description),
                      title: Text('Description: ${plant['description']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.water_damage),
                      title: Text('Humidity: ${plant['humidity']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: Text('Price: \$${plant['price']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.production_quantity_limits),
                      title: Text('Quantity: ${plant['quantity']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.straighten),
                      title: Text('Size: ${plant['size']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.thermostat),
                      title: Text('Temperature: ${plant['temperature']}'),
                    ),
                    ListTile(
                      leading: const Icon(Icons.category),
                      title: Row(
                        children: [
                          const Icon(Icons.category),
                          const SizedBox(width: 8.0),
                          Text('Category: ${plant['category']}'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
