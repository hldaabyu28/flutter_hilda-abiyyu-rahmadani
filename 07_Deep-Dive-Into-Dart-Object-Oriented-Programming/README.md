# Summary

### 1. - Constructor objek yang dijalankan pertama kali dan juga tidak memiliki return, penamaan sama dengan nama class 

        ```
        Penggunaan Constructor

        class Mobil {
            var Roda ;
            var Pintu;

         Mobil(){
            Roda  = 4 ;
            Pintu = 2 ;
         }
        }
        ```
###     - Inheritance pewarisan membuat class baru dengan memanfaatkan class yang ada

        ```

        Penggunaan Inheritance 

        class Mobil {
            var Roda ;
            var Pintu;

         Mobil(){
            Roda  = 0 ;
            Pintu = 0 ;
         }
        }


        class Inova extends Mobil {
            Inova(){
                Roda = 4 ;
                Pintu = 4 ;
            }
        }
        ```
###    - Method Overiding berguna untuk menulis ulang method pada super class untuk memberikan proses yang sama tapi menghasilkan hasil yang berbeda

        ```
        Penggunaan Overriding
    
        class Mobil {
            var Roda ;
            var Pintu;

         Mobil(){
            Roda  = 0 ;
            Pintu = 0 ;
         }

         warna (){
            print ('tidak mengerti');
         }
        }


        class Inova extends Mobil {
            Inova(){
                Roda = 4 ;
                Pintu = 4 ;
            }

            @override
            warna(){
                print ('pink);
            }
        }
        
        ```
###    - Interface berupa class seluruh method wajib menggunakan override digunakan menggunakan //Implements//

        ``` Penggunaan Interface

        class Mobil {
         warna(){
            print ('tidak tahu');
         }
         bahanBakar(){
            print ('tidak tahu');
         }
        }

        class Inova implements Mobil {
            @override
            warna(){
            print ('hitam');
         }
            @override
            bahanBakar(){
            print ('solar');
         }
        }

        ```
### 2. - Abstrak class sebuah class sebagai gambaran umum tidak dapat dibuat objek tidak semua method harus di override 
 
        ```
        Penggunaan abstrak class

        abstract class Mobil {
            warna(){
            print('tidak diketahui');
            }

            bahanBakar(){
            print('tidak diketahui');
            }
        }

        class Inova extends Mobil {
            @override
            warna() {
                print('pink');
            }

            @override
            bahanBakar() {
                print('solar');
            }
        }

        void main (){
            var k1 = Inova();
            k1.bahanBakar();
            k1.warna();

        }

        ```

### - Polymorphism kemampuan data yang berubah ke bentuk lain tipe data yang digunakan super class menggunkan extends ataupun implements 

        ```
        Penggunaan Polymorphism 

        class Mobil {
            warna(){
            print('tidak diketahui');
            }

            bahanBakar(){
            print('tidak diketahui');
            }
        }

        class Inova extends Mobil {
        @override
        warna() {
            print('pink');
        }

        @override
        bahanBakar() {
            print('solar');
        }
        }

        class Fortunner extends Mobil {
        @override
        warna() {
            print('Hitam');
        }
        @override
        bahanBakar() {
            print('Bensin');
        }
        }

        void main (){
        Mobil p = Mobil();
        print(p);

        p = Fortunner();
        print(p);

        p = Inova();
        p.warna();
        p.bahanBakar();
        }
        ```

### 3. - Generics dapat digunakan pada class ataupun fungsi tipe data ditentukan saat membuat class ataupun menjalankan fungsi 

        ```
        Penggunaan Generics 

        class Snack<T> {
        var isi;

        Snack(T i) {
            isi = i ;
         }
        }

        void main (){
        var h1 = Snack<String>('Orion');
        print(h1.isi);

        var h2 = Snack<int>(19);
        print(h2.isi);
        }

        ```

        ```

        Generics Cek tipe data 

            void cekTipe<T>(T data){
        print(data.runtimeType);
        }

        void main(){
        cekTipe<String>('P');
        cekTipe<int>(10);
        cekTipe<bool>(true);
        }
        ```

###    - Enkapsulasi teknik penyembunyian data bisa digunakan untuk menyembunyikan data yang penting , mengurangi potensi bug dalam kode 
###    - Getter dan juga setter mengakses terkontrol kedalam private
###    - mixin penggunaan fungsi ke dalam kelas dan digunakan tidak untuk pewarisan langsung dengan menggunakan with 
###    - Enum kumpulan nilai konstan menghindari string atau angka mentah 


