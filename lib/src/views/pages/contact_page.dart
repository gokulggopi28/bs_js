import 'package:bs_js/src/controller/record_cubit/records_cubit.dart';
import 'package:bs_js/src/views/widgets/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff008000),
        title: Text("Contacts"),
      ),
      body: BlocProvider(
        create: (context) => RecordsCubit()..getRecordsData(),
        child: SafeArea(
          child: BlocBuilder<RecordsCubit, RecordsState>(
            builder: (context, state) {
              if (state is RecordsLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is RecordsSuccess) {
                return ListView.builder(
                  itemCount: state.records.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ContactListItem(record: state.records[index]);
                  },
                );
              } else if (state is RecordsError) {
                return Text("Oop's!..... Something went wrong");
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
