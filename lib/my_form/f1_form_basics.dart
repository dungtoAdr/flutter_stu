import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FormBasicDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormBasicDemoState();
}

class _FormBasicDemoState extends State<FormBasicDemo> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameConTroller = TextEditingController();
  final _emailConTroller = TextEditingController();
  final _passwordConTroller = TextEditingController();
  final _dateofBirthConTroller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  bool _isAgreed = false;
  bool _obsxcurePassword = true;
  String? _name;
  String? _selectedCity;
  String? _gender;
  DateTime? _dateOfBirth;
  File? _profileImage;

  final List<String> _cities = [
    'Ha Noi',
    "Thanh pho HCM",
    "Hai Phong",
    'Ninh binh',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form co ban"),backgroundColor: Colors.cyan,),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [

                FormField<File>(
                  validator: (value){
                    if(value==null){
                      return 'Vui long chon anh';
                    }
                    return null;
                  },
                  builder: (FormFieldState<File> state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Anh dai dien',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final XFile? image = await showDialog(
                                  context: context,
                                  builder:
                                  (context) => AlertDialog(
                                    title: Text('Chon nguon'),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.photo_album),
                                          title: Text('Thu vien'),
                                          onTap: () async{
                                            Navigator.pop(
                                              context,
                                              await _picker.pickImage(
                                                  source: ImageSource.gallery,
                                              )
                                            );
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('May anh'),
                                          onTap: () async {
                                            Navigator.pop(
                                              context,
                                              await _picker.pickImage(
                                                  source: ImageSource.camera,
                                              )
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                              );
                              if(image!=null){
                                setState(() {
                                  _profileImage = File(image.path);
                                  state.didChange(_profileImage);
                                });
                              }
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(60),
                                border: Border.all(
                                  color:
                                    state.hasError
                                      ?Colors.red:Colors.grey.shade300,
                                  width: 2,
                                )
                              ),
                              child:
                              _profileImage != null ? ClipRRect(
                                borderRadius: BorderRadius.circular(60),
                                child: Image.file(
                                  _profileImage!,
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ):Icon(
                                Icons.add_a_photo,
                                size: 40,
                                color: Colors.green.shade400,
                              )
                            ),
                          ),
                        ),
                        if(state.hasError)
                          Center(
                            child: Padding(
                                padding: EdgeInsets.only(top: 8),
                              child: Text(
                                state.errorText!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          )
                      ],
                    );
                  }),

                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
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
                SizedBox(height: 20,),
                TextFormField(
                  controller: _dateofBirthConTroller,
                  decoration: InputDecoration(
                      labelText: "Ngay sinh",
                      hintText: "Nhap ngay sinh",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today)
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2025)
                    );
                    if(pickedDate!=null){
                      String formattedDate = DateFormat("dd/MM/yyyy").format(pickedDate);
                      setState(() {
                        _dateofBirthConTroller.text = formattedDate;
                        _dateOfBirth = pickedDate;
                      });
                    }
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Vui long chon ngay sinh';
                    }
                  },
                ),

                SizedBox(height: 20,),
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
                  title: Text("Ban dong y voi dieu khoan cong ty Xtel"),
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
                          _dateofBirthConTroller.text = "";
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
      ),
    );
  }
}
