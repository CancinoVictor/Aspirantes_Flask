from flask import Flask,render_template
 
app = Flask(__name__)
 

@app.route("/")
def add_aspirante():
    return render_template("aspirante.html")

if __name__ == "__main__":
    app.run()