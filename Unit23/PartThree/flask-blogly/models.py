"""Models for Blogly."""
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
from sqlalchemy import PrimaryKeyConstraint


db = SQLAlchemy()


def connect_db(app):
    db.app = app
    db.init_app(app)


class User(db.Model):
    __tablename__ = 'User'

    def __repr__(self):
        p = self
        return f"<ID={p.id} first name={p.first_name} last name={p.last_name} img url={p.image_url}>"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)

    first_name = db.Column(db.String(20),
                           nullable=False)

    last_name = db.Column(db.String(20),
                          nullable=False)

    image_url = db.Column(db.String(140), nullable=True, default="")

    post = db.relationship('Post', cascade="all, delete", backref="User")

    @property
    def full_name(self):
        """return full name"""
        return f"{self.first_name} {self.last_name}"

    def greet(self):
        return f"I am {self.first_name} {self.last_name} url{self.image_url}"


class Post(db.Model):
    __tablename__ = 'Post'

    def __repr__(self):
        p = self
        return f"<ID={p.id} title={p.title} content={p.content} created_at={p.created_at} user_id={p.user_id} user={p.user}>"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)

    title = db.Column(db.String(30),
                      nullable=False)

    content = db.Column(db.String(100),
                        nullable=False)

    created_at = db.Column(db.DateTime, nullable=False,
                           default=datetime.utcnow)

    user_id = db.Column(db.Integer,
                        db.ForeignKey('User.id'))

    user = db.relationship('User', backref="Post")
    tags = db.relationship('PostTag', cascade="all, delete", backref="post")


class Tag(db.Model):
    __tablename__ = 'Tag'

    def __repr__(self):
        p = self
        return f"<ID={p.id} name={p.name}>"

    id = db.Column(db.Integer,
                   primary_key=True,
                   autoincrement=True)

    name = db.Column(db.String(30),
                     nullable=False,
                     unique=True)
    posts = db.relationship('PostTag', cascade="all, delete", backref="tag")


class PostTag(db.Model):
    __tablename__ = 'PostTag'

    def __repr__(self):
        p = self
        return f"<post_ID={p.post_id} tag_ID={p.tag_id}>"

    post_id = db.Column(db.Integer,
                        db.ForeignKey('Post.id'),
                        primary_key=True,
                        nullable=False)

    tag_id = db.Column(db.Integer,
                       db.ForeignKey('Tag.id'),
                       primary_key=True,
                       nullable=False)
