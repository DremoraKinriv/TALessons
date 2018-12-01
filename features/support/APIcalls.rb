
module APICalls
  def api_headers
    {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => '4ea3eced9e8f6a07e1fe92aaa159f5788a95f86e'}
  end

  def create_user_via_api

    payload = {
      'user' => {
        'login' => login,
        'firstname' => 'First',
        'lastname'=> 'Last',
        'mail' => login.to_s + '@gmail.com',
        'password' => password
      }
    }.to_json

    RestClient.post("#{$site_url}/users.json", payload, api_headers)
  end

  def delete_user_via_api

    user_credentials = RestClient.get("#{$site_url}/users.json?name=#{login}", api_headers)
    user_id = JSON.parse(user_credentials)['users'][0]['id']
    RestClient.delete("#{$site_url}/users/#{user_id}.json", api_headers)

  end

end

World APICalls