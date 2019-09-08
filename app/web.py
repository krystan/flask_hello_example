from app import app

@app.route('/')
def helloIndex():
    return 'Hello World from Python Flask!'
