from flask import Flask,render_template
 
app = Flask(__name__)
 
@app.route("/")
def hello_world():
    return "<p>Hello, World!</p>"

@app.route("/aspirante")
def add_aspirante():
    return render_template("aspirante.html")

if __name__ == "__main__":
    app.run()