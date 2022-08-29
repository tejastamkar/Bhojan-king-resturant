import 'package:restroapp/Data/fooddata.dart';

List cartData = [];
void addCart({
  required int index,
}) {
  cartData.add(toppurchaseItems[index]);
}

void removeCart({required int index}) {
  cartData.remove(toppurchaseItems[index]);
}
