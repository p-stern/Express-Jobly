"""Blogly application."""
from flask import Flask, render_template, request, redirect
from flask_debugtoolbar import DebugToolbarExtension
from models import db, connect_db, User


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = "chickens"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

connect_db(app)
db.create_all()


@app.route('/')
def home_page():
    """Redirect to list of users"""
    return redirect("/users")


@app.route('/users')
def users():
    """Shows users page"""
    users = User.query.order_by(User.last_name, User.first_name).all()
    return render_template("users.html", users=users)


@app.route('/users/new', methods=["GET"])
def get_user_page():
    """Shows create user page"""
    return render_template("create_user.html")


@app.route('/users/new', methods=["POST"])
def create_user():
    """Shows create new user"""
    first_name = request.form["first_name"]
    last_name = request.form["last_name"]
    image_url = request.form["image_url"]
    image_url = image_url if image_url else None

    new_user = User(first_name=first_name,
                    last_name=last_name, image_url=image_url)
    db.session.add(new_user)
    db.session.commit()
    return redirect("/")


@app.route("/users/<int:user_id>")
def show_user(user_id):
    """Shows details about single User"""
    user = User.query.get_or_404(user_id)
    return render_template("user_detail.html", user=user)


@app.route("/users/<int:user_id>/edit", methods=["GET"])
def get_user_edit(user_id):
    """Shows edit page or deletes"""
    if request.args["action"] == 'Edit':
        user = User.query.get(user_id)
        return render_template("edit_user.html", user=user)
    if request.args["action"] == 'Delete':
        user = User.query.get(user_id)
        return redirect(f"/users/{user_id}/delete")


@app.route("/users/<int:user_id>/edit", methods=["POST"])
def post_user_edit(user_id):
    """Shows edit page """
    if request.form["action"] == 'Save':
        first_name = request.form["first_name"]
        last_name = request.form["last_name"]
        image_url = request.form["image_url"]
        image_url = image_url if image_url else None

        user = User.query.get(user_id)
        user.first_name = first_name
        user.last_name = last_name
        user.image_url = image_url

        db.session.add(user)
        db.session.commit()
        return redirect("/")
    if request.form["action"] == 'Cancel':
        return redirect(f"/users/{user_id}")


@app.route("/users/<int:user_id>/delete", methods=["POST"])
def user_delete(user_id):
    """Delete user_id"""
    User.query.filter(User.id == user_id).delete()
    db.session.commit()
    return redirect("/")
