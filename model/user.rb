class User
  include MongoModule

  attr_accessor :_id, :name, :email, :picture, :username, :user_id

  def init_collection
    @collection = 'users'
  end


  def email=(an_email = nil)
      if an_email == nil
          @email.downcase
      else
          @email = an_email.downcase
      end
  end

  def random_string(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    str = ""
    1.upto(len) { |i| str << chars[rand(chars.size-1)] }
    return str
  end

  def self.new_from_id(user_id)
    u = USERS.find_one("user_id" => user_id.downcase)
    return nil if u.nil?
    return u
    nil
  end

end
