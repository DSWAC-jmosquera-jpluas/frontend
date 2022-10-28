class Patient {
  num? id;
  num? dni;
  String? name;
  String? lastName;
  String? birthday;

  Patient({
    this.id = 0,
    this.dni = 0,
    this.name = '',
    this.lastName = '',
    this.birthday = '',
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["citaMedicaId"],
        dni: json["dni"] ?? 0,
        name: json["nombre"] ?? '',
        lastName: json["apellido"] ?? '',
        birthday: json["fechaNacimiento"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "citaMedicaId": id,
        "dni": dni,
        "nombre": name,
        "apellido": lastName,
        "fechaNacimiento": birthday,
      };

  @override
  String toString() {
    return 'Patient{id: $id, dni: $dni, name: $name, lastName: $lastName, birthday: $birthday}';
  }
}
