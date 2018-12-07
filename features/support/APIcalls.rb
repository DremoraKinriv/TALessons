module APICalls

  def api_headers
    {'Content-Type' => 'application/json', 'X-Redmine-API-Key' => '4ea3eced9e8f6a07e1fe92aaa159f5788a95f86e'}
  end

  def create_user_via_api(role='admin', create_login=login, create_pass=password)
    payload = {
      'user' => {
        'login' => create_login,
        'firstname' => create_login,
        'lastname'=> 'Last',
        'mail' => create_login.to_s + '@gmail.com',
        'password' => create_pass
      }
    }.to_json
    RestClient.post("#{$site_url}/users.json", payload, api_headers)

    # Pass data to user_cred
    user_cred(role, create_login, create_pass)
  end

  def delete_user_via_api(identificator=@admin_user)
    user_credentials = RestClient.get("#{$site_url}/users.json?name=#{identificator}", api_headers)
    user_id = JSON.parse(user_credentials)['users'][0]['id']

    RestClient.delete("#{$site_url}/users/#{user_id}.json", api_headers)
  end

  def create_project_via_api(identificator=@project_id)
    projects_cred = {
        'project'=> {
            'name' => identificator.to_s,
            'identifier' => "#{identificator}"
        }
    }.to_json
    RestClient.post("#{$site_url}/projects.json", projects_cred, api_headers)
  end

  def showing_a_project_via_api(identificator=@project_id)
    RestClient.get("#{$site_url}/projects/#{identificator}.json", api_headers)
  end

  def deleting_project_via_api(identificator=@project_id)
    RestClient.delete("#{$site_url}/projects/#{identificator}.json", api_headers)
  end
end

World APICalls