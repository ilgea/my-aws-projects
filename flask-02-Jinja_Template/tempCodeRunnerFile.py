from flask import Flask,render_template

app = Flask(__name__)

@app.route('/')
def head():
    return render_template("index.html", number1 =7000 , number2 =9000)  # index.html 'i kirala, değişkenlere de 7000 ve 9000 değerlerin ata.

# @app.route('/number')
# def number():
#     num1 = 2000
#     num2 = 10000
#     return render_template("body.html", value1=num1, value2=num2, sum=num1+num2)

@app.route('/mult')
def number():
    var1, var2 = 5210, 8960
    return render_template('body.html', num1 = var1, num2 = var2, multiplication = var1*var2)



if __name__ == "__main__" :
    app.run(debug=True,port=2000)