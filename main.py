from flask import Flask
from flask import render_template


app = Flask(__name__,static_folder='./statics')

@app.route('/')
def hello_world():
	return render_template('index.html')

@app.route('/water')
def water():
	return render_template('water.html')

if __name__ == '__main__':
	app.jinja_env.auto_reload = True
	app.debug = True
	app.run()