class User
  attr_accessor :email, :age
  @@all_users = Array.new

  def initialize(email,age)
    @email = email
    @age = age
    @@all_users.push(self)
  end

  def self.all
    p @@all_users
  end

  def self.find_by_email(email)
    @@all_users.each do |user|
      if user.email == email
        return user
      else
        return  "Cet email n'est pas dans la base."
      end
    end
  end
end
