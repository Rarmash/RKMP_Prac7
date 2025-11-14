import 'package:go_router/go_router.dart';
import 'package:prac7/features/winglets/screens/cart_screen.dart';
import 'package:prac7/features/winglets/screens/history_screen.dart';
import 'package:prac7/features/winglets/screens/order_screen.dart';
import 'package:prac7/features/winglets/screens/product_list_screen.dart';
import 'package:prac7/features/winglets/screens/stock_manage_screen.dart';
import '../features/winglets/services/data_service.dart';

final DataService _data = DataService();

final GoRouter appRouter = GoRouter(
    initialLocation: '/products',
    routes: [
        GoRoute(
            path: '/products',
            name: 'products',
            builder: (context, state) => const ProductListScreen()
        ),
        GoRoute(
            path: '/order',
            name: 'order',
            builder: (context, state) => OrderScreen(dataService: _data)
        ),
        GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) {
                final order = state.extra as Map<String, dynamic>;
                return CartScreen(order: order, dataService: _data);
                },
        ),
        GoRoute(
            path: '/stock',
            name: 'stock',
            builder: (context, state) => StockManageScreen(dataService: _data)
        ),
        GoRoute(
            path: '/history',
            name: 'history',
            builder: (context, state) => HistoryScreen(dataService: _data)
        ),
    ]
);