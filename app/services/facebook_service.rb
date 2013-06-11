class FacebookService
  def initialize(token)
    @token = token
  end

  def graph
    @graph ||= Koala::Facebook::API.new(@token)
  end

  def info
    graph.get_object('me')
  end

  def permissions
    graph.get_connections('me', 'permissions')
  end

  def has_permission?(permission)
    permissions.first[permission] == 1
  end

  def revoke_permissions
    graph.delete_object('me', 'permissions')
  end

  def add_post(post)
    graph.put_connections('me', "calmmountain:add", "post" => "#{post_url(post)}")
  end
end