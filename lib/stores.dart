class Product {
  final String name;
  final String numleft;
  final String cost;

  const Product({this.name, this.numleft, this.cost});
}

List<Product> userLists = [
  const Product(name: "Apples", numleft: '32', cost: '\$4.99'),
  const Product(name: "Bananas", numleft: '47', cost: '\$3.99'),
  const Product(name: "Lays Classic", numleft: '15', cost: '\$3.49'),
  const Product(name: "Ragu Salsa (Medium)", numleft: '21', cost: '\$4.49'),
  const Product(name: "Hershey's Bar (Milk Chocolate)", numleft: '17', cost: '\$1.49'),

];
