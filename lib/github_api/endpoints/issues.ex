defmodule GithubApi.Issues do
  
  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end

  def all(user, project) do
    GithubApi.Base.process(issues_url(user, project))
  end
end
