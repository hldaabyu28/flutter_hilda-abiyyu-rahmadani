# Summary


# Fundamental OOP  
## 1. Membuat class merupakan bentuk abstraksi sebuah benda yang daialam class terdapat nilai-nilai yang nantinya dapat digunakan kembali memiliki ciri property dan juga dapat menampung sebuag method 

```
penggunaan class 

class Pohon{
    //property
    //method
}

Membuat objek 


 void main() {
    var P = Pohon();
}

```

## 2. Property mendeklarasikan variabel dan terletak di dadalam class

```
Penggunaan Property 

class Pohon {
    var nama = 'Beringin' ;
    var akar = 'Tunggang' ;
}

Mengakses Property


void main () {
    var P = Pohon();
    print(P.nama);
}

```

## 3. Method bersifat seperti fungsi tetapi terletak didalam class

```
Penggunaan Method 


class Pohon {
    String Tropis () {
        Print ('Indonesia');
    }
}

Mengakses Method 


void main () {
    String P = Pohon();
    P.Tropis();
}

```