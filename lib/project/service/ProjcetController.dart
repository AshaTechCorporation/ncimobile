import 'package:flutter/material.dart';
import 'package:ncimobile/models/project.dart';
import 'package:ncimobile/project/service/ProjectService.dart';

class ProjectController extends ChangeNotifier {
  ProjectController({this.projcetController = const ProjectService()});
  ProjectService? projcetController;

  List<Project>? projects = [];
  Project? project;

  getProjects({String? status, String? perPage, String? page, String? search, String? page_type}) async {
    projects?.clear();
    projects = await ProjectService.getListProjects(status: status, perPage: perPage, page: page, search: search, page_type: page_type);

    notifyListeners();
  }

  getProjectsAll() async {
    projects?.clear();
    projects = await ProjectService.getListProjectsAll();

    notifyListeners();
  }

  getProject({required int id}) async {
    project = null;
    project = await ProjectService.getProjectID(id: id);

    notifyListeners();
  }
}
