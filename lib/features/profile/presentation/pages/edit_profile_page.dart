import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../widgets/custom_button.dart';
import '../../data/simple_data.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  static const String route = 'edit_profile';

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  
  final Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;

  DateTime? date;

  final TextEditingController _birthdayTextController = TextEditingController();

  void _showDatePicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: kContentColorLightTheme,
        actions: [
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.single,
            todayHighlightColor: Colors.amber,
            showTodayButton: false,
            confirmText: 'Ok',
            cancelText: 'Cancel',
            backgroundColor: kContentColorLightTheme,
            selectionColor: Colors.green,
            headerStyle: const DateRangePickerHeaderStyle(
                textStyle: TextStyle(fontSize: 18)),
            showActionButtons: true,
            showNavigationArrow: true,
            onCancel: () => Navigator.pop(context),
            onSubmit: (value) {
              setState(() {
                _birthdayTextController.text =
                    DateFormat.yMd().format(value! as DateTime);
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

  String dropdownCountry = itemsCountry.first;
  String dropdownGender = itemsGender.first;
  String dropdownPhone = itemsPhone.first;
  String? birthday;

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: brightness == Brightness.light
          ? Colors.white
          : Colors.blueGrey.withOpacity(.2),
      borderRadius: BorderRadius.circular(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(kDefaultPadding)),
        child: Form(
          child: Column(
            children: [
              textFormField(
                  title: 'Full Name',
                  textInputType: TextInputType.name,
                  birthday: birthday),
              textFormField(
                  title: 'User Name', textInputType: TextInputType.name),
              birthdayFormField(brightness: brightness),
              textFormField(
                  title: 'Email',
                  textInputType: TextInputType.emailAddress,
                  icon: Icons.email_outlined),
              dropdownCountryField(),
              dropdownPhoneField(),
              dropdownGenderField(),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  title: "Update",
                  color: brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
                  colorText: brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                  press: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dropdownPhoneField() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(kDefaultPadding),
      ),
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey.withOpacity(.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              value: dropdownPhone,
              icon: const Icon(Icons.arrow_drop_down_outlined),
              borderRadius: BorderRadius.circular(12),
              dropdownColor: Colors.blueGrey,
              // Array list of items
              items: itemsPhone.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownPhone = newValue!;
                });
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(kDefaultPadding / 2),
          ),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: 'Number Phone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                  gapPadding: 5,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container dropdownGenderField() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(kDefaultPadding),
        right: getProportionateScreenWidth(kDefaultPadding / 2),
      ),
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      decoration: boxDecoration(),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropdownGender,
          icon: const Icon(Icons.arrow_drop_down_outlined),
          isExpanded: true,
          borderRadius: BorderRadius.circular(12),
          dropdownColor: Colors.blueGrey,
          // Array list of items
          items: itemsGender.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownGender = newValue!;
            });
          },
        ),
      ),
    );
  }

  Container dropdownCountryField() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: getProportionateScreenWidth(kDefaultPadding),
        right: getProportionateScreenWidth(kDefaultPadding / 2),
      ),
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueGrey.withOpacity(.2)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropdownCountry,
          icon: const Icon(Icons.arrow_drop_down_outlined),
          isExpanded: true,
          borderRadius: BorderRadius.circular(12),
          dropdownColor: Colors.blueGrey,
          // Array list of items
          items: itemsCountry.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownCountry = newValue!;
            });
          },
        ),
      ),
    );
  }

  Container birthdayFormField({required Brightness brightness}) {
    return Container(
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: _birthdayTextController,
        // onSaved: (newValue) => birthday = newValue!,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          label: Text(_birthdayTextController.text),
          hintText: 'Birthday',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
            gapPadding: 5,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          suffixIcon: IconButton(
              onPressed: () {
                _showDatePicker();
              },
              icon: const Icon(Icons.date_range)),
        ),
      ),
    );
  }

  Container textFormField({
    required String title,
    String? birthday,
    required TextInputType textInputType,
    IconData? icon,
  }) {
    return Container(
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        onSaved: (newValue) => birthday = newValue!,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
            gapPadding: 5,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          suffixIcon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
