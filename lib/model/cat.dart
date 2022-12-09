import 'package:floor/floor.dart';

@entity
class Cat {
  String name = '';
  String age = '';
  String breed = '';
  String owner = '';
  String date = '';
  @primaryKey
  String id;

  Cat({
    required this.id,
    required this.name,
    required this.age,
    required this.breed,
    required this.owner,
    required this.date,
  });

  @override
  String toString() {
    return 'Cat{id: $id, name: $name, age: $age, breed: $breed, owner: $owner, date: $date}';
  }
}
