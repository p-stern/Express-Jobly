"""Message model tests."""

# run these tests like:
#
#    python -m unittest test_user_model.py


from psycopg2 import Timestamp
from app import app
import os
from unittest import TestCase
from sqlalchemy.exc import IntegrityError
from psycopg2.errors import UniqueViolation, ForeignKeyViolation
from datetime import datetime

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


class MessageModelTestCase(TestCase):
    """Test views for messages."""

    def setUp(self):
        """Create test client, add sample data."""

        User.query.delete()
        Message.query.delete()
        Follows.query.delete()

        self.client = app.test_client()

    def tearDown(self):
        db.session.rollback()

    def test_message_added(self):
        """Is a message added successfully when the user is on the User table?"""

        u = User(
            email="test@test.com",
            username="testuser",
            password="HASHED_PASSWORD"
        )

        db.session.add(u)
        db.session.commit()

        msg = Message(text="test message text")
        u.messages.append(msg)
        db.session.commit()

        # User should have no messages & no followers
        self.assertEqual(len(u.messages), 1)

    def test_message_not_added(self):
        """Is a message not added when the user is not on the User table?"""

        msg = Message(text="test message text",
                      timestamp=datetime.utcnow(),
                      user_id=1027)
        db.session.add(msg)

        self.assertRaises(IntegrityError, db.session.commit)
