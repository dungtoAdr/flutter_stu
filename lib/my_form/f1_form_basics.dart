import 'package:flutter/material.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameConTroller = TextEditingController();
  final _emailConTroller = TextEditingController();
  final _passwordConTroller = TextEditingController();
  
  bool _isAgreed = false;
  bool _obsxcurePassword = true;
  String? _name;
  String? _selectedCity;
  String? _gender;
  DateTime? _dateOfBirth;

  final List<String> _cities = [
    'Ha Noi',
    "Thanh pho HCM",
    "Hai Phong",
    'Ninh binh',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form co ban")),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              //Textformfield la phien ban mo rong cua text field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Ho va ten",
                  hintText: "Nhap ho va ten",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _name = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long nhap ho va ten';
                  }
                  return null;
                },
              ),
              FormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long chon gioi tinh';
                  }
                  return null;
                },
                initialValue: _gender,
                builder: (FormFieldState<String> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RadioListTile<String>(
                        title: Text("Nam"),
                        value: 'male',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                            state.didChange(value);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              FormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long chon gioi tinh';
                  }
                  return null;
                },
                initialValue: _gender,
                builder: (FormFieldState<String> state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RadioListTile<String>(
                        title: Text("Nu"),
                        value: 'female',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                            state.didChange(value);
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: _fullnameConTroller,
                decoration: InputDecoration(
                  labelText: "Ho va ten",
                  hintText: "Nhap ho va ten",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  _name = value;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long nhap ho va ten';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailConTroller,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long nhap ho va ten';
                  }
                  if (!RegExp(
                    r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,4}$',
                  ).hasMatch(value)) {
                    return "Email khong hop le";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordConTroller,
                decoration: InputDecoration(
                  labelText: 'Mat khau',
                  hintText: 'Nhap mat khau',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obsxcurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obsxcurePassword = !_obsxcurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
                obscureText: _obsxcurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long nhap mat khau';
                  }
                  if (value.length < 6) {
                    return "Mat khau phai hon 8 ki tu";
                  }
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Thanh pho",
                  border: OutlineInputBorder(),
                ),
                value: _selectedCity,
                items:
                    _cities.map((city) {
                      return DropdownMenuItem(child: Text(city), value: city);
                    }).toList(),
                onChanged: (value) {},
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui long chon thanh pho';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              CheckboxListTile(
                  title: Text("Ban dong y voi dieu khoan con ty Xtel"),
                  value: _isAgreed,
                  onChanged: (value){
                    setState(() {
                      _isAgreed = value!;
                      print("Dong y : $_isAgreed");
                    });
                  },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Xin chao $_name")),
                        );
                      }
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                      setState(() {
                        _name = null;
                      });
                    },
                    child: Text("Resett"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
