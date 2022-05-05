from flask import Flask, request, render_template,  redirect, flash, session
from flask_debugtoolbar import DebugToolbarExtension
from models import db,  connect_db, Pet
from forms import AddPet, EditPet

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///pets_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True
app.config['SECRET_KEY'] = "chickenzarecool21837"
app.config['DEBUG_TB_INTERCEPT_REDIRECTS'] = False
debug = DebugToolbarExtension(app)

connect_db(app)
db.create_all()


@app.route('/')
def home_page():
    """Render home page"""
    pets = Pet.query.all()
    return render_template('home.html', pets=pets)


@app.route('/add', methods=["GET", "POST"])
def add_pet():
    """Renders add pet form (GET) or handles pet form add submission (POST)"""
    form = AddPet()
    if form.validate_on_submit():
        name = form.name.data
        species = form.species.data
        photo_url = form.url.data
        age = form.age.data
        notes = form.notes.data
        pet = Pet(name=name, species=species,
                  photo_url=photo_url, age=age, notes=notes)
        db.session.add(pet)
        db.session.commit()
        (f"Created new pet: Name is {name}, Species is ${species}")
        return redirect('/')
    else:
        return render_template("add_pet_form.html", form=form)


@app.route('/<int:id>', methods=["GET", "POST"])
def pet_edit(id):
    """Renders edit pet form (GET) or handles pet form edit submission (POST)"""
    pet = Pet.query.get_or_404(id)
    form = EditPet(obj=pet)
    print(form.data)
    if form.validate_on_submit():
        pet.name = form.name.data
        pet.species = form.species.data
        pet.photo_url = form.photo_url.data
        pet.age = form.age.data
        pet.notes = form.notes.data
        print("fffffffff", form.available.data)
        pet.available = form.available.data
        db.session.add(pet)
        db.session.commit()
        return redirect('/')
    else:
        return render_template("edit_pet_form.html", form=form, pet=pet)
