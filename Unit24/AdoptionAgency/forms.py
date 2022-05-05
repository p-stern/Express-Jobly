from flask_wtf import FlaskForm
from wtforms import StringField, FloatField, BooleanField, IntegerField, RadioField, SelectField, widgets
from wtforms.validators import InputRequired, URL, Optional, NumberRange


class AddPet(FlaskForm):
    """Add Form"""
    name = StringField("Pet Name", validators=[
                       InputRequired(message="Can't be blank")])
    species = SelectField("Species", choices=[
                          ('dog', 'Dog'),  ('cat', 'Cat'),  ('por', 'Porcupine')])
    url = StringField("Photo URL", validators=[Optional(), URL()])
    age = IntegerField("Age", validators=[
                       Optional(), NumberRange(min=0, max=30)])
    notes = StringField("Notes")


class EditPet(FlaskForm):
    """Edit Form"""
    name = StringField("Pet Name", validators=[
                       InputRequired(message="Can't be blank")])
    species = SelectField("Species", choices=[
                          ('dog', 'Dog'),  ('cat', 'Cat'),  ('por', 'Porcupine')])

    photo_url = StringField("Photo URL", validators=[Optional(), URL()])
    age = IntegerField("Age", validators=[
                       Optional(), NumberRange(min=0, max=30)])
    notes = StringField("Notes")
    available = SelectField("Available", choices=[
                            (1, 'Yes'), (0, 'No')], coerce=int)
