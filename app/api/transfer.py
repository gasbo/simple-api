from flask_restful import Resource,request, reqparse, abort
from model.user import get_user_balance, is_user_valid
from model.transfer import insert_transfer, get_transfer
from utils.json import jsonify_decimal
import decimal

parser = reqparse.RequestParser()
parser.add_argument('from_user_id', type=int, required=True, help='User ids should be integers')
parser.add_argument('to_user_id', type=int, required=True, help='User ids should be integers')
parser.add_argument('amount', type=decimal.Decimal, required=True, help='Requested amount should be a number')
parser.add_argument('description')

class Transfer(Resource):

    def get(self, id):

        transfer = get_transfer(id)
        if transfer == None:
            abort(404, message="Transfer not found")
        return jsonify_decimal(transfer)

    def post(self):

        args = parser.parse_args()
        from_user_id = args['from_user_id']
        to_user_id   = args['to_user_id']
        amount       = args['amount']
        description  = args['description']

        if amount <= 0 or amount.as_tuple().exponent < -2:
            abort(400, message="Requested amount is not valid")

        if not is_user_valid(to_user_id):
            abort(400, message="to_user_id is not a valid id")

        balance = get_user_balance(from_user_id)

        if balance == None:
            abort(400, message="from_user_id is not a valid id")

        if balance <= amount:
            abort(400, message="Requested amount should not be bigger than the balance of the user")

        id = insert_transfer(from_user_id, to_user_id, amount, description)

        return jsonify_decimal({'location':request.base_url + '/' + str(id)})
