from functools import reduce
from string import printable

sayac = 0
x = []
print("Programdan Çıkmak İçin Lütfen Exit yazınız:")
while True:
    z = input("Lütfen Bir Sayı Giriniz: ")
    if z == "exit".lower():
        break
    elif z.isprintable() and z.isdigit() == False :
        continue
    else:
        x.append(int(z))
        sayac += 1
        if sayac != 5 :
            continue
        else :
            sayac = 0
            def find_max(a,b):  # Bir fonsiyon yazdık, iki sayıyı karşılaştırsın, bize büyük olanını versin.
                if a > b:
                    return a
                return b
    print(f"En Yüksek Sayı {reduce(find_max,x)}")

# Ardından reduce fonksiyonu içersine yukarıdaki fonksiyonu ve listeyi parametre olarak giriyoruz.
# Listenin elemanlarını ilk 2 elemandan başlamaz üzere ikişer ikişer alarak yazdığımız fonksiyon gereği en büyüğünü döndürerek bize istediğimiz sonucu veriyor.