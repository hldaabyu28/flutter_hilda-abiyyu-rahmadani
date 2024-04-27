class ContactModel{
  final String name;
  final String phone;
  final String date;
  final String color;
  final String image;
  
  ContactModel({required this.name, required this.phone, required this.date, required this.color, required this.image});
  @override
  List<Object> get props => [name, phone, date, color, image];

}