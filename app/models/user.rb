class User < Sequel::Model
  plugin :association_dependencies
  plugin :secure_password, include_validations: false

  NAME_FORMAT = %r{\A\w+\z}.freeze

  one_to_many :sessions, class: :UserSession
  add_association_dependencies sessions: :delete

  def validate
    super
    validates_presence :name
    validates_presence :email
    validates_unique :email
    validates_presence :password if new?
    validates_format NAME_FORMAT, :name, message: 'Укажите имя, используя буквы, цифры или символ подчёркивания'
  end
end