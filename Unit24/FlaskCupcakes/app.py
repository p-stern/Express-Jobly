"""Flask app for cupcakes demo."""

from flask import Flask, request, jsonify, render_template
from models import db, connect_db, Cupcake

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///cupcakes'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

connect_db(app)


def serialize_cupcakes(cupcakes):
    """Serialize a cupcakes SQLAlchemy obj to dictionary."""

    return {
        "id":     cupcakes.id,   
        "flavor": cupcakes.flavor,
        "size":   cupcakes.size,
        "rating": cupcakes.rating,
        "image":  cupcakes.image
        }
    
         
@app.route("/")
def home_page():
    """rRender home page without sending cupcake info"""
    return render_template("home.html")


@app.route("/api/cupcakes")
def list_cupcakes():
    """Return JSON {cupcakes: [{id, flavor, size, rating, image}, ...]}"""
    
    cupcakes = Cupcake.query.all()
    serialized = [serialize_cupcakes(d) for d in cupcakes]

    return jsonify(cupcakes=serialized)
    

@app.route("/api/cupcakes/<int:cupcake_id>")
def get_cupcake(cupcake_id):
    """Return JSON {cupcake: {id, flavor, size, rating, image}}"""

    cupcake = Cupcake.query.get_or_404(cupcake_id)
    serialized = serialize_cupcakes(cupcake)
    if serialized:
        status = 200
    else:
        status = 404
    return (jsonify(cupcake=serialized), status)
    

@app.route("/api/cupcakes", methods=["POST"])
def create_cupcake():
    """Create cupcakes from form data & return it."""
    """Return JSON {cupcake: {id, flavor, size, rating, image}}"""
    
    flavor=request.json["flavor"]
    size=request.json["size"]
    rating=request.json["rating"]
    image=request.json["image"]

    cupcake = Cupcake(flavor=flavor, size=size, rating=rating, image=image)

    db.session.add(cupcake)
    db.session.commit()

    serialized = serialize_cupcakes(cupcake)

    # Return w/status code 201 --- return tuple (json, status)
    return ( jsonify(cupcake=serialized), 201 )
    

@app.route("/api/cupcakes/<int:cupcake_id>", methods=["PATCH"])
def update_cupcake(cupcake_id):
    """Update cupcake from form data & return it."""
    """Return JSON {cupcake: {id, flavor, size, rating, image}}"""
    
    cupcake = Cupcake.query.get(cupcake_id)
    cupcake.flavor=request.json["flavor"]
    cupcake.size=request.json["size"]
    cupcake.rating=request.json["rating"]
    cupcake.image=request.json["image"]

    db.session.commit()

    serialized = serialize_cupcakes(cupcake)
    return jsonify(cupcake=serialized)

@app.route("/api/cupcakes/<int:cupcake_id>", methods=["DELETE"])
def delete_cupcake(cupcake_id):
    """Update cupcake from form data & return it."""
    """Return JSON {cupcake: {id, flavor, size, rating, image}}"""
    
    cupcake = Cupcake.query.get(cupcake_id)
    db.session.delete(cupcake)
    db.session.commit()
    return ( jsonify(message="deleted"))
