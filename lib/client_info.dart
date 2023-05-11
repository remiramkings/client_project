import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'alert_content.dart';

class ClientInfo extends StatefulWidget {
  @override
  State<ClientInfo> createState() => ClientInfoState();
}

class ClientInfoState extends State<ClientInfo> {
  String? selectedUserType;
  String? selectedAssignedUser;
  String? selectedContactType;
  var items = [
    'End User',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var names = ['Abhiram', 'name 1', 'name 2', 'name 3'];

  var contactTypes = ['Home', 'Office', 'Personal'];

  bool isChecked = false;


  TextEditingController folloupDateController = TextEditingController();
  TextEditingController folloupTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Row(
          children: const [
            Expanded(flex: 1, child: Text('New Client')),
            Text(
              'SAVE',
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownMenu(
                          inputDecorationTheme: const InputDecorationTheme(
                              border: UnderlineInputBorder()),
                          dropdownMenuEntries: items.map((String item) {
                            return DropdownMenuEntry(
                              value: item,
                              label: item,
                            );
                          }).toList(),
                          onSelected: (String? newValue) {
                            setState(() {
                              selectedUserType = newValue!;
                            });
                          },
                          initialSelection: selectedUserType,
                          label: const Text('Type')),
                    ),
                  ),
                  // const SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: DropdownMenu(
                          inputDecorationTheme: const InputDecorationTheme(
                            border: UnderlineInputBorder(),
                          ),
                          dropdownMenuEntries: names.map((String item) {
                            return DropdownMenuEntry(
                              value: item,
                              label: item,
                            );
                          }).toList(),
                          onSelected: (String? newValue) {
                            setState(() {
                              selectedAssignedUser = newValue!;
                            });
                          },
                          initialSelection: selectedAssignedUser,
                          label: const Text('Assigned User')),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    suffixIcon: Icon(
                      Icons.account_circle,
                      color: Colors.black,
                    )),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Mobile Number',
                        labelText: 'Mobile Number',
                      ),
                    ),
                  ),
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 25,
                    child: Image.asset('assets/images/whatapp.png'),
                  )
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: folloupDateController,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Follow up Date',
                          suffixIcon: InkWell(
                            child: const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2025));
                              String formatted =
                                  DateFormat('dd-MM-yyyy').format(pickedDate!);
                              if (pickedDate != null) {
                                setState(() {
                                  folloupDateController.text = formatted;
                                });
                              }
                            },
                          )),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: folloupTimeController,
                      decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          labelText: 'Follow up Time',
                          suffixIcon: InkWell(
                            child: const Icon(
                              Icons.calendar_month,
                              color: Colors.blue,
                            ),
                            onTap: () async {
                              TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now());

                              String formatted =
                                  pickedTime.toString().substring(10, 15);
                              if (pickedTime != null) {
                                setState(() {
                                  folloupTimeController.text = formatted;
                                });
                              }
                            },
                          )),
                    ),
                  )
                ],
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Location',
                    labelText: 'Add Location',
                    suffixIcon: Icon(
                      Icons.pin_drop,
                      color: Colors.blue,
                    )),
              ),
              TextFormField(
                  decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintText: 'GST Number',
                labelText: 'GST Number',
              )),
              SizedBox(height: 10),
              const InkWell(
                child: Text(
                  'Add More Details',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black54),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                child: Text(
                  'Add More Contacts',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.black54),
                ),
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                      content: AlertContent()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
