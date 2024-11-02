import 'package:flutter/material.dart';
import '../../domain/models/data.dart';

class DataDisplayWidget extends StatelessWidget {
  final Data data;

  const DataDisplayWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        title: Text(
          data.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Population: ${data.population}',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            data.name[0], // Muestra la inicial del país
            style: const TextStyle(color: Colors.white),
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }
}
