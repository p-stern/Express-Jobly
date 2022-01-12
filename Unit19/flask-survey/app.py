from flask import Flask, request, render_template, redirect, flash
from flask_debugtoolbar import DebugToolbarExtension
from surveys import *

app = Flask(__name__)

app.config['SECRET_KEY'] = "chickens"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

responses = []


@app.route('/')
def home_page():
    """Shows home page"""
    return render_template("start.html", title=satisfaction_survey.title,
        instructions=satisfaction_survey.instructions)

@app.route('/questions/<int:question_num>')
def question_page_0(question_num):
    """Shows question; redirects to /thankyou if finished with survey;
        redirects to next unanswered question if attempting to jump to a different question; 
        redirect to same question if submitted without answering"""
    print(len(responses))
    if  len(responses) == len(satisfaction_survey.questions):
        return redirect('/thankyou')
    else:
        if  len(responses) == question_num:
            if  len(responses) != len(satisfaction_survey.questions):
                return render_template("questions.html", next=int(question_num) + 1,
                    question=satisfaction_survey.questions[question_num].question)
            else:
                return redirect('/thankyou')
        else:     
            flash('You are trying to access an invalid question')
            return redirect(f'/questions/{len(responses)}')

@app.route('/answer', methods=["POST"])
def save_answer(): 
    """Saves answer and redirects to next questions"""
    radio_choice = request.form.get('radio_choice')
    if radio_choice:
        responses.append(radio_choice)
    else:
        flash('Choose a response and submit')
    return redirect(f'/questions/{len(responses)}')


@app.route('/thankyou')
def thank_you():
    """Shows Thank you Page"""
    return render_template("thankyou.html")