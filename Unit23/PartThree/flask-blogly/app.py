"""Blogly application."""
from flask import Flask, render_template, request, redirect
from flask_debugtoolbar import DebugToolbarExtension
from models import db, connect_db, User, Post, PostTag, Tag

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
    """Redirect to list of tags"""
    return redirect("/tags")


@app.route('/tags')
def tags():
    """Shows tags page"""
    tags = Tag.query.all()
    return render_template("list_tag.html", tags=tags)


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
    tags = Tag.query.all()
    return render_template("create_post.html", user=user, tags=tags)


@app.route("/users/<int:user_id>/posts/new", methods=["POST"])
def post_post_page(user_id):
    """Posts post and shows User Detail page"""
    if request.form["action"] == 'Add':
        title = request.form["title"]
        content = request.form["content"]
        checkboxes = request.form.getlist("checkboxes")

        new_post = Post(title=title, content=content, user_id=user_id)
        db.session.add(new_post)
        db.session.commit()

        for tag_id in checkboxes:
            new_posttag = PostTag(post_id=new_post.id, tag_id=tag_id)
            db.session.add(new_posttag)
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
    tags = PostTag.query.filter_by(post_id=post_id).all()
    return render_template("post_detail.html", post=post, tags=tags)


@app.route("/posts/<int:post_id>/edit", methods=["GET"])
def get_post_edit(post_id):
    """Shows post edit page or deletes"""
    if request.args["action"] == 'Cancel':
        post = Post.query.get(post_id)
        return redirect(f"/users/{post.user_id}")
    if request.args["action"] == 'Edit':
        post = Post.query.get(post_id)

        CheckedIds = db.session.query(PostTag.post_id, PostTag.tag_id).filter(
            PostTag.post_id == post_id).all()
        checked = []
        for post_id, tag_id in CheckedIds:
            checked.append(tag_id)

        tags = Tag.query.all()
        return render_template("edit_post.html", post=post, tags=tags, checked=checked)
    if request.args["action"] == 'Delete':
        return redirect(f"/posts/{post_id}/delete")


@app.route("/posts/<int:post_id>/edit", methods=["POST"])
def post_post_edit(post_id):
    """Shows edit page """
    if request.form["action"] == 'Edit':
        post = Post.query.filter_by(id=post_id).one()
        post.title = request.form["title"]
        post.content = request.form["content"]
        checkboxes = request.form.getlist("checkboxes")

        db.session.add(post)
        db.session.commit()

        tags = PostTag.query.filter_by(post_id=post_id).delete()
        db.session.commit()
        for tag_id in checkboxes:
            new_posttag = PostTag(post_id=post.id, tag_id=tag_id)
            db.session.add(new_posttag)
            db.session.commit()

        user = User.query.get_or_404(post.user_id)
        posts = Post.query.filter_by(user_id=post.user_id)
        return render_template("user_detail.html", user=user, posts=posts)

    if request.form["action"] == 'Cancel':
        return redirect(f"/posts/{post_id}")


@app.route("/posts/<int:post_id>/delete", methods=["POST"])
def post_delete(post_id):
    """Delete post_id"""
    PostTag.query.filter_by(post_id=post_id).delete()
    db.session.commit()

    post = Post.query.filter_by(id=post_id).one()
    Post.query.filter(Post.id == post_id).delete()
    db.session.commit()

    user = User.query.get_or_404(post.user_id)
    posts = Post.query.filter_by(user_id=post.user_id)
    return render_template("user_detail.html", user=user, posts=posts)


@app.route('/tags/new', methods=["GET"])
def create_tag_page():
    """Shows create tag page"""
    return render_template("create_tag.html")


@app.route("/tags/new", methods=["POST"])
def post_tag_page():
    """Posts tag and shows Tag List page"""
    if request.form["action"] == 'Add':
        name = request.form["name"]

        new_tag = Tag(name=name)
        db.session.add(new_tag)
        db.session.commit()

        tags = Tag.query.all()
        return render_template("list_tag.html", tags=tags)

    if request.form["action"] == 'Cancel':
        return redirect("/tags")


@app.route("/tags/<int:tag_id>", methods=["GET"])
def get_tag(tag_id):
    """Shows tag detail"""
    tag = Tag.query.get(tag_id)
    return render_template("show_tag.html", posts=tag.posts)


@ app.route("/tags/<int:tag_id>/edit", methods=["GET"])
def get_tag_edit(tag_id):
    """Shows tag page"""
    tag = Tag.query.filter_by(id=tag_id).one()
    return render_template("edit_tag.html", tag=tag)


@ app.route("/tags/<int:tag_id>/edit", methods=["POST"])
def post_tag_edit(tag_id):
    """Post edit tag"""
    if request.form["action"] == 'Edit':
        name = request.form["name"]

        tag = Tag.query.get(tag_id)
        tag.name = name

        db.session.add(tag)
        db.session.commit()

        tags = Tag.query.all()
        return redirect("/")

    return redirect(f"/tags/{tag_id}")


@app.route("/tags/<int:tag_id>/delete", methods=["POST"])
def tag_delete(tag_id):
    """Delete tag_id"""
    tag = Tag.query.filter(Tag.id == tag_id).first()
    db.session.delete(tag)
    db.session.commit()
    return redirect("/")
