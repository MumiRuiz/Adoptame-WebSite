class ActionMail < ActionMailer::Base
  default from: "from@example.com"

	def welcome_email(user)
	   @user = user
	   @url  = 'http://www.adoptame.co'
	   mail(to: @user.email, subject: 'Bienvenido a Adopta-Me')
	end

	def sendMail
        #Creamos el usuario     
        @user1 = User.create({ nombre: 'Ricardo Sampayo', email: 'me@ricardoSampayo.com',email_confirmation: 'me@ricardoSampayo.com"', identificador: "123456789", sexo: 'm', telefono: '123456789123' })
        
        # Llamamos al   ActionMailer que creamos
        ActionMail.welcome_email(@user1).deliver
        
        # mostramos el usuario en formato JSON
        render json: @user1
    end


end

