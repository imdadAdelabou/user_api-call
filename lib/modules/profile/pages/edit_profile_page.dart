import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

enum Gender { male, female }

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  Gender gender = Gender.male;

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
    _nameController.dispose();
    _dateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double sizeBackground = 300;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFC).withOpacity(0.98),
      body: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 100,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: sizeBackground,
                        width: double.infinity,
                        child: Image.network(
                          'https://images.unsplash.com/photo-1660029865414-4a8f3c6ccc0e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        bottom: 10,
                        right: 10,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/camera.gif'),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: sizeBackground - 75,
                    left: size.width / 2 - 75,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(100, 100, 111, 0.3),
                                offset: Offset(0, 5),
                                blurRadius: 29,
                              ),
                            ],
                          ),
                          width: 150,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircleAvatar(
                              backgroundImage: const NetworkImage(
                                'https://images.unsplash.com/photo-1660078124420-2102b406348a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60',
                              ),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 10,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundImage:
                                AssetImage('assets/images/camera.gif'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 7,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _descriptionController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Kể cho tôi nghe về bạn.',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      'Họ và tên',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          hintText: 'Ví dụ: Nguyễn Văn A',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Ngày sinh',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          hintText: '24/11/2002',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Giới tính',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Radio(
                                  value: Gender.male,
                                  groupValue: gender,
                                  activeColor: Colors.red,
                                  onChanged: (Gender? newGender) {
                                    setState(
                                      () {
                                        gender = newGender!;
                                      },
                                    );
                                  },
                                ),
                                const Text(
                                  'Nam',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Radio(
                                  value: Gender.female,
                                  groupValue: gender,
                                  activeColor: Colors.red,
                                  onChanged: (Gender? newGender) {
                                    setState(
                                      () {
                                        gender = newGender!;
                                      },
                                    );
                                  },
                                ),
                                const Text(
                                  'Nữ',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Ví dụ: novauniversemail@gmail.com',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Số điện thoại',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Ví dụ: 0377712971',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Địa chỉ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.only(left: 15),
                      child: TextField(
                        controller: _addressController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: 'Ví dụ: Phường Linh Trung, TP. Thủ Đức',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'LƯU',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
