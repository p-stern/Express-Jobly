from flask import Flask, request, render_template
from stories import Story

app = Flask(__name__)


@app.route('/home')
def show_choice():
    """Show form dropdown"""
    return render_template("choose.html")


@app.route('/form')
def show_form():
    """Show selected form"""
    form_num = request.args["form"][5:]
    return render_template(f"form-{form_num}.html")


@app.route('/story')
def show_story():
    """Show story"""
    param = int(request.args["param"])
    if param == 1:
        noun = request.args["noun"]
        verb = request.args["verb"]
        text = {"noun": noun, "verb": verb}
        story = Story(
            ["noun", "verb"],
            """I want to {verb} a {noun}."""
        )
    elif param == 2:
        place = request.args["place"]
        noun = request.args["noun"]
        verb = request.args["verb"]
        adjective = request.args["adjective"]
        plural_noun = request.args["plural_noun"]

        text = {"place": place, "noun": noun, "verb": verb,
                "adjective": adjective, "plural_noun": plural_noun}
        story = Story(
            ["place", "noun", "verb", "adjective", "plural_noun"],
            """Once upon a time in a long-ago {place}, there lived a
            large {adjective} {noun}. It loved to {verb} {plural_noun}."""
        )
    else:
        noun1 = request.args["noun1"]
        noun2 = request.args["noun2"]
        adverb = request.args["adverb"]
        adjective = request.args["adjective"]
        text = {"noun1": noun1, "noun2": noun2, "adverb": adverb,
                "adjective": adjective}
        story = Story(
            ["noun1", "noun1", "adverb", "adjective"],
            """The {adjective} {noun2} threw the {noun1} {adverb}."""
        )

    storytext = story.generate(text)

    return render_template("story.html", storytext=storytext)
