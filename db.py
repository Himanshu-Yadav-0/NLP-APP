import json

class Database:
    def insert(self, fullname,email,password):
        with open('users.json','r') as rf:
            users = json.load(rf)
            if email in users:
                return 0
            else:
                users[email]=[fullname,password]
        
        with open('users.json','w') as wf:
            json.dump(users,wf,indent=4)
            return 1
    
    def checkforlogin(self,email,password):
        with open('users.json','r') as rf:
            users = json.load(rf)
            if email in users:
                if password == users[email][1]:
                    return 1
            else:
                return 0