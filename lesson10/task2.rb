class WrongLoginException < Exception
  def initialize(msg = "Wrong login")
    super(msg)
  end
end

class WrongPasswordException < Exception
  def initialize(msg = "Wrong password")
    super(msg)
  end
end

def verify_login_and_password(login, password, confirm_password)
  begin
    if login.length >= 20 || !login.match(/^[a-zA-Z0-9_]+$/)
      raise WrongLoginException.new("Login should contain only latin letters, numbers and underscores and be less than 20 characters")
    end

    if password.length >= 20 || !password.match(/^[a-zA-Z0-9_]+$/)
      raise WrongPasswordException.new("Password should contain only latin letters, numbers and underscores and be less than 20 characters")
    end

    if password != confirm_password
      raise WrongPasswordException.new("Password and confirm password do not match")
    end
  rescue Exception => e
    puts "Exception: #{e.message}"
    return false
  end

  return true
end

# Testing
puts verify_login_and_password("my_username_123", "my_password_123", "my_password_123") # true
puts verify_login_and_password("my_username_123", "my_password_123", "my_password_123_wrong") # false
puts verify_login_and_password("my_username_123_over_the_character_limit", "my_password_123", "my_password_123") # false
puts verify_login_and_password("my_username#123", "my_password_123", "my_password_123") # false