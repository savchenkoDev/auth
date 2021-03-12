require 'bcrypt'

class User < Sequel::Model
  include BCrypt

  NAME_FORMAT = %r{\A\w+\z}.freeze

  one_to_many :sessions, class: :UserSession
  
  def validate
    super
    validates_presence :name
    validates_presence :email
    validates_unique :email
    validates_presence :password
    validates_format NAME_FORMAT, :name, message: 'Укажите имя, используя буквы, цифры или символ подчёркивания'
  end

  def password
    BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

  def authenticate(password_param)
    self.password == password_param
  end
end