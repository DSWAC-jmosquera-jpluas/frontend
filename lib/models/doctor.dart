class Doctor {
  num? id;
  num? dni;
  String? name;
  String? lastName;
  String? specialty;

  Doctor({
    this.id = 0,
    this.dni = 0,
    this.name = '',
    this.lastName = '',
    this.specialty = '',
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        id: json["citaMedicaId"],
        dni: json["dni"] ?? 0,
        name: json["nombre"] ?? '',
        lastName: json["apellido"] ?? '',
        specialty: json["especialidad"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "citaMedicaId": id,
        "dni": dni,
        "nombre": name,
        "apellido": lastName,
        "especialidad": specialty,
      };

  @override
  String toString() {
    return 'Doctor{id: $id, dni: $dni, name: $name, lastName: $lastName, specialty: $specialty}';
  }
}
