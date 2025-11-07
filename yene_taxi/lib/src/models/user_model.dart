class AppUser {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;
  final String? phone;
  final String role; // passenger | driver | admin

  const AppUser({
    required this.id,
    required this.email,
    this.name,
    this.photoUrl,
    this.phone,
    required this.role,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
    id: json['id'] as String,
    email: json['email'] as String? ?? '',
    name: json['name'] as String?,
    photoUrl: json['photoUrl'] as String?,
    phone: json['phone'] as String?,
    role: json['role'] as String? ?? 'passenger',
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'photoUrl': photoUrl,
    'phone': phone,
    'role': role,
  };
}
