from flask_restful import Resource, abort
from model.user import get_user_balance
from utils.json import jsonify_decimal

class Balance(Resource):
    def get(self, user_id):
        balance = get_user_balance(user_id)
        if balance == None:
            abort(404, message="User not found")
        return jsonify_decimal({'balance': balance})