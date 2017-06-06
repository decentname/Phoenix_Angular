defmodule PhoenixAngular.PageController do
  use PhoenixAngular.Web, :controller

  def index(conn, _params) do
  	case get_session(conn, :current_user) do
  		nil ->
  			render conn, "index.html"
  		"1" ->
  			redirect conn,to: PhoenixAngular.Router.Helpers.user_path(conn, :index)
  	end
  end
end
