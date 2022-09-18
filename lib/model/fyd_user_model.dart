import 'package:equatable/equatable.dart';

class FydUser extends Equatable {
  final String uid;
  final String phone;
  final String name;
  final String? email;
  final String? address;

  const FydUser(
      {required this.uid,
      required this.phone,
      required this.name,
      this.email,
      this.address});

  @override
  // TODO: implement props
  List<Object?> get props => [uid, phone, name, email, address];
}
