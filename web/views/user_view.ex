defmodule PhoenixAngular.UserView do
	use PhoenixAngular.Web, :view


	def render("user.json", %{user: user}) do
	  %{
	    id: user.id,
	    first_name: user.first_name,
	    last_name: user.last_name,
	    inserted_at: user.inserted_at
	  }
	end

end