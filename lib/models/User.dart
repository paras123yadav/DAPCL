class UserData {
  dynamic imagePath;
  dynamic name;
  dynamic email;
  final String mobile;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic pincode;


  UserData({
    this.imagePath,
    this.name,
    this.email,
    this.address,
    this.city,
    required this.mobile,
    this.pincode,
    this.state,
  });
}