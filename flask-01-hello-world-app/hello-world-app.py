from flask import Flask

app = Flask(__name__)

@app.route('/')  # Kök sayfa. Bir nevi anasayfa gibi düşünebilirsin.
def hello():
    return "Hello World from Flask!!!"

@app.route('/second')
def second():
    return "Bize Her yer Galatasaray"

@app.route('/third/subthird')
def third():
    return "This is the subpage of third page"

@app.route('/forth/<int:id>')
def forth(id):
   return "Id number of this page is " + str(id)  # veya -> f"Id number of this page is {id}"





if __name__ == "__main__":
    app.run(debug=True, port=2000)