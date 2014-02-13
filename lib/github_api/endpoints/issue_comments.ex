defmodule GithubApi.IssueComments do

  def issue_comments_url(user, project, number) do
    "https://api.github.com/repos/#{user}/#{project}/issues/#{number}/comments"
  end
  
  def all(user, project, number) do
    GithubApi.Base.process(issue_comments_url(user, project, number))
  end
end
