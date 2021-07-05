import 'package:get/get.dart';

class AppController extends GetxController {
  // RxList<CartItemModel> cartsItemModel = RxList<CartItemModel>([]);

  // addProduct(Product product) {
  //   try {
  //     CartItemModel cartItem = cartsItemModel.firstWhere((cartItem) {
  //       return cartItem.product.id == product.id;
  //     });
  //     cartItem.incrementQuantity();
  //   } catch (error) {
  //     cartsItemModel.add(CartItemModel(
  //       product: product,
  //       quantity: 1,
  //       isSelected: true,
  //     ));
  //   }
  // }

  // String get totalAmount {
  //   double amount = cartsItemModel.fold(0, (subtotal, cartItem) {
  //     return subtotal + cartItem.product.price * cartItem.quantity;
  //   });
  //   return appCurrency(amount);
  // }
}
