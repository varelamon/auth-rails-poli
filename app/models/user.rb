class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable, :lockable

  validate :password_complexity
  validate :used_password
  validates :username, :name, :presence => true

  has_many :answers, :dependent => :destroy
  has_many :questions, through: :answers
  has_many :passwords, :dependent => :destroy

  accepts_nested_attributes_for :answers

  after_save :save_password


  def save_password
    Password.find_or_create_by_encrypted_password(user_id:self.id, encrypted_password: self.encrypted_password )
  end

  def password_complexity
  	if password.present? and not password.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[ ! @ # $ % ^ & * ( ) _ - + =])/)
  		errors.add :password, "debe incluir almenos una letra mayuscula, una miniscula, un numero y un caracter especial"
  	end
  end

  def used_password
    if has_repeated_password?
      errors.add :password, " ya ha sido usada anteriormente, ingrese una nueva"
    end
  end

   def has_repeated_password?
    histories = Password.where(user_id: self.id)
    histories.detect do |history|
      bcrypt   = ::BCrypt::Password.new(history.encrypted_password)
      password = ::BCrypt::Engine.hash_secret("#{self.password}#{self.class.pepper}", bcrypt.salt)
      password == history.encrypted_password
    end
  end


   def generate_random_password
    random_password = Devise.friendly_token.first(8)
    self.password = random_password
    self.save
    random_password
  end


  def send_reset_password
    self.send_reset_password_instructions
  end

  def admin?
  	self.admin
  end
end
