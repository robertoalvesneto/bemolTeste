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
  String? estado;
  String? bairro;
  String? rua;
  String? casa;
  String? complemento;
  String? referencia;

  RegisterUser({
    this.name,
    this.birth,
    this.gender,
    this.cpf,
    this.rg,
    this.number,
    this.cep,
    this.estado,
    this.bairro,
    this.rua,
    this.casa,
    this.complemento,
    this.referencia,
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
    required String estado,
    required String bairro,
    required String rua,
    required String casa,
    required String complemento,
    required String referencia,
  }) {
    this.cep = cep;
    this.estado = estado;
    this.bairro = bairro;
    this.rua = rua;
    this.casa = casa;
    this.complemento = complemento;
    this.referencia = referencia;
  }
}
