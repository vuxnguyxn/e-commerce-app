import 'package:e_commerce_app/blocs/app_bloc/app_bloc.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/size_config.dart';
import 'package:e_commerce_app/repository/auth_repository.dart';
import 'package:e_commerce_app/widgets/notification_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../widgets/custom_button.dart';
import '../../../profile/data/simple_data.dart';

class FillYourProfilePage extends StatefulWidget {
  const FillYourProfilePage({super.key});

  static const String route = '/fill_your_profile';

  @override
  State<FillYourProfilePage> createState() => _FillYourProfilePageState();
}

class _FillYourProfilePageState extends State<FillYourProfilePage> {
  DateTime? date;

  final TextEditingController birthday = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController phone = TextEditingController();

  String dropdownCountry = itemsCountry.first;
  String dropdownGender = itemsGender.first;
  String dropdownPhone = itemsPhone.first;
  String authErrorFillYourPage = '';

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    print("fill your page: ${AuthRepository().currentUser}");

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Fill Your Profile',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
            vertical: getProportionateScreenWidth(kDefaultPadding),
          ),
          child: Form(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth * .3,
                      height: SizeConfig.screenWidth * .3,
                      child: CircleAvatar(
                        child: Image.asset("assets/images/profile_image.png"),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: getProportionateScreenWidth(32),
                        height: getProportionateScreenWidth(32),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isDarkMode ? Colors.white : Colors.black),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: isDarkMode ? Colors.black : Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                textFormField(
                  title: 'Full Name',
                  textInputType: TextInputType.name,
                  textEditingController: fullName,
                ),
                textFormField(
                  title: 'User Name',
                  textInputType: TextInputType.name,
                  textEditingController: userName,
                ),
                birthdayFormField(),
                // textFormField(
                //     title: 'Email',
                //     textInputType: TextInputType.emailAddress,
                //     icon: Icons.email_outlined),
                dropdownCountryField(),
                dropdownPhoneField(),
                dropdownGenderField(),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding * 2),
                ),
                NotificationError(text: authErrorUpdateProfile),
                BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        title: "Continue",
                        color: isDarkMode ? Colors.white : Colors.black,
                        colorText: isDarkMode ? Colors.black : Colors.white,
                        isLoading: state.isLoading,
                        press: () {
                          final phoneSplit = dropdownPhone.split("(").last;
                          final phoneID = phoneSplit.split(")").first;

                          if (fullName.text == "") {
                            authErrorFillYourPage = 'Full name is empty!';
                            showDialogError(
                                isDarkMode: isDarkMode,
                                textError: authErrorFillYourPage);
                          } else if (userName.text == "") {
                            authErrorFillYourPage = 'User name is empty!';
                            showDialogError(
                                isDarkMode: isDarkMode,
                                textError: authErrorFillYourPage);
                          } else if (phone.text == "") {
                            authErrorFillYourPage = 'Number phone is empty!';
                            showDialogError(
                                isDarkMode: isDarkMode,
                                textError: authErrorFillYourPage);
                          } else if (birthday.text == "") {
                            authErrorFillYourPage = 'Date of birth is empty!';
                            showDialogError(
                                isDarkMode: isDarkMode,
                                textError: authErrorFillYourPage);
                          } else {
                            context.read<AppBloc>().add(
                                  AppEventUpdateProfile(
                                    displayName: fullName.text,
                                    photoURL: photoURL,
                                    birthday: birthday.text,
                                    country: dropdownCountry,
                                    gender: dropdownGender,
                                    phone: "$phoneID ${phone.text}",
                                    username: userName.text,
                                    context: context,
                                  ),
                                );
                            print(state);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
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
                    style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).textTheme.bodyMedium?.color),
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
              onChanged: (value) {
                phone.text = value;
              },
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
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
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
              child: Text(
                item,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color),
              ),
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
              child: Text(
                item,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color),
              ),
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

  Container birthdayFormField() {
    return Container(
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: birthday,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          label: birthday.text != ''
              ? Text(birthday.text)
              : Text(
                  'Date of Birth',
                  style: TextStyle(
                      color: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.color
                          ?.withOpacity(.5)),
                ),
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
                showDatePicker();
              },
              icon: const Icon(Icons.date_range)),
        ),
      ),
    );
  }

  Container textFormField({
    required String title,
    required TextInputType textInputType,
    IconData? icon,
    required TextEditingController textEditingController,
  }) {
    return Container(
      margin:
          EdgeInsets.only(bottom: getProportionateScreenWidth(kDefaultPadding)),
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        keyboardType: textInputType,
        onChanged: (value) {
          textEditingController.text = value;
        },
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
          suffixIcon: icon == null ? Icon(icon) : null,
        ),
      ),
    );
  }

  void showDatePicker() {
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
                if (value != null) {
                  birthday.text = DateFormat.yMd().format(value as DateTime);
                }
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

  void showDialogSuccess({required bool isDarkMode}) {
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
              vertical: getProportionateScreenWidth(kDefaultPadding * 3),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDarkMode ? kContentColorLightTheme : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check,
                  size: 36,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Text(
                  'Congratulations!',
                  style: TextStyle(fontSize: getProportionateScreenWidth(22)),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Text(
                  'Your account is ready to use. You will be redirected to the Home page in a \n few seconds.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showDialogError({required bool isDarkMode, required String textError}) {
    showDialog(
      context: context,
      builder: (builder) => AlertDialog(
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(kDefaultPadding),
              vertical: getProportionateScreenWidth(kDefaultPadding * 3),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isDarkMode ? kContentColorLightTheme : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cancel,
                  size: 36,
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Text(
                  'Error!',
                  style: TextStyle(fontSize: getProportionateScreenWidth(22)),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(kDefaultPadding),
                ),
                Text(
                  textError,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
