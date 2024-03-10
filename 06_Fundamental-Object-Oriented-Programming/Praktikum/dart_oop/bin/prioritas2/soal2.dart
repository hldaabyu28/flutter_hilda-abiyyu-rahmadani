class Course {
  String title;
  String description;

  Course(this.title, this.description);
}

class Student {
  String name;
  String className;
  List<Course> courses = [];

  Student(this.name, this.className);

  // Method untuk menambahkan course ke daftar course student
  void addCourse(Course course) {
    courses.add(course);
  }

  // Method untuk menghapus course dari daftar course student
  void removeCourse(Course course) {
    courses.remove(course);
  }

  // Method untuk melihat semua course yang dimiliki student
  void viewCourses() {
    if (courses.isEmpty) {
      print('Student belum memiliki course.');
    } else {
      print('Courses yang dimiliki oleh $name:');
      for (var course in courses) {
        print('${course.title}: ${course.description}');
      }
    }
  }
}

void main() {
  // Membuat instance dari Course
  Course mathCourse = Course('Matematika', 'Pelajaran tentang angka dan perhitungan.');
  Course scienceCourse = Course('Ilmu Pengetahuan Alam', 'Pelajaran tentang alam semesta dan fenomena alamiah.');
  Course physicsCourse = Course('Fisika', 'Pelajaran tentang ilmu yang mempelajari gejala-gejala alam dari segi materi dan energinya');

  // Membuat instance dari Student
  Student student1 = Student('Hilda', '12');

  // Menambahkan course ke student
  student1.addCourse(mathCourse);
  student1.addCourse(scienceCourse);
  student1.addCourse(physicsCourse);

  // Menampilkan semua course yang dimiliki student
  student1.viewCourses();

  // Menghapus course dari student
  // student1.removeCourse(mathCourse);

  // // Menampilkan semua course yang dimiliki student setelah penghapusan
  // student1.viewCourses();
}
