import requests
import unittest
import math

url = "http://localhost:8000/api/"


class APITest(unittest.TestCase):

    def test_get_balance(self):
        r = requests.get(url + "userbalance/1")
        self.assertEqual(r.status_code, 200)

    def test_get_transfer(self):
        r = requests.get(url + "transfer/1")
        self.assertEqual(r.status_code, 200)

    def test_post_transfer(self):
        r = requests.get(url + "userbalance/1")
        balance = r.json()['balance']

        if balance > 0.01:
            #Post a new transfer
            data = {"from_user_id":1,"to_user_id":2,"amount":0.01,"description":"Post Test"}
            r = requests.post(url + "transfer", data)
            self.assertEqual(r.status_code, 200)

            if r.status_code == 200:
	            # Lets check if we can retrieve the new transfer.
	            location = r.json()['location']
	            r2 = requests.get(location)
	            r2json = r2.json()
	            
	            self.assertEqual(r2.status_code, 200)
	            self.assertEqual(data['from_user_id'], r2json['fromUserId'])
	            self.assertEqual(data['to_user_id'], r2json['toUserId'])
	            self.assertEqual(data['amount'], r2json['amount'])
	            self.assertEqual(data['description'], r2json['description'])

	            r = requests.get(url + "userbalance/1")
	            self.assertEqual(r.json()['balance'], math.floor((100*balance-1))/100)









