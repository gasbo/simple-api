import pymysql
from flask import current_app, g
import os 

def get_db():
    if not hasattr(g, 'db'):
        g.db = pymysql.connect(host=os.environ.get('DATABASE_HOST'),
                               user=current_app.config['DATABASE_USER'],
                               password=current_app.config['DATABASE_PASSWORD'],
                               db=current_app.config['DATABASE_SCHEMA'],
                               port=current_app.config['DATABASE_PORT'],
                               autocommit=True,
                               cursorclass=pymysql.cursors.DictCursor)
    return g.db

def get_db_cursor():
    return get_db().cursor()

def close_db():
    if hasattr(g, 'db'):
        g.db.close()
        delattr(g, 'db')

