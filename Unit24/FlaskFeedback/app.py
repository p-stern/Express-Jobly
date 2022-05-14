from flask import Flask, render_template, redirect, session, flash
from flask_debugtoolbar import DebugToolbarExtension
from models import connect_db, db, User, Feedback
from forms import RegisterForm, LoginForm, FeedbackForm

from sqlalchemy.exc import IntegrityError

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "postgresql:///flaskfeedback_db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True
app.config["SECRET_KEY"] = "abc123"
app.config["DEBUG_TB_INTERCEPT_REDIRECTS"] = False

connect_db(app)
db.create_all()

toolbar = DebugToolbarExtension(app)


@app.route('/')
def home_page():
    return redirect('/register')


@app.route('/register', methods=['GET', 'POST'])
def register_user():
    """Renders Register form (GET) or handles Register form submission (POST)"""

    form = RegisterForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        email = form.email.data
        first_name = form.firstname.data
        last_name = form.lastname.data
        
        new_user = User.register(username, password, email, first_name, last_name)
        
        db.session.add(new_user)
        try:
            db.session.commit()
        except IntegrityError:
            form.username.errors.append('Username taken.  Please pick another.')
            return render_template("register_form.html", form=form)
        session["username"] = new_user.username
        # return redirect('/secret')
        return redirect(f"/users/{new_user.username}")

    return render_template("register_form.html", form=form)

@app.route('/login', methods=['GET', 'POST'])
def login_user():
    form = LoginForm()
    if form.validate_on_submit():
        username = form.username.data
        password = form.password.data
        
        user = User.authenticate(username, password)
        if user:
            session["username"] = user.username
            return redirect(f"/users/{user.username}")
        else:
            form.username.errors = ['Invalid username/password.']

    return render_template('login_form.html', form=form)


@app.route('/users/<username>', methods=['GET', 'POST'])
def user_page(username):
    if ("username" not in session) or (username != session["username"]):
        flash(f"Please login as {username} first!","danger")
        return redirect('/login')
  
    user = User.query.filter_by(username=username).all()  
    form = FeedbackForm()
    all_feedback = Feedback.query.filter_by(username=username).all()

    if form.validate_on_submit():
        title = form.title.data
        content = form.content.data
        new_feedback = Feedback(title=title, content=content, username=session["username"])
        db.session.add(new_feedback)
        db.session.commit()
        flash("Feedback Added!","success")
        return redirect(f"/users/{username}")
    else:
        return render_template('user.html', user=user, form=form, all_feedback=all_feedback)

@app.route('/secret')
def secret_page():
    if "username" not in session:
        return redirect('/login')

    return "You made it!"


@app.route('/logout')
def logout_user():
    session.pop("username", None)
    return redirect('/')

    
@app.route('/users/<username>/delete', methods=['GET', 'POST'])
def delete_user(username):
    """Delete user & feedback"""
    
    if ("username" not in session) or (username != session["username"]):
        flash("Please login first!","danger")
        return redirect("/login")
       
    if username == session["username"]:
        user = User.query.filter_by(username=username).first()
        db.session.delete(user)  
        db.session.commit()
        flash("User Deleted!","info")
        return redirect("/logout")
    else:
        flash("You don't have permission to do that!","danger")
        return redirect(f"/users/{username}")


@app.route('/users/<username>/feedback/add', methods=['GET', 'POST'])
def add_feedback(username):
    """Display a form to add feedback and POST """
    if ("username" not in session) or (username != session["username"]):
        flash(f"Please login as {username} first!","danger")
        return redirect('/login')
    
    form = FeedbackForm()
    if form.validate_on_submit():
        title = form.title.data
        content = form.content.data
        new_feedback = Feedback(title=title, content=content, username=session["username"] )
        db.session.add(new_feedback)
        db.session.commit()
        flash("Feedback Created!","success")
        return redirect(f"/users/{username}")
    else:   
        return render_template('feedback.html', form=form, action="Add")
    

@app.route('/feedback/<int:id>/update', methods=['GET', 'POST'])
def update_feedback_page(id):
    feedback = Feedback.query.filter_by(id=id).first_or_404()  
    if feedback.user.username != session["username"]:
        flash(f"Please login as {feedback.user.username} first!","danger")
        return redirect('/login')

    form = FeedbackForm(obj=feedback)
    if form.validate_on_submit():
        feedback.title = form.title.data
        feedback.content = form.content.data
        db.session.commit()
        flash("Feedback Updated!","success")
        return redirect(f"/users/{feedback.user.username}")
        
    return render_template('feedback.html', form=form, action="Edit")

@app.route('/feedback/<int:id>/delete', methods=['GET', 'POST'])
def delete_feedback(id):
    """Delete feedback"""
    if "username" not in session:
        flash("Please login first!","danger")
        return redirect("/login")
    
    feedback = Feedback.query.filter_by(id=id).first_or_404()
    
    if feedback.user.username == session["username"]:
        db.session.delete(feedback)
        db.session.commit()
        flash("Feedback Deleted!","info")
        return redirect(f"/users/{feedback.user.username}")

    flash("You don't have permission to do that!","danger")
    return redirect(f"/users/{feedback.user.username}")