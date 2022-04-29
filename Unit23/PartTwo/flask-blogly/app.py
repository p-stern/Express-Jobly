"""Blogly application."""
from flask import Flask, render_template, request, redirect
from flask_debugtoolbar import DebugToolbarExtension
from models import db, connect_db, User, Post


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
    posts = Post.query.filter_by(user_id=user_id)
    return render_template("user_detail.html", user=user, posts=posts)


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
    user = User.query.filter(User.id == user_id).first()
    db.session.delete(user)
    db.session.commit()
    return redirect("/")


@app.route("/users/<int:user_id>/posts/new", methods=["GET"])
def get_post_page(user_id):
    """Shows Add Post page"""
    user = User.query.get_or_404(user_id)
    return render_template("create_post.html", user=user)


@app.route("/users/<int:user_id>/posts/new", methods=["POST"])
def post_post_page(user_id):
    """Shows edit page """
    if request.form["action"] == 'Add':
        title = request.form["title"]
        content = request.form["content"]

        new_post = Post(title=title, content=content, user_id=user_id)
        db.session.add(new_post)
        db.session.commit()

        user = User.query.get_or_404(user_id)
        posts = Post.query.filter_by(user_id=user_id)
        return render_template("user_detail.html", user=user, posts=posts)

    if request.form["action"] == 'Cancel':
        return redirect(f"/users/{user_id}")


@app.route("/posts/<int:post_id>", methods=["GET"])
def show_post(post_id):
    """Shows post page"""
    post = Post.query.filter_by(id=post_id).one()
    return render_template("post_detail.html", post=post)


@app.route("/posts/<int:post_id>/edit", methods=["GET"])
def get_post_edit(post_id):
    """Shows post edit page or deletes"""
    if request.args["action"] == 'Cancel':
        post = Post.query.get(post_id)
        return redirect(f"/users/{post.user_id}")
    if request.args["action"] == 'Edit':
        post = Post.query.get(post_id)
        return render_template("edit_post.html", post=post)
    if request.args["action"] == 'Delete':
        return redirect(f"/posts/{post_id}/delete")


@app.route("/posts/<int:post_id>/edit", methods=["POST"])
def post_post_edit(post_id):
    """Shows edit page """
    if request.form["action"] == 'Edit':
        post = Post.query.filter_by(id=post_id).one()
        post.title = request.form["title"]
        post.content = request.form["content"]

        db.session.add(post)
        db.session.commit()

        user = User.query.get_or_404(post.user_id)
        posts = Post.query.filter_by(user_id=post.user_id)
        return render_template("user_detail.html", user=user, posts=posts)

    if request.form["action"] == 'Cancel':
        return redirect(f"/posts/{post_id}")


@app.route("/posts/<int:post_id>/delete", methods=["POST"])
def post_delete(post_id):
    """Delete post_id"""
    post = Post.query.filter_by(id=post_id).one()
    Post.query.filter(Post.id == post_id).delete()

    db.session.commit()

    user = User.query.get_or_404(post.user_id)
    posts = Post.query.filter_by(user_id=post.user_id)
    return render_template("user_detail.html", user=user, posts=posts)
