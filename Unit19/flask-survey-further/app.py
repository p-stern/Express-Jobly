from typing import Text
from flask import Flask, request, render_template, redirect, flash, session, make_response
from flask_debugtoolbar import DebugToolbarExtension
from surveys import *

app = Flask(__name__)

app.config['SECRET_KEY'] = "chickens"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

@app.route('/')
def show_choice():
    """Show form dropdown"""
    return render_template("choose.html")

@app.route('/start')
def start_page():
    """Shows start page"""
    session['survey'] = int(request.args["form"][7:])
    if session['survey'] == 1 and request.cookies.get('survey-1-completed') == 'Yes':
        return redirect('/completed')
    elif session['survey'] == 2 and request.cookies.get('survey-2-completed') == 'Yes':
        return redirect('/completed')

    if session['survey'] == 1:
        return render_template("start.html", title=satisfaction_survey.title,
            instructions=satisfaction_survey.instructions)
    else:
        return render_template("start.html", title=personality_quiz.title,
            instructions=personality_quiz.instructions)

@app.route('/set-sessions',  methods=['POST'])
def set_sessions():
    """Set sessions"""
    session['responses'] = []
    return redirect('/questions/0')

@app.route('/questions/<int:question_num>')
def question_page(question_num):
    """Shows question; redirects to /thankyou if finished with survey;
        redirects to next unanswered question if attempting to jump to a different question; 
        redirect to same question if submitted without answering"""
    responses = session.get('responses')

    if session['survey'] == 1:
        survey = surveys['satisfaction']
    else:
        survey = surveys['personality']
    
    if  len(session['responses']) == len(survey.questions):
        return redirect('/thankyou')
    else:
        if  len(session['responses']) == question_num:
            if  len(session['responses']) != len(survey.questions):
                return render_template("questions.html", next=int(question_num) + 1,
                    question=survey.questions[question_num].question,
                    choices=survey.questions[question_num].choices)
            else:
                return redirect('/thankyou')
        else:     
            flash('You are trying to access an invalid question')
            return redirect(f"/questions/{len(session['responses'])}")

@app.route('/answer', methods=["POST"])
def save_answer(): 
    """Saves answer and redirects to next questions"""
    responses = session['responses']
    radio_choice = request.form.get('radio_choice')
    if radio_choice:
        responses.append(radio_choice)
        session['responses'] = responses
        if session['survey'] == 2 and len(responses) == 4:
            textarea = request.form.get('textarea')
            session['textarea'] = textarea    
    else:
        flash('Choose a response and submit')
    return redirect(f"/questions/{len(session['responses'])}")


@app.route('/thankyou')
def thank_you():
    """Shows Thank you Page"""
    print(session.get('responses'))

    if session['survey'] == 1:
        survey = surveys['satisfaction']

        html = render_template("thankyou.html", questions=survey.questions)
        resp = make_response(html)
        resp.set_cookie('survey-1-completed', 'Yes', max_age=60*60*24*365*100)
    else:
        survey = surveys['personality']
        
        html = render_template("thankyou.html", questions=survey.questions)
        resp = make_response(html)
        resp.set_cookie('survey-2-completed', 'Yes', max_age=60*60*24*365*100)
    return resp

@app.route('/completed')
def completed():
    """Shows Completion Page"""
    if session['survey'] == 1:
        survey = surveys['satisfaction']
    else:
        survey = surveys['personality']
    return render_template("completed.html", title=survey.title)