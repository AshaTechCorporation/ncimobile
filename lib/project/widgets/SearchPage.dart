import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ncimobile/LoadingDialog.dart';
import 'package:ncimobile/models/project.dart';
import 'package:ncimobile/project/service/ProjcetController.dart';
import 'package:ncimobile/project/service/ProjectService.dart';
import 'package:ncimobile/project/widgets/CardContentProjectWidget.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  FocusNode focusNode = FocusNode();
  List<Project>? projects = [];
  @override
  void initState() {
    super.initState();
    projects?.clear();
    focusNode.requestFocus();
  }

  Future listProjects({String? status, String? perPage, String? page, String? search, String? page_type}) async {
    // final list = await context.read<ProjectController>().getProjects(status: status, perPage: perPage, page: page, search: search, page_type: page_type);
    final list = await ProjectService.getListProjects(search: search);
    setState(() {
      projects = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: TextFormField(
                focusNode: focusNode,
                onChanged: (value) {
                  if (value.length > 3) {
                    LoadingDialog.open(context);
                    listProjects(search: value);
                    LoadingDialog.close(context);
                  }
                },
                decoration: InputDecoration(
                  hintText: 'ค้นหาโครงการ',
                  hintStyle: const TextStyle(fontSize: 14.0, color: Color(0xffA9A9A9), fontWeight: FontWeight.w500),
                  contentPadding: const EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            projects?.isEmpty ?? true
                ? SizedBox.shrink()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Text(
                      'โครงการทั้งหมด ${projects?.length ?? 0}',
                      style: TextStyle(fontSize: 25, color: Color(0xffA9A9A9), fontWeight: FontWeight.w500),
                    ),
                  ),
            projects?.isEmpty ?? true
                ? SizedBox(
                    width: double.infinity,
                    height: size.height * 0.7,
                    child: Center(
                      child: Text(
                        'ไม่พบรายการ',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
                    height: size.height * 0.7,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: SingleChildScrollView(
                        child: Column(
                          children: List.generate(
                            projects!.length,
                            (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                                child: CardContentProjectWidget(
                                  project: projects![index],
                                  size: size,
                                  budget: '${NumberFormat('#,##0', 'en_US').format(int.parse(projects?[index].total ?? '0'))} บาท',
                                  name: projects?[index].name ?? '',
                                  // startDate: DateFormat('yyyy-MM-dd').format(projects?[index].created_at ?? DateTime.now()),
                                  startDate: 'เดือน ${projects?[index].start_month ?? 0} ปี ${projects?[index].start_year ?? 0}',
                                  status: projects?[index].status ?? '',
                                  endDate: 'เดือน ${projects?[index].end_month ?? 0} ปี ${projects?[index].end_year ?? 0}',
                                  projectID: projects?[index].code ?? '',
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
