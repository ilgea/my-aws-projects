def ikili(x) :
    vowels = "aeıioöuü"
    sayac = 0
    for i in vowels :
        for j in vowels :
            if i+j in x :
                sayac += 1
                print("Positive")
                break
        if sayac ==1 :
            break
            # else:
            #     print("Negative")
            #     break
        
    if sayac == 0 :
        print("Negative")

x = input("Please enter a string: ")
if len(x) <= 1 :
    print("Negative")
else:
    ikili(x)