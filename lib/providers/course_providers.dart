import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_flutter/entities/course.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final courseProvider =
    FutureProvider.autoDispose.family((ref, int courseId) async {
  final query = await Supabase.instance.client
      .from('courses')
      .select('*, lessons(*), exams(*)')
      .eq('course_id', courseId)
      .single();

  return Course.fromJson(query);
});

final coursesProvider =
    FutureProvider.autoDispose.family<List<Course>, int>((ref, page) async {
  final query = await Supabase.instance.client
      .from('courses')
      .select()
      .range(page, page + 10);

  return query.map((e) => Course.fromJson(e)).toList();
});

final coursesCountProvider = FutureProvider.autoDispose<int>((ref) async {
  final query = await Supabase.instance.client.from('courses').select().count();

  return query.count;
});
