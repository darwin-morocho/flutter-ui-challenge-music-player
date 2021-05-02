import 'package:challenge/models/item.dart';
import 'package:faker/faker.dart';

const _bgs = [
  'img1-min.jpg',
  'img2-min.jpg',
  'img3-min.jpg',
  'img4-min.jpg',
];
const _avatars = [
  'person1-min.jpg',
  'person2-min.jpg',
  'person3-min.jpg',
  'person4-min.jpg',
];

List<Item> get fakerItems {
  final faker = Faker();
  return List.generate(
    _bgs.length,
    (index) => Item(
      title: faker.person.name(),
      subtitle: faker.lorem.words(3).join(" "),
      avatar: _avatars[index],
      bg: _bgs[index],
    ),
  );
}
