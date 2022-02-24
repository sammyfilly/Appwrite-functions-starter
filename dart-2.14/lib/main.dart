import 'package:dart_appwrite/dart_appwrite.dart';

/*
  'req' variable has:
    'headers' - object with request headers
    'payload' - object with request body data
    'env' - object with environment variables

  'res' variable has:
    'send(text, status)' - function to return text response. Status code defaults to 200
    'json(obj, status)' - function to return JSON response. Status code defaults to 200
  
  If an error is thrown, a response with code 500 will be returned.
*/

Future<void> start(final request, final response) async {
  Client client = Client();

  // You can remove services you don't use
  Account account = Account(client);
  Avatars avatars = Avatars(client);
  Database database = Database(client);
  Functions functions = Functions(client);
  Health health = Health(client);
  Locale locale = Locale(client);
  Storage storage = Storage(client);
  Teams teams = Teams(client);
  Users users = Users(client);

  if(
    request.env['APPWRITE_FUNCTION_ENDPOINT'] == null
      || request.env['APPWRITE_FUNCTION_API_KEY'] == null
      || request.env['APPWRITE_FUNCTION_API_KEY'] == null
  ) {
    print("Environment variables are not set. Function cannot use Appwrite SDK.");
  } else {
    client
      .setEndpoint(request.env['APPWRITE_FUNCTION_ENDPOINT'])
      .setProject(request.env['APPWRITE_FUNCTION_PROJECT_ID'])
      .setKey(request.env['APPWRITE_FUNCTION_API_KEY'])
      .setSelfSigned(status: true);
  }

  response.json({
    'areDevelopersAwesome': true,
  });
}