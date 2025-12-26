void main() {
  // Simulated user input (DartPad-friendly)
  String name = "Safwan C S";
  int age = 20;
  String gender = "Male";
  String email = "safwan@example.com";
  String phone = "9876543210";
  String address = "Kerala, India";
  String qualification = "B.Tech ECE";
  List<String> skills = ["Dart", "Flutter", "HTML", "CSS"];

  printBiodata(
    name,
    age,
    gender,
    email,
    phone,
    address,
    qualification,
    skills,
  );
}

void printBiodata(
  String name,
  int age,
  String gender,
  String email,
  String phone,
  String address,
  String qualification,
  List<String> skills,
) {
  print("══════════════════════════════════════");
  print("            BIODATA");
  print("══════════════════════════════════════");
  print("Name           : $name");
  print("Age            : $age");
  print("Gender         : $gender");
  print("Email          : $email");
  print("Phone          : $phone");
  print("Address        : $address");
  print("Qualification  : $qualification");
  print("Skills         : ${skills.join(', ')}");
  print("══════════════════════════════════════");
}
