## Status

Tests Coverage - 0% (Do not use on production)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll-ftp-deployer'
```

And then execute:

    $ bundle


## Usage

* Create deploy_config.yml in your jekyll site with configuration:

```
    username: ftp-username
    server_url: ftp.server.xyz
    remote_dir: htdocs/my_blog
    need_backup: false # in progress
    backup_dir: htdocs/backups # in progress
```

* Add exclude configuration for your _config.yml file:


    $ exclude: [deploy_config.yml]
    
* Execute command in console for check right configuration for deploy:


    $ jfd check_configuration
    
* Deploy site to remote dir (Keep in mind now you can deploy only in empty folder):


    $ jfd deploy

Coming soon...


## TODO

* Add tests
* Add backup methods
* Add replacement methods

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Inspiration

This gem is created for improving professional skills and inspired by [jekyll-ftp](https://github.com/JesseHerrick/jekyll-ftp) gem

