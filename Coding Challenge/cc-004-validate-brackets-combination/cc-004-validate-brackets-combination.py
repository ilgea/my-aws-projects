def validate(z) :
    while "()" in z or "[]" in z or "{}" in z:
        z = z.replace("()","").replace("[]","").replace("{}","")
    # print(z == "")
    if z == "":
        print(True)
    else:
        print(False)

z = input("giriş yapınız :")()
validate(z)



