from flask import Flask, request, render_template
from stories import Story

app = Flask(__name__)


@app.route('/home')
def show_form():
    """Show form"""
    return render_template("form.html")


@app.route('/story')
def show_story():
    """Show story"""

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
    storytext = story.generate(text)

    return render_template("story.html", storytext=storytext)
