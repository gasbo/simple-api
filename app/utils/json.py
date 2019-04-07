from flask import jsonify
import decimal

def jsonify_decimal(dict):
    for key, o in dict.items():
        if isinstance(o, decimal.Decimal):
            dict[key] = float(o)
    return jsonify(dict)
