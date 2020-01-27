require "./config/environment"

use Rack::MethodOverride
use ProjectController
use UserController
use SessionController
run ApplicationController
