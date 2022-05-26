"""User View tests."""

# run these tests like:
#
#    FLASK_ENV=production python -m unittest test_user_views.py


from app import app, CURR_USER_KEY
import os
from unittest import TestCase

from models import db, connect_db, Message, User, Follows, Likes

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


class UserViewTestCase(TestCase):
    """Test views for user."""

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

    def test_list_users(self):
        """Can users be listed?"""

        # Since we need to change the session to mimic logging in,
        # we need to use the changing-session trick:

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            resp = c.get("/users")

            # Make sure status code = 200
            self.assertEqual(resp.status_code, 200)

    def test_users_show(self):
        """Can user profile be shown?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            resp = c.get(f"/users/{self.testuser.id}")

            # Make sure status code = 200
            self.assertEqual(resp.status_code, 200)

    def test_show_following(self):
        """Can list the people this user is following?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            f = Follows(
                user_being_followed_id=u2.id,
                user_following_id=self.testuser.id
            )

            db.session.add(f)
            db.session.commit()

            resp = c.get(f"/users/{self.testuser.id}/following")

            # Make sure status code = 200
            self.assertEqual(resp.status_code, 200)

    def test_users_followers(self):
        """Can list the followers for this user?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            Follows(
                user_being_followed_id=self.testuser.id,
                user_following_id=u2.id
            )

            db.session.commit()

            resp = c.get(f"/users/{self.testuser.id}/followers")

            # Make sure status code = 200
            self.assertEqual(resp.status_code, 200)

    def test_add_follow(self):
        """Can a follow be added for this user?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            resp = c.post(f"/users/follow/{u2.id}")

            #  Make sure it redirects
            self.assertEqual(resp.status_code, 302)

    def test_stop_following(self):
        """Can a follow be deleted for this user?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            f = Follows(
                user_being_followed_id=u2.id,
                user_following_id=self.testuser.id
            )

            db.session.add(f)
            db.session.commit()

            resp = c.post(f"/users/stop-following/{u2.id}")

            #  Make sure it redirects
            self.assertEqual(resp.status_code, 302)

    def test_users_likes(self):
        """Can list the likes for this user?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            msg1 = Message(text="test msg1", user_id=u2.id)
            msg2 = Message(text="test msg2", user_id=u2.id)
            db.session.add(msg1)
            db.session.add(msg2)
            db.session.commit()

            l1 = Likes(
                user_id=self.testuser.id,
                message_id=msg1.id
            )
            l2 = Likes(
                user_id=self.testuser.id,
                message_id=msg2.id
            )

            db.session.add(l1)
            db.session.add(l2)
            db.session.commit()

            resp = c.get(f"/users/{self.testuser.id}/likes")

            # Make sure status code = 200
            self.assertEqual(resp.status_code, 200)

    def test_add_like(self):
        """Can a like be added for this user?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            msg1 = Message(text="test msg1", user_id=u2.id)
            db.session.add(msg1)
            db.session.commit()

            resp = c.post(f"/users/add_like/{msg1.id}")

            #  Make sure it redirects
            self.assertEqual(resp.status_code, 302)

    def test_delete_like(self):
        """Can a like be deleted for this user?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            msg1 = Message(text="test msg1", user_id=u2.id)
            db.session.add(msg1)
            db.session.commit()

            l = Likes(
                user_id=self.testuser.id,
                message_id=msg1.id
            )

            db.session.add(l)
            db.session.commit()

            resp = c.post(f"/users/add_like/{msg1.id}")

            #  Make sure it redirects
            self.assertEqual(resp.status_code, 302)

    def test_profile_get(self):
        """Can a user profile be retrieved?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            user = User.query.get(self.testuser.id)

            resp = c.get("/users/profile",
                         data={"id": self.testuser.id})

            # Make sure status code = 200
            self.assertEqual(resp.status_code, 200)

    def test_profile_update(self):
        """Can a user profile be updated?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            user = User.query.get(self.testuser.id)

            resp = c.post("/users/profile",
                          data={"id": self.testuser.id,
                                "email": self.testuser.email, "bio": "New bio"})

            #  Make sure it redirects
            self.assertEqual(resp.status_code, 302)

    def test_profile_delete(self):
        """Can a user profile be deleted?"""

        with self.client as c:
            with c.session_transaction() as sess:
                sess[CURR_USER_KEY] = self.testuser.id

            user = User.query.get(self.testuser.id)

            resp = c.post("/users/delete", follow_redirects=True)

            #  Make sure it redirects to the correct place
            self.assertEqual(resp.request.path, "/signup")


# ______________________________________

# When you’re logged in, can you see the follower / following pages for any user?
#     See test_show_following & test_users_followers above


    def test_show_following_no_auth(self):
        """When you’re logged out, are you disallowed from visiting a user’s following pages?"""

        with self.client as c:

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            Follows(
                user_being_followed_id=self.testuser.id,
                user_following_id=u2.id
            )

            db.session.commit()

            resp = c.get(
                f"/users/{self.testuser.id}/following", follow_redirects=True)

            #  Make sure it redirects to the correct place
            self.assertEqual(resp.request.path, "/")

    def test_users_followers_no_auth(self):
        """When you’re logged out, are you disallowed from visiting a user’s follower pages?"""

        with self.client as c:

            u2 = User(
                email="test2@test2.com",
                username="test2user",
                password="HASHED_PASSWORD2"
            )

            db.session.add(u2)
            db.session.commit()

            Follows(
                user_being_followed_id=self.testuser.id,
                user_following_id=u2.id
            )

            db.session.commit()

            resp = c.get(
                f"/users/{self.testuser.id}/followers", follow_redirects=True)

            #  Make sure it redirects to the correct place
            self.assertEqual(resp.request.path, "/")
