Role.create!(id: 1, name: 'admin')if Rails.env.development?
Role.create!(id: 2, name: 'customer')if Rails.env.development?
Role.create!(id: 3, name: 'employee')if Rails.env.development?

# Generate employee user and account
u = User.create!(username: 'Nicolasgenest', email: 'nicolas.genest@codeboxx.biz', company: 'Codeboxx1', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
e = Employee.create!(name: 'Genest', firstName: 'Nicolas', title: 'Comm Rep', email: 'nicolas.genest@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Nadyafortier', email: 'nadya.fortier@codeboxx.biz', company: 'Codeboxx2', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
e = Employee.create!(name: 'Fortier', firstName: 'Nadya', title: 'Director', email: 'nadya.fortier@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Martinchantal', email: 'martin.chantal@codeboxx.biz', company: 'Codeboxx3', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
e = Employee.create!(name: 'Chantal', firstName: 'Martin', title: 'Director Assistant', email: 'martin.chantal@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Mathieuhoude', email: 'mathieu.houde@codeboxx.biz', company: 'Codeboxx4', password: 'password', password_confirmation: 'password', role_id: 1) if Rails.env.development?
e = Employee.create!(name: 'Houde', firstName: 'Mathieu', title: 'Captain', email: 'mathieu.houde@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Remigagnon', email: 'remi.gagnon@codeboxx.biz', company: 'Codeboxx5', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
e = Employee.create!(name: 'Gagnon', firstName: 'Remi', title: 'Engineer', email: 'remi.gagnon@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Mathieulefrancois', email: 'mathieu.lefrancois@codeboxx.biz', company: 'Codeboxx6', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
e = Employee.create!(name: 'Lefrancois', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lefrancois@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Sergesavoie', email: 'serge.savoie@codeboxx.biz', company: 'Codeboxx7', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
e = Employee.create!(name: 'Savoie', firstName: 'Serge', title: 'Engineer', email: 'serge.savoie@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Davidboutin', email: 'david.boutin@codeboxx.biz', company: 'Codeboxx8', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
e = Employee.create!(name: 'Boutin', firstName: 'David', title: 'Engineer', email: 'david.boutin@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Mathieulortie', email: 'mathieu.lortie@codeboxx.biz', company: 'Codeboxx9', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
e = Employee.create!(name: 'Lortie', firstName: 'Mathieu', title: 'Engineer', email: 'mathieu.lortie@codeboxx.biz', user: u) if Rails.env.development?
u = User.create!(username: 'Thomascarrier', email: 'thomas.carrier@codeboxx.biz', company: 'Codeboxx10', password: 'password', password_confirmation: 'password', role_id: 3) if Rails.env.development?
e = Employee.create!(name: 'Carrier', firstName: 'Thomas', title: 'Engineer', email: 'thomas.carrier@codeboxx.biz', user: u) if Rails.env.development?