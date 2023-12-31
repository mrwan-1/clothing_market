import '../model/base_model.dart';
import '../model/categories_model.dart';

List<CategoriesModel> categories = [
  CategoriesModel(imageUrl: 'assets/images/kids.jpeg', title: 'kids'),
  CategoriesModel(imageUrl: 'assets/images/1.jpeg', title: 'women'),
  CategoriesModel(imageUrl: 'assets/images/3.jpeg', title: 'men'),
  CategoriesModel(imageUrl: 'assets/images/bag.jpeg', title: 'bag'),
  CategoriesModel(imageUrl: 'assets/images/glasses.jpeg', title: 'Glasses'),
  CategoriesModel(imageUrl: 'assets/images/hat.jpeg', title: 'Hat'),
  CategoriesModel(imageUrl: 'assets/images/shose.jpeg', title: 'shose'),
];
List<BaseModel> mainList = [
  BaseModel(
      id: 1,
      imageUrl: 'assets/images/1.jpeg',
      name: 'White chemise',
      price: 100,
      review: 1.4,
      star: 5,
      value: 1),
  BaseModel(
      id: 2,
      imageUrl: 'assets/images/2.jpeg',
      name: 'Jacket',
      price: 140,
      review: 2.4,
      star: 4.1,
      value: 1),
  BaseModel(
      id: 3,
      imageUrl: 'assets/images/3.jpeg',
      name: 'pullover',
      price: 110,
      review: 1.4,
      star: 3.1,
      value: 1),
  BaseModel(
      id: 4,
      imageUrl: 'assets/images/4.jpeg',
      name: 'brown pullover',
      price: 120,
      review: 0.4,
      star: 2.1,
      value: 1),
  BaseModel(
      id: 5,
      imageUrl: 'assets/images/5.jpeg',
      name: 'White pullover',
      price: 150,
      review: 1.4,
      star: 4.1,
      value: 1),
  BaseModel(
      id: 6,
      imageUrl: 'assets/images/6.jpeg',
      name: 'White chemise',
      price: 90,
      review: 1.4,
      star: 4.1,
      value: 1),
  BaseModel(
      id: 7,
      imageUrl: 'assets/images/7.jpeg',
      name: 'hat',
      price: 80,
      review: 1.4,
      star: 4.1,
      value: 1),
  BaseModel(
      id: 8,
      imageUrl: 'assets/images/8.jpeg',
      name: 'ploza',
      price: 160,
      review: 1.4,
      star: 4.1,
      value: 1),
  BaseModel(
      id: 9,
      imageUrl: 'assets/images/9.jpeg',
      name: 'short',
      price: 180,
      review: 1.4,
      star: 2.5,
      value: 1),
  BaseModel(
      id: 10,
      imageUrl: 'assets/images/kids.jpeg',
      name: ' chemise',
      price: 60,
      review: 0.4,
      star: 1.6,
      value: 1),
];
List<BaseModel> itemOnSearch = [];
List<BaseModel> itemOnCart = [];
