


#Administradores
User.find_or_create_by_email(
	username: "admin",
	name: "Administrador",
	email:"admin@admin.com",
	password:"Administrador0123456789!",
	password_confirmation: "Administrador0123456789!",
	admin: true,
	confirmed_at: Time.now
)
Question.find_or_create_by_text(text: "Cual es nombre de tu primera mascota?")
Question.find_or_create_by_text(text: "Cual es nombre de tu primera escuela?")
Question.find_or_create_by_text(text: "Cual es nombre de tu ultimo novio o novia ?")
Question.find_or_create_by_text(text: "Cual es nombre de la profesion de tu abuelo paterno?")
Question.find_or_create_by_text(text: "Cual es nombre de la profesion de tu abuela materna?")
