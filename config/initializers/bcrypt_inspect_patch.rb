require "bcrypt"

BCrypt::Password.class_eval do
  undef_method :inspect rescue nil
  
  def inspect
    "#<BCrypt::Password ****>"
  end
end