"""Models for Blogly."""
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def connect_db(app):
    db.app = app
    db.init_app(app)


class User(db.Model):
    __tablename__ = 'User'

    # @classmethod
    # def get_by_species(cls, species):
    #     return cls.query.filter_by(species=species).all()

    # @classmethod
    # def get_all_hungry(cls):
    #     return cls.query.filter(Pet.hunger > 20).all()

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

    @property
    def full_name(self):
        """return full name"""
        return f"{self.first_name} {self.last_name}"

    def greet(self):
        return f"I am {self.first_name} {self.last_name} url{self.image_url}"
