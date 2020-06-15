class Produto{
  final int id;
  String nome;
  double preco;

  Produto({this.id, this.nome, this.preco});

  factory Produto.fromJson(Map<String, dynamic> json){
    return Produto(
      id : json['id'],
      nome: json['nome'],
      preco: json['preco'].toDouble()
    );
  }

  @override
  String toString(){
    return "Id: $id , Nome: $nome, Preco: $preco"; 
  }

}