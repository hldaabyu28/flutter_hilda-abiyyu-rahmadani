# Summary

##### 1. Dialog & bottom sheet merupakan tampilan yang melakukan sebuah fungsi tertentu tampilan ini seperti menekan sesuatu akan memunculkan tampilan yang bersifat sementara 

##### 2. Alert Dialog menginformasikan atau memnculkan tentang situasi tertentu kepada pengguna, dapat digunakan sebagai inputasn user, membutuhkan helper method showdialog

membuat Alert Dialog
```dart
showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
        content: const Text('Are You Sure?'),
        actions: [
    TextButton(
        onPressed: (){
    Navigator.pop(context);
       }, 
        child: const Text('No'),
       ),
    TextButton(
        onPressed: onPressed, 
        child: const Text('YES'),
       )
      ],
     ) 
    );
```
##### 3. Bottom Sheet hampir sama dengan dialog tetapi muncul dari bawah layar, menggunakan fugsi showModalBottomSheet, menggunakan 2 properti context dan builder 
membuat bottom sheet

```dart
showModalBottomSheet(
    shape: const RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(
         top: Radius.circular(20),
         ),
        ), 
    context: context ,
    builder: (context) => const ProfileSheet(),
);

```