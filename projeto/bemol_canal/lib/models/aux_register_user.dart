class RegisterUser {
  /// Armazenando temporariamente os valores para passar entre os widgets e
  /// continuar seu preenchimento.

  String? name;
  String? birth;
  String? gender;
  String? cpf;
  String? rg;
  String? number;
  String? cep;
  String? state;
  String? district;
  String? street;
  String? home;
  String? complement;
  String? reference;
  String? email;
  String? password;

  RegisterUser({
    this.name,
    this.birth,
    this.gender,
    this.cpf,
    this.rg,
    this.number,
    this.cep,
    this.state,
    this.district,
    this.street,
    this.home,
    this.complement,
    this.reference,
    this.email,
    this.password,
  });

  void addPersonalData({
    required String name,
    required String birth,
    required String gender,
    required String cpf,
    required String rg,
    required String number,
  }) {
    this.name = name;
    this.birth = birth;
    this.gender = gender;
    this.cpf = cpf;
    this.rg = rg;
    this.number = number;
  }

  void addAddress({
    required String cep,
    required String state,
    required String district,
    required String street,
    required String home,
    required String complement,
    required String reference,
  }) {
    this.cep = cep;
    this.state = state;
    this.district = district;
    this.street = street;
    this.home = home;
    this.complement = complement;
    this.reference = reference;
  }

  void addAccount({
    required String email,
    required String password,
  }) {
    this.email = email;
    this.password = password;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "name": this.name!,
      "birth": this.birth!,
      "gender": this.gender!,
      "cpf": this.cpf!,
      "rg": this.rg!,
      "number": this.number!,
      "email": this.email!,
      "adress": {
        "cep": this.cep!,
        "state": this.state!,
        "district": this.district!,
        "street": this.street!,
        "home": this.home!,
        "complement": this.complement!,
        "reference": this.reference!,
      }
    };

    return map;
  }
}
