from flask import Flask, render_template, request
import mysql.connector
import re

app = Flask(__name__)
 
# MySQL configuration
db_config = {
    'host': 'tp4-sql',
    'user': 'root',
    'password': 'foo',
    'database': 'demosql',
	'port': '3306'
}
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor() 

def validate_username(username):
    patterns = [
        (r'.{6,}', "L'identifiant doit avoir au moins 6 caractères."),
        (r'.*\d.*', "L'identifiant doit contenir au moins un chiffre."),
        (r'.*[a-z].*', "L'identifiant doit contenir au moins une lettre minuscule."),
        (r'.*[A-Z].*', "L'identifiant doit contenir au moins une lettre majuscule."),
        (r'.*[%#{}@].*', "L'identifiant doit contenir au moins un des caractères suivants : #%{}@."),
    ]
    
    # Validation avec les regex
    for pattern, message in patterns:
        if re.fullmatch(pattern, username) is None:
            return False, message
    
    return True, "L'identifiant est valide."

@app.route('/newuser/', methods=['GET', 'POST'])
def new_user():
    error_message = None
    success_message = None
    
    if request.method == 'POST':
        username = request.form['username']
        is_valid, message = validate_username(username)
        
        if is_valid:
            success_message = message
        else:
            error_message = message
    
    return render_template('newuser.html', error_message=error_message, success_message=success_message)

@app.route('/')
def index():
    # Sample query
    query = "SELECT * FROM myTable"
    cursor.execute(query)
    data = cursor.fetchall()
    
    
    return render_template('index.html', data=data)

if __name__ == '__main__':
    app.run(debug=True)
    

