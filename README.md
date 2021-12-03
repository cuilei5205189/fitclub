# README
## How run
### option 1 with Docker
```
git pull https://github.com/cuilei5205189/fitclub
cd fitclub
docker-compose up
```

### option 2
```
git pull https://github.com/cuilei5205189/fitclub
cd fitclub
- install ruby 3.0.0
- install rails 7.0.0.alpha2 
- bunlde install && yarn install
./bin/dev # start css js building server
rails s # start server
```

### stack
- bootstrap and bootstrap-icons
- aws-s3
- heroku

* Ruby and Rails version
```
rails about
About your application's environment
Rails version             7.0.0.alpha2
Ruby version              ruby 3.0.0p0 (2020-12-25 revision 95aff21468) [arm64-darwin20]
RubyGems version          3.2.3
Rack version              2.2.3
Middleware                ActionDispatch::HostAuthorization, Rack::Sendfile, ActionDispatch::Static, ActionDispatch::Executor, ActiveSupport::Cache::Strategy::LocalCache::Middleware, Rack::Runtime, Rack::MethodOverride, ActionDispatch::RequestId, ActionDispatch::RemoteIp, Sprockets::Rails::QuietAssets, Rails::Rack::Logger, ActionDispatch::ShowExceptions, WebConsole::Middleware, ActionDispatch::DebugExceptions, ActionDispatch::ActionableExceptions, ActionDispatch::Reloader, ActionDispatch::Callbacks, ActiveRecord::Migration::CheckPending, ActionDispatch::Cookies, ActionDispatch::Session::CookieStore, ActionDispatch::Flash, ActionDispatch::ContentSecurityPolicy::Middleware, ActionDispatch::PermissionsPolicy::Middleware, Rack::Head, Rack::ConditionalGet, Rack::ETag, Rack::TempfileReaper
Environment               development
Database adapter          sqlite3
Database schema version   0
```
