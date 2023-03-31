import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Store',
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class Product {
  String name;
  String image;
  double weight;
  int quantity;
  double price;

  Product({
    required this.name,
    required this.image,
    required this.weight,
    this.quantity = 0,
    required this.price,
  });

  double get subTotal => quantity * price;
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> _products = [
    Product(
      name: 'Burger',
      image: 'https://media.istockphoto.com/id/1206323282/id/foto/hamburger-berair-di-latar-belakang-putih.jpg?s=612x612&w=0&k=20&c=mxdXHh4cA-jQNDoaLlwISQvu1ooQFv-5OdgSLhA-84g=',
      weight: 0.1,
      price: 10.000,
    ),
    Product(
      name: 'Pizza',
      image: 'https://media.istockphoto.com/id/1295596568/id/foto/irisan-pizza-terisolasi-di-latar-belakang-putih.jpg?s=612x612&w=0&k=20&c=-V4-ilx87_ncNYyb7478kew_27nW0XRqOdDSsO1NF8c=',
      weight: 0.5,
      price: 50.000,
    ),
    Product(
      name: 'French Fries',
      image: 'https://media.istockphoto.com/id/966934632/id/foto/menggugah-selera-kentang-goreng-dalam-mangkuk.jpg?s=612x612&w=0&k=20&c=mGjyu2vXBDd7iJNHMHt57fNlDspYN3wMftEHfkwnxVA=',
      weight: 0.3,
      price: 12.000,
    ),
    Product(
      name: 'Chicken Wings',
      image: 'https://media.istockphoto.com/id/835903320/id/foto/sayap-ayam-panggang-dengan-biji-wijen-dan-sambal-manis-di-atas-papan-kayu-putih.jpg?s=612x612&w=0&k=20&c=GvAH8cOLBY8Jcpi91yfmqI6ezynvG3wmtrvNrJdyDBE=',
      weight: 0.4,
      price: 15.000,
    ),
    Product(
      name: 'Sushi',
      image: 'https://media.istockphoto.com/id/1208806649/id/foto/set-sushi-dan-maki.jpg?s=612x612&w=0&k=20&c=8A1CBNuNNA4ogoQO9KIFyXfuU1coSEHWhPDTyBPfZqs=',
      weight: 0.1,
      price: 70.000,
    ),
    Product(
      name: 'Tacos',
        image: 'https://media.istockphoto.com/id/1250133101/id/foto/deretan-taco-jalanan-meksiko-di-atas-batu-tulis-dengan-carne-asada-dan-al-pastor-dalam.jpg?s=612x612&w=0&k=20&c=ovUo5bQyUv1w84xPlCDxGy75m9dJLuTPWxPdXeEgRS4=',
      weight: 0.3,
      price: 8.000,
    ),
    Product(
      name: 'Salad',
      image: 'https://media.istockphoto.com/id/175197961/id/foto/piring-salad.jpg?s=612x612&w=0&k=20&c=s-QWYROkJwlF73IbYctyTlNX7Qt9qI-VQvmF4WN4jSY=',
      weight: 0.2,
      price: 6.000,
    ),
    Product(
      name: 'Steak',
      image: 'https://media.istockphoto.com/id/535786572/id/foto/steak-striploin-panggang.jpg?s=612x612&w=0&k=20&c=V0yoH2p3HvucyAP4wflS4kbbodNZAXaGj0rVF24EtRA=',
      weight: 0.6,
      price: 24.000,
    ),
    Product(
      name: 'Pasta',
      image: 'https://media.istockphoto.com/id/1144823591/id/foto/spaghetti-dalam-hidangan-di-latar-belakang-putih.jpg?s=612x612&w=0&k=20&c=KqfzhSy-rs9P2I3eL5T088UfvlKfKFoQC71cl2ihe24=',
      weight: 0.4,
      price: 16.000,
    ),
    Product(
      name: 'Ice Cream',
      image: 'https://media.istockphoto.com/id/1400292359/photo/ice-cream-cones-bouquet.jpg?b=1&s=170667a&w=0&k=20&c=WWRPlrH9XrlZ74wkUhiK5S6nzm9O0vjRDpSJ-CHAC70=',
      weight: 0.2,
      price: 6.000,
    ),
  ];
  int _currentPage = 0;
  int _pageSize = 9;

  List<Product> get _displayedProducts {
    int startIndex = _currentPage * _pageSize;
    int endIndex = (startIndex + _pageSize) > _products.length
        ? _products.length
        : (startIndex + _pageSize);
    return _products.getRange(startIndex, endIndex).toList();
  }

  void _addToCart(Product product) {
    setState(() {
      product.quantity++;
    });
  }

  void _removeFromCart(Product product) {
    setState(() {
      product.quantity--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TOKO-NYA DIA'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: _displayedProducts.map((product) {
                return GestureDetector(
                  onTap: () => _addToCart(product),
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.network(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 0),
                        Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${product.weight} kg',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text('Rp.${product.price.toStringAsFixed(0)} K',
                        style: TextStyle(
                          color: Colors.grey,

                        ),
                      ),

                        SizedBox(height: 0),
                        // IconButton(
                        //     iconSize: 18, // Set the size to 32.0,
                        //     onPressed: () => _addToCart(product),
                        //     icon: Icon(Icons.add)),
                        ElevatedButton(
                          onPressed: () => _addToCart(product),
                          child: Text(
                            'Quantity(${product.quantity})\n'
                            '         +        ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        // IconButton( onPressed: () => _addToCart(product), icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _currentPage == 0
                    ? null
                    : () => setState(() => _currentPage--),
                child: Text('Back'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed:
                    _currentPage == (_products.length / _pageSize).ceil() - 1
                        ? null
                        : () => setState(() => _currentPage++),
                child: Text('Next'),
              ),
            ],
          ),
          // FloatingActionButton(
          //   onPressed: () => Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => HalamanDua(cart: _products),
          //     ),
          //   ),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HalamanDua(cart: _products),
          ),
        ),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class ShoppingCart extends StatelessWidget {
  final List<Product> products;

  const ShoppingCart({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network(
              products[index].image,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            title: Text(products[index].name),
            subtitle: Text('${products[index].weight} kg'),
            trailing: Text('x${products[index].quantity}'),
          );
        },
      ),
    );
  }
}

// ========================================================================
// import 'package:flutter/material.dart';
// import 'main.dart';
//

class Shipping {
  String name;
  double pricePerKg;
  String value; // add value property

  Shipping({
    required this.name,
    required this.pricePerKg,
  }) : value = name; // set value to name in the constructor
}

class HalamanDua extends StatelessWidget {
  // const HalamanDua({
  //   Key? key,
  //   required this.cart,
  // }): super(key:key);

  final List<Product> cart;

  HalamanDua({
    Key? key,
    required this.cart,
  }) : super(key: key);

  List<Shipping> _shippings = [
    Shipping(name: 'Regular', pricePerKg: 10),
    Shipping(name: 'Express', pricePerKg: 20),
    // Shipping(name: 'Priority', pricePerKg: 30),
  ];

  Shipping _selectedShipping = Shipping(name: '', pricePerKg: 0);
  double _totalWeight = 0;

  void _updateTotalWeight() {
    _totalWeight = cart.fold(
      0,
      (previousValue, element) =>
          previousValue + element.weight * element.quantity,
    );
  }

  void _updateSelectedShipping(Shipping shipping) {
    _selectedShipping = shipping;
  }

  void _incrementQuantity(Product product) {
    product.quantity++;
    _updateTotalWeight();
  }

  void _decrementQuantity(Product product) {
    if (product.quantity > 0) {
      product.quantity--;
      _updateTotalWeight();
    }
  }


  double _getShippingCost() {
    return _selectedShipping.pricePerKg * _totalWeight;
  }

  double _getTotalCost() {
    double subtotal = cart.fold(
      0,
      (previousValue, element) => previousValue + element.subTotal,
    );
    double shippingCost = _getShippingCost();
    return subtotal + shippingCost;
  }

  @override
  Widget build(BuildContext context) {
    _totalWeight = cart.fold(
      0,
      (previousValue, element) =>
          previousValue + element.weight * element.quantity,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('TOKO-NYA DIA'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shooping Cart:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '(Back dan kembali untuk refresh jumlah item ketika + dan -)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  Product product = cart[index];
                  if (product.quantity > 1) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Weight: ${product.weight.toStringAsFixed(
                                      2)} kg',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () =>
                                          _decrementQuantity(product),
                                      icon: Icon(Icons.remove),
                                    ),
                                    SizedBox(width: 0),
                                    Text(
                                      '(${product.quantity})',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(width: 0),
                                    IconButton(
                                      onPressed: () =>
                                          _incrementQuantity(product),
                                      icon: Icon(Icons.add),
                                    ),
                                    SizedBox(width: 0),
                                    Text(
                                      'Rp.${product.price.toStringAsFixed(
                                          0)}K',
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Rp.${product.subTotal.toStringAsFixed(
                                          0)}K',
                                      style: TextStyle(
                                        fontSize: 16,

                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }else {
                    return SizedBox.shrink(); // jika tidak memenuhi kondisi, produk tidak ditampilkan
                  }
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Shipping:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total weight:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${_totalWeight.toStringAsFixed(2)} kg',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shipping method:',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),

                      // DropdownButtonFormField<Shipping>(
                      //   value: _selectedShipping,
                      //   onChanged: (value) {
                      //     _updateSelectedShipping(value as Shipping);
                      //   },
                      //   items: _shippings.map((shipping) {
                      //     return DropdownMenuItem(
                      //       value: shipping,
                      //       child: Text(shipping.name),
                      //     );
                      //   }).toList(),
                      // ),
                      SizedBox(height: 8),
                      Text(
                        'Shipping cost: ${_getShippingCost().toStringAsFixed(3)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Total cost: Rp.${_getTotalCost().toStringAsFixed(3)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
