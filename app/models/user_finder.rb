class UserFinder

  def self.find(username, password)
    Rails.env == 'production' ? prod_find(username, password) : dev_find(username, password)
  end

  private

  def self.dev_find(username, password)
    username == password ? User.find_by_username(username) : nil
  end

  def self.prod_find(username, password)
    conf = Confluence::Client.new 'https://confluence.softserveinc.com'
    return nil unless conf.login username, password
    user = User.find_by_username(username) || create_user(conf.get_user(username))
  end

  def self.create_user(user_info)
    User.create({
      username: user_info['name'],
      fullname: user_info['fullname'],
      email:    user_info['email'],
      password: 'password'
    })
  end
end
