import 'cat.dart';

class Repository {
  final List<Cat> _catList = [];

  void addCat(Cat catToAdd) {
    _catList.add(catToAdd);
  }

  List<Cat> get catList => _catList;

  void deleteCat(Cat cat) {
    _catList.remove(cat);
  }

  void deleteCatById(String id) {
    for (var cat in _catList) {
      if (cat.id == id) {
        _catList.remove(cat);
        break;
      }
    }
  }

  void updateCat(String id, Cat cat) {
    for (int i = 0; i < _catList.length; i++) {
      if (_catList[i].id == id) {
        _catList[i] = cat;
        break;
      }
    }
  }

  Cat? getCatById(var id) {
    for (int i = 0; i < _catList.length; i++) {
      if (_catList[i].id == id) {
        return _catList[i];
      }
    }
    return null;
  }
}

Repository repository = Repository();
