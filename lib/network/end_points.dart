abstract class EndPoints{

  //Auth
  static const String login = "/auth/login";                    //Post
  static const String register = "auth/register";               //Post
  static const String reset_password = "auth/reset-password";   //Patch

  //Favourite
  static const String post_favourite = "favorites/add";          //Post
  static const String get_favourite = "favorites/all";           //Get
  static const String delete_movie = "favorites/remove/movieId"; //Delete
  static const String get_movie_favourite = "favorites/is-favorite/movieId";//Get

  //Profile
  static const String update_profile = "profile";              //Patch
  static const String get_profile = "profile";                 //Get
  static const String delete_profile = "profile";              //Delete

}