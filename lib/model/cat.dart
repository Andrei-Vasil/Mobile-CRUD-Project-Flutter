import 'package:uuid/uuid.dart';
import 'package:floor/floor.dart';

@entity
class Cat {
  @primaryKey
  String id = const Uuid().v1();
  String name = '';
  String age = '';
  String breed = '';
  String owner = '';
  String date = '';

  Cat({
    required this.name,
    required this.age,
    required this.breed,
    required this.owner,
    required this.date,
  });

  Cat.withId({
    required this.id,
    required this.name,
    required this.age,
    required this.breed,
    required this.owner,
    required this.date,
  });

  Cat.empty();

  @override
  String toString() {
    return 'Cat{id: $id, name: $name, age: $age, breed: $breed, owner: $owner, date: $date}';
  }
}
