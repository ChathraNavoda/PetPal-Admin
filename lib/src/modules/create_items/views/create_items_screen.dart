import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_repository/pet_supplies_repository.dart';
import 'package:petpaladmin/src/components/my_text_field.dart';
import 'package:petpaladmin/src/modules/create_items/components/macro.dart';

class CreateItemsScreen extends StatefulWidget {
  const CreateItemsScreen({super.key});

  @override
  State<CreateItemsScreen> createState() => _CreateItemsScreenState();
}

class _CreateItemsScreenState extends State<CreateItemsScreen> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final weightController = TextEditingController();
  final lenController = TextEditingController();
  final widthController = TextEditingController();
  String? _errorMsg;
  late Item item;

  @override
  void initState() {
    item = Item.empty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Create a new items!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              const SizedBox(height: 10),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: Ink(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.photo,
                        size: 100,
                        color: Colors.grey.shade200,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Add a picture!",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: 400,
                      child: MyTextField(
                        controller: nameController,
                        hintText: 'Name',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        errorMsg: _errorMsg,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: MyTextField(
                        controller: desController,
                        hintText: 'Description',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        errorMsg: _errorMsg,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Please fill in this field';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          Expanded(
                            child: MyTextField(
                              controller: priceController,
                              hintText: 'Price',
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              errorMsg: _errorMsg,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill in this field';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MyTextField(
                              controller: discountController,
                              hintText: 'Discount',
                              suffixIcon: Icon(
                                CupertinoIcons.percent,
                                color: Colors.grey[500],
                                size: 20,
                              ),
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              errorMsg: _errorMsg,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Please fill in this field';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text("Macros"),
                  ),
                  SizedBox(
                    width: 400,
                    child: Row(
                      children: [
                        MyMacro(
                          title: 'Weight',
                          value: "22",
                          //value: item.macros.weight.toString(),
                          icon: FontAwesomeIcons.dumbbell,
                          controller: weightController,
                        ),
                        const SizedBox(width: 5),
                        MyMacro(
                          title: "Length",
                          value: '55',
                          controller: lenController,
                          //value: item.macros.length.toString(),
                          icon: FontAwesomeIcons.ruler,
                        ),
                        const SizedBox(width: 5),
                        MyMacro(
                          title: "Width", value: '99',
                          controller: widthController,
                          // value: item.macros.width.toString(),
                          icon: FontAwesomeIcons.ruler,
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
