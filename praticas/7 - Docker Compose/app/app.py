from flask import Flask
app = Flask(__name__)

@app.get("/")
def hello():
    return "salve galera do FAST 2025! 🚀🙏🎂👏"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
