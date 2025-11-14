import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prac7/features/winglets/screens/product_list_screen.dart';
import '../services/data_service.dart';
import '../../../utils/format_utils.dart';

class CartScreen extends StatefulWidget {
  final Map<String, dynamic> order;
  final DataService dataService;

  const CartScreen({super.key, required this.order, required this.dataService});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void dispose() {
    widget.dataService.addToHistory(widget.order);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Результат заказа'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Заказ оформлен успешно!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text('Товар: ${order['name']}',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
              Text('Количество: ${order['quantity']}',
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center),
              Text('Дата: ${formatDate(order['date'])}',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProductListScreen(),
                      ),
                    );
                  },
                child: const Text('Вернуться в каталог'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}