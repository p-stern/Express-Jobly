"""Model classes for cupcakess app."""

from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class Cupcake(db.Model):
    """Cupcake."""

    __tablename__ = "cupcakes"

    id = db.Column(
        db.Integer,
        primary_key=True,
        autoincrement=True,
    )

    flavor = db.Column(
        db.String(50),
        nullable=False,
        unique=True
    )
    
    size = db.Column(
        db.String(50),
        nullable=False
    )

    rating = db.Column(
        db.Float()
    )

    image = db.Column(
        db.String(150),
        nullable=False,
        default="https://tinyurl.com/demo-cupcake"
    )

    
def connect_db(app):
    """Connect to database."""

    db.app = app
    db.init_app(app)
