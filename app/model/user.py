from database import get_db_cursor

def get_user_balance(user_id):
    key = 'amount'
    query="SELECT IFNULL(SUM(amount),0) as %(key)s FROM ( " \
            "SELECT -SUM(amount) as amount FROM transfer WHERE fromUserId = %(user_id)s AND status = 'ACCEPTED' " \
            "UNION ALL " \
            "SELECT +SUM(amount) as amount FROM transfer WHERE toUserId = %(user_id)s AND status = 'ACCEPTED' " \
            "UNION ALL " \
            "SELECT -SUM(amount) as amount FROM withdraw WHERE userId = %(user_id)s AND status = 'ACCEPTED' " \
            "UNION ALL " \
            "SELECT +SUM(amount) as amount FROM deposit WHERE userId = %(user_id)s AND status = 'ACCEPTED' " \
            ") as detail;"

    if is_user_valid(user_id):

        db_cur = get_db_cursor()
        db_cur.execute(query, {'user_id':user_id, 'key':key})
        res = db_cur.fetchone()
        db_cur.close()

        return res[key]

    else:
        return None

def get_user(id):
    query = "SELECT * FROM user where id = %(id)s;"
    db_cur = get_db_cursor()
    db_cur.execute(query, {'id': id})
    res = db_cur.fetchone()
    db_cur.close()
    return res

def is_user_valid(id):
    user = get_user(id)
    if user == None or user['status'] != 'ACTIVE':
        return False
    else:
        return True
