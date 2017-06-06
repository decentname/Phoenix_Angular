defmodule PhoenixAngular.UserController do
  use PhoenixAngular.Web, :controller
  alias PhoenixAngular.User

  def index(conn, _params) do
    case get_session(conn, :current_user) do
      nil ->
        redirect conn,to: PhoenixAngular.Router.Helpers.page_path(conn, :index)
      "1" ->
        render conn,"home.html"
    end
  end


  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_session(:current_user, "1")
        |> render("user.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: "error creating user"})
    end
  end

  def authenticate(conn, %{"email" => email, "password" => password}) do  

    query = from(u in User, where: u.email==^email, select: u)
    case Repo.one(query) do
      %User{}=user ->
        case user.password do
          password ->
          conn
          |> put_session(:current_user, "1")
          |>json(%{success: "Success"})
          nil ->
          conn
          |> put_status(:unauthorized)
          |>json(%{error: "wrong email or password"})     
        end
      nil ->
        conn
        |> put_status(:unauthorized)
        |>json(%{error: "wrong email or password"})     
    end    

  end

  def logout(conn,_params) do
    conn
    |>delete_session(:current_user)
    |>json(%{success: "success"})
  end
  
end
