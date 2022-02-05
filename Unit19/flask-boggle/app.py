from crypt import methods
from flask import Flask, request, render_template, redirect, flash, session, make_response, jsonify
# from flask_debugtoolbar import DebugToolbarExtension
from boggle import Boggle
# from timer import *

app = Flask(__name__)

app.config['SECRET_KEY'] = "chickens"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
# debug = DebugToolbarExtension(app)

boggle_game = Boggle()
boggle_game.score = 0
boggle_game.valid_words = []


@app.route('/')
def show_board():
    """Show Boggle board"""
    session['board'] = boggle_game.make_board()
    return render_template("board.html")

@app.route('/check-word')
def check_word():
    """Check if word is valid and on board"""
    word = request.args["word"]
    result = boggle_game.check_valid_word(session['board'], word)
    dict = {"result": result, "score": boggle_game.score } 
    return jsonify(dict)

@app.route('/post-score', methods=['POST'])
def post_score():
    """Check score & increment number of games played"""
    session['games-played'] = session.get('games-played', 0) + 1
    session['highscore'] = session.get('highscore', 0)
    score = int(request.json["score"])
    
    if score > session['highscore']:
        session['highscore'] = score
   
    return jsonify( session['highscore'], session['games-played'])
