from unittest import TestCase
from app import app
from flask import session, request
from boggle import Boggle


class FlaskTests(TestCase):

    # TODO -- write tests for every view function / feature!
    def test_show_board(self):
        with app.test_client() as client:
            # can now make requests to flask via 'client' 
            res = client.get('/')
            html = res.get_data(as_text=True)
            
            self.assertEqual(res.status_code, 200)
            self.assertIn('<h1>Boggle</h1>', html)
    
    
    def test_invalid_word(self):
        with app.test_client() as client:
            # can now make requests to flask via 'client' 
            with client.session_transaction() as session:
                session['board'] = [["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"]]
            res = client.get('/check-word?word=ape')
            html = res.get_data(as_text=True)
            
            self.assertEqual(res.json['result'], 'not-on-board')
            self.assertEqual(res.json['score'], 0)

    def test_valid_word(self):
        with app.test_client() as client:
            # can now make requests to flask via 'client' 
            with client.session_transaction() as session:
                session['board'] = [["D", "I", "B", "B", "C"], 
                                    ["A", "F", "F", "I", "C"], 
                                    ["A", "A", "H", "U", "C"], 
                                    ["A", "A", "L", "B", "C"], 
                                    ["A", "A", "T", "B", "C"]]
            res = client.get('/check-word?word=difficult')
            html = res.get_data(as_text=True)
            
            # print(res.json)
            # print(res.json['result'])
            # print('result')

            self.assertEqual(res.json['result'], 'ok')
            self.assertEqual(res.json['score'], 9)
            
    def test_not_a_word(self):
        with app.test_client() as client:
            # can now make requests to flask via 'client' 
            with client.session_transaction() as session:
                session['board'] = [["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"], 
                                    ["A", "A", "B", "B", "C"]]
            res = client.get('/check-word?word=qrqw')
            html = res.get_data(as_text=True)
            
            self.assertEqual(res.json['result'], 'not-word')
            self.assertEqual(res.json['score'], 0)