""" app.py """

from operations import *
from flask import Flask, request

app = Flask(__name__)


@app.route('/')
def main_route():
    return "in"


@app.route('/add')
def add_route():
    a = request.args["a"]
    b = request.args["b"]
    return str(add(int(a), int(b)))


@app.route('/sub')
def sub_route():
    a = request.args["a"]
    b = request.args["b"]
    return str(sub(int(a), int(b)))


@app.route('/mult')
def mult_route():
    a = request.args["a"]
    b = request.args["b"]
    return str(mult(int(a), int(b)))


@app.route('/div')
def div_route():
    a = request.args["a"]
    b = request.args["b"]
    return str(div(int(a), int(b)))


@app.route('/math/<operation>')
def route(operation):
    a = request.args["a"]
    b = request.args["b"]

    dict = {"add": add,
            "sub": sub,
            "mult": mult,
            "div": div}

    return str(dict[operation](int(a), int(b)))
