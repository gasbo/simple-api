from flask import Flask
from flask_restful import Api
import database

from api.balance import Balance
from api.transfer import Transfer


app = Flask(__name__)
api = Api(app)
app.config.from_pyfile('config.cfg')

@app.teardown_appcontext
def close_database(error):
    database.close_db()

api.add_resource(Balance, '/api/userbalance/<int:user_id>')
api.add_resource(Transfer, '/api/transfer/<int:id>', '/api/transfer')

