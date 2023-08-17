import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;
void uploadData() {
  firestore.collection('foods').add({
    'name': 'Pizza',
    'image': 'assets/images/pizza.png',
    'price': 5.00,
    'description': 'Margherita Pizza with Fresh mushrooms, Basil and Mozzarella',
  });
  firestore.collection('foods').add({
    'name': 'Burger',
    'image': 'assets/images/burger.png',
    'price': 4.00,
    'description': 'Classic Cheeseburger with extra cheese, Tomatoe and onion',
  });
  firestore.collection('foods').add({
    'name': 'Crepe',
    'image': 'assets/images/crepe.png',
    'price': 3.50,
    'description': 'Crispy chicken crepe with ketchup and mayonnaise sauce',
  });
  firestore.collection('foods').add({
    'name': 'macaroni',
    'image': 'assets/images/macarony.png',
    'price': 5.40,
    'description': 'macaroni with tomatoes, chicken and parsley',
  });
  firestore.collection('foods').add({
    'name': 'Steak',
    'image': 'assets/images/steak.png',
    'price': 6.00,
    'description': 'Grilled steak with Garlic Butter',
  });
  firestore.collection('foods').add({
    'name': 'Fried Chicken ',
    'image': 'assets/images/fried chicken.png',
    'price': 5.00,
    'description': 'Tender pieces of chicken coated  mixture spices, deep fried until golden and crispy.',
  });
  firestore.collection('foods').add({
    'name': 'Hawawshi',
    'image': 'assets/images/hawawshi.png',
    'price': 5.00,
    'description': 'Spicy Minced Meat Hawawshi with Tahini Sauce',
  });
  firestore.collection('foods').add({
    'name': 'Rice',
    'image': 'assets/images/rice.png',
    'price': 2.50,
    'description': 'Basmati rice with saffron, parsley and colored pepper',
  });
  firestore.collection('foods').add({
    'name': 'Sandwich ',
    'image': 'assets/images/sandwich.png',
    'price': 3.80,
    'description': 'Fried chicken sandwich with lettuce and cheddar cheese',
  });
  firestore.collection('foods').add({
    'name': 'French Frise',
    'image': 'assets/images/french frise.png',
    'price': 1.80,
    'description': 'French fries with ketchup sauce ',
  });
  firestore.collection('foods').add({
    'name': 'Appetizers',
    'image': 'assets/images/appetizer.png',
    'price': 2.00,
    'description': 'Salmon slice with red pepper and white sauce ',
  });
  firestore.collection('foods').add({
    'name': 'Salad',
    'image': 'assets/images/salad.png',
    'price': 1.50,
    'description': 'Mediterranean Greek Salad with Feta Cheese and Kalamata Olives',
  });
  firestore.collection('foods').add({
    'name': 'Cheesecake',
    'image': 'assets/images/dessert.png',
    'price': 2.50,
    'description': 'Cheesecake with caramel sauce and chantilly cream',
  });
  firestore.collection('foods').add({
    'name': 'Orange Juice',
    'image': 'assets/images/drink.png',
    'price': 1.50,
    'description': 'Freshly Squeezed Orange Juice with an orange slice',
  });
}

