import 'package:flutter/material.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("assets/images/login1.png"),
              width: 140.0,
              height: 140.0,
            ),
            TextFormField(
              controller: _namaController,
              maxLines: 1,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: "Nama",
                hintText: "Masukkan Nama",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _emailController,
              maxLines: 1,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Masukkan Email",
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _phoneController,
              maxLines: 1,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Handpone",
                hintText: "Masukkan Nomer Hp",
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordController,
              maxLines: 1,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Masukkan Password",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () => submit(
                context,
                _namaController.text,
                _emailController.text,
                _phoneController.text,
                _passwordController.text,
              ),
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }

  void submit(BuildContext context, String name, String email, String phone, String password) {
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty) {
      final snackBar = SnackBar(
        duration: const Duration(seconds: 5),
        content: Text("Maaf semuanya harus diisi"),
        backgroundColor: Colors.red,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }

    AlertDialog alert = AlertDialog(
      title: Text("Registrasi Berhasil"),
      content: Container(
        child: Text("Selamat Anda Berhasil Registrasi"),
      ),
      actions: [
        TextButton(
            child: Text('Ok'),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MyHomePage(
                          name: name,
                          email: email,
                          phone: phone,
                          password: password,
                        )))),
      ],
    );

    showDialog(context: context, builder: (context) => alert);
    return;
  }
}
