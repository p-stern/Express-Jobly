"""User model tests."""

# run these tests like:
#
#    python -m unittest test_user_model.py


from app import app
import os
from unittest import TestCase
from sqlalchemy.exc import IntegrityError
from psycopg2.errors import UniqueViolation

from models import db, User, Message, Follows

# BEFORE we import our app, let's set an environmental variable
# to use a different database for tests (we need to do this
# before we import our app, since that will have already
# connected to the database

os.environ['DATABASE_URL'] = "postgresql:///warbler-test"


# Now we can import app


# Create our tables (we do this here, so we only create the tables
# once for all tests --- in each test, we'll delete the data
# and create fresh new clean test data

db.create_all()


class UserModelTestCase(TestCase):
    """Test views for messages."""

    def setUp(self):
        """Create test client, add sample data."""

        User.query.delete()
        Message.query.delete()
        Follows.query.delete()

        self.client = app.test_client()

    def tearDown(self):
        db.session.rollback()

    def test_user_model(self):
        """Does basic model work?"""

        u = User(
            email="test@test.com",
            username="testuser",
            password="HASHED_PASSWORD"
        )

        db.session.add(u)
        db.session.commit()

        # User should have no messages & no followers
        self.assertEqual(len(u.messages), 0)
        self.assertEqual(len(u.followers), 0)

    def test___repr__(self):
        """Does __repr__ work"""

        u = User(
            email="test@test.com",
            username="testuser",
            password="HASHED_PASSWORD"
        )

        db.session.add(u)
        db.session.commit()

        # User should have f string returned
        self.assertEqual(f"<User #{u.id}: testuser, test@test.com>", repr(u))

    def test_is_following_true(self):
        """Does is_following successfully detect when user1 is following user2?"""

        u1 = User(
            email="test@test.com",
            username="testuser",
            password="HASHED_PASSWORD"
        )

        u2 = User(
            email="test2@test2.com",
            username="test2user",
            password="HASHED_PASSWORD2"
        )

        f = Follows(
            user_being_followed_id=u1.id,
            user_following_id=u2.id
        )

        db.session.add(u1)
        db.session.add(u2)
        db.session.commit()

        f = Follows(
            user_being_followed_id=u1.id,
            user_following_id=u2.id
        )

        u1.following = [u2]
        db.session.add(u1)
        db.session.add(f)
        db.session.commit()

        # True should be returned
        self.assertTrue(User.is_following(u1, u2))

    def test_is_following_false(self):
        """Does is_following successfully detect when user1 is not following user2?"""

        u1 = User(
            email="test@test.com",
            username="testuser",
            password="HASHED_PASSWORD"
        )

        u2 = User(
            email="test2@test2.com",
            username="test2user",
            password="HASHED_PASSWORD2"
        )

        db.session.add(u1)
        db.session.add(u2)
        db.session.commit()

        # False should be returned
        self.assertFalse(User.is_following(u1, u2))

    def test_is_followed_true(self):
        """Does is_followed_by successfully detect when user1 is followed by user2?"""

        u1 = User(
            email="test@test.com",
            username="testuser",
            password="HASHED_PASSWORD"
        )

        u2 = User(
            email="test2@test2.com",
            username="test2user",
            password="HASHED_PASSWORD2"
        )

        f = Follows(
            user_being_followed_id=u2.id,
            user_following_id=u1.id
        )

        db.session.add(u1)
        db.session.add(u2)
        db.session.commit()

        f = Follows(
            user_being_followed_id=u2.id,
            user_following_id=u1.id
        )

        u1.followers = [u2]
        db.session.add(u1)
        db.session.add(f)
        db.session.commit()

        # True should be returned
        self.assertTrue(User.is_followed_by(u1, u2))

    def test_is_followed_false(self):
        """Does is_followed_by successfully detect when user1 is not followed by user2?"""

        u1 = User(
            email="test@test.com",
            username="testuser",
            password="HASHED_PASSWORD"
        )

        u2 = User(
            email="test2@test2.com",
            username="test2user",
            password="HASHED_PASSWORD2"
        )

        db.session.add(u1)
        db.session.add(u2)
        db.session.commit()

        # False should be returned
        self.assertFalse(User.is_followed_by(u1, u2))

    def test_signup_true(self):
        """Does User.create successfully create a new user given valid credentials?"""

        u1 = User.signup(email="test@test.com",
                         username="testuser",
                         password="HASHED_PASSWORD",
                         image_url="http://testimg.jpeg")

        db.session.commit()

        self.assertTrue(u1.id)

    def test_signup_false(self):
        """Does User.create fail to create a new user if any of the validations 
        (e.g. uniqueness, non-nullable fields) fail?"""

        u1 = User.signup(email="test@test.com",
                         username="testuser",
                         password="HASHED_PASSWORD",
                         image_url="http://testimg.jpeg")

        db.session.commit()

        u2 = User.signup(email="test@test.com",
                         username="testuser",
                         password="HASHED_PASSWORD",
                         image_url="http://testimg.jpeg")

        self.assertRaises(IntegrityError, db.session.commit)

    def test_authenticate_true(self):
        """Does User.authenticate successfully return a user when given a valid username and password?"""

        u1 = User.signup(email="test@test.com",
                         username="testuser",
                         password="HASHED_PASSWORD",
                         image_url="http://testimg.jpeg")

        db.session.commit()

        user_auth = User.authenticate(
            username="testuser", password="HASHED_PASSWORD")

        db.session.commit()

        self.assertTrue(user_auth.id)

    def test_authenticate_username_false(self):
        """Does User.authenticate fail to return a user when the username is invalid?"""

        u1 = User.signup(email="test@test.com",
                         username="testuser",
                         password="HASHED_PASSWORD",
                         image_url="http://testimg.jpeg")

        db.session.commit()

        user_auth = User.authenticate(
            username="testuse", password="HASHED_PASSWORD")

        db.session.commit()

        # False should be returned
        self.assertFalse(user_auth, False)

    def test_authenticate_password(self):
        """Does User.authenticate fail to return a user when the password is invalid?"""

        u1 = User.signup(email="test@test.com",
                         username="testuser",
                         password="HASHED_PASSWORD",
                         image_url="http://testimg.jpeg")

        db.session.commit()

        user_auth = User.authenticate(
            username="testuser", password="HASHEDPASSWORD")

        db.session.commit()

        # False should be returned
        self.assertFalse(user_auth, False)
