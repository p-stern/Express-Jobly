from flask import Flask
from unittest import TestCase
from app import app
from models import db, connect_db, User

app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///blogly_test'
app.config['SQLALCHEMY_ECHO'] = True


db.drop_all()
db.create_all()


class BloglyTests(TestCase):
    def setUp(self):
        """clean up any existing blogly"""

        User.query.delete()
        new_user = User(first_name="Pete", last_name="Stern",
                        image_url="https://www.nba.com/nets/sites/nets/files/peter-stern.jpg")
        db.session.add(new_user)
        db.session.commit()

    def tearDown(self):
        """clean up any fouled transaction"""
        db.drop_all()
        db.create_all()
        # db.session.rollback()

    def test_users(self):
        with app.test_client() as client:
            new_user = User.query.first()
            res = client.get('/users')
            html = res.get_data(as_text=True)
            self.assertEqual(new_user.id, 1)
            self.assertEqual(new_user.first_name, "Pete")

    def test_get_user_page(self):
        client = app.test_client()
        result = client.get('/users/new')
        self.assertEqual(result.status_code, 200)

    def test_create_user(self):
        client = app.test_client()
        response = client.post("/users/new", data={
            "first_name": "Pete",
            "last_name": "Stern",
            "image_url": "https://www.nba.com/nets/sites/nets/files/peter-stern.jpg",
        })
        self.assertEqual(response.status_code, 302)

    def test_show_user(self):
        client = app.test_client()
        result = client.get('/users/1')
        self.assertEqual(result.status_code, 200)
