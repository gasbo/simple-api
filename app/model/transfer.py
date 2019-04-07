from database import get_db_cursor

def get_transfer(id):

    query = "SELECT * FROM transfer WHERE id = %(id)s;"

    db_cur = get_db_cursor()

    db_cur.execute(query, {'id':id})
    res = db_cur.fetchone()
    db_cur.close()

    return res;

def insert_transfer(from_user_id, to_user_id, amount, description):

    query = "INSERT INTO transfer (fromUserId, toUserId, amount, description, status) " \
            "VALUES (%(from_user_id)s, %(to_user_id)s, %(amount)s, %(description)s, 'ACCEPTED'); "

    db_cur = get_db_cursor()

    db_cur.execute(query, {'from_user_id':from_user_id, 'to_user_id':to_user_id, 'amount':amount, 'description':description})
    id = db_cur.lastrowid
    db_cur.close()

    return id


