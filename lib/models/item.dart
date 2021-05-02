import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final title, subtitle, avatar, bg;

  Item({
    required this.title,
    required this.subtitle,
    required this.avatar,
    required this.bg,
  });

  @override
  List<Object?> get props => [title, bg, avatar, subtitle];
}
