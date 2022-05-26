"""Message View tests."""

# run these tests like:
#
#    FLASK_ENV=production python -m unittest test_message_views.py


from app import app, CURR_USER_KEY
import os
from unittest import TestCase
from sqlalchemy.orm.exc import DetachedInstanceError
from models import db, connect_db, Message, User

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

# Don't have WTForms use CSRF at all, since it's a pain to test

app.config['WTF_CSRF_ENABLED'] = False


class MessageViewTestCase(TestCase):
    """Test views for messages."""

    def setUp(self):
        """Create test client, add sample data."""

        User.query.delete()
        Message.query.delete()

        self.client = app.test_client()

        self.testuser = User.signup(username="testuser",
                                    email="test@test.com",
                                    password="testuser",
                                    image_url=None)

        db.session.commit()

    def tearDown(self):
        db.session.rollback()

    def test_messages_add(self):
        """Can you add a message?"""

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            # Now, that session setting is saved, so we can have
            # the rest of ours test

            resp = c.post("/messages/new", data={"text": "Hello"})

            # Make sure it redirects
            self.assertEqual(resp.status_code, 302)

            msg = Message.query.one()
            self.assertEqual(msg.text, "Hello")

    def test_messages_show(self):
        """Can you view a message?"""

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            # Now, that session setting is saved, so we can have
            # the rest of ours test

            msg = Message(text="test msg", user_id=self.testuser.id)
            db.session.add(msg)
            db.session.commit()

            resp = c.get(f"/messages/{msg.id}",
                         data={"id": msg.id})

            # Make sure status code = 200
            self.assertEqual(resp.status_code, 200)

            # Make sure message text is "test msg"
            msg = Message.query.one()
            self.assertEqual(msg.text, "test msg")

    def test_messages_delete(self):
        """Can you view a message?"""

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            # Now, that session setting is saved, so we can have
            # the rest of ours test

            msg = Message(text="test msg", user_id=self.testuser.id)
            db.session.add(msg)
            db.session.commit()

            c.post(f"/messages/{msg.id}/delete")
            db.session.commit()

            msg = Message.query.get(msg.id)

            self.assertIsNone(msg)

    # When you’re logged in, can you add a message as yourself?
    #    test_messages_add

    # When you’re logged in , can you delete a message as yourself?
        #    See test_messages_delete

    def test_messages_add_no_auth(self):
        """When you’re logged out, are you prohibited from adding messages?"""

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:

            # Now, that session setting is saved, so we can have
            # the rest of ours test

            resp = c.post("/messages/new",
                          data={"text": "Hello"}, follow_redirects=True)

            #  Make sure it redirects to the correct place
            self.assertEqual(resp.request.path, "/")

    def test_messages_delete_no_auth(self):
        """When you’re logged out, are you prohibited from deleting messages?"""

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:

            # Now, that session setting is saved, so we can have
            # the rest of ours test

            msg = Message(text="test msg", user_id=self.testuser.id)
            db.session.add(msg)
            db.session.commit()

            resp = c.post(f"/messages/{msg.id}/delete", follow_redirects=True)

            #  Make sure it redirects to the correct place
            self.assertEqual(resp.request.path, "/")

    def test_messages_add_another_user(self):
        """When you’re logged in, are you prohibiting from adding a message as another user?"""

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = 12345678

            # Now, that session setting is saved, so we can have
            # the rest of ours test

            resp = c.post("/messages/new",
                          data={"text": "Hello"}, follow_redirects=True)

            #  Make sure it redirects to the correct place
            self.assertEqual(resp.request.path, "/")

    def test_messages_delete_another_user(self):
        """When you’re logged in, are you prohibiting from deleting a message as another user?"""

        u2 = User(
            email="test2@test.com",
            username="testuser2",
            password="HASHED_PASSWORD"
        )

        msg = Message(id=1234567, text="test msg", user_id=self.testuser.id)

        db.session.add(u2)
        db.session.add(msg)
        db.session.commit()

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = u2.id

            # Now, that session setting is saved, so we can have
            # the rest of ours test

            resp = c.post("/messages/1234567/delete", follow_redirects=True)

            #  Make sure it redirects to the correct place
            self.assertEqual(resp.request.path, "/")
