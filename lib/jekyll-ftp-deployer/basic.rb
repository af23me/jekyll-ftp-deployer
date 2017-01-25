require 'net/ftp'
require 'yaml'

module Jekyll_Ftp_Deployer
  class Basic

    attr_reader :server, :username, :remote_dir, :need_backup, :backup_dir, :options

    def initialize(options)
      @options = options
      set_variables
    end

    def check_connection(close_connection = true)
      connect_ftp
      Jekyll_Ftp_Deployer::Connection.new(ftp, remote_dir).check_connection
      close_ftp if close_connection == true
    end

    def deploy
      check_connection(false)
      Jekyll_Ftp_Deployer::Deploy.deploy(ftp, remote_dir)
      close_ftp
    end

    def ftp
      @ftp ||= Net::FTP.new(server)
    end

    def connect_ftp
      say 'Connecting...'.yellow
      ftp.login(username, password)
      say 'Logged in.'.green
    end

    def close_ftp
      ftp.closed? ? nil : ftp.close
      say 'FTP connection closed.'.blue
    end

    def set_variables
      get_config_variables
      check_variables
    end

    def get_config_variables
      config = YAML.load_file('deploy_config.yml')

      @server = options.server_url || config['server_url']
      @username = options.username || config['username']
      @remote_dir = config['remote_dir']
      @need_backup = config['need_backup']
      @backup_dir = config['backup_dir']
    end

    def check_variables
      say 'Check config variables...'.yellow
      if server.nil? || username.nil? || remote_dir.nil? || (need_backup == true && backup_dir.nil?)
        # Array with errors
        missing_vars = Array.new

        missing_vars.push('server_url') if server.nil?
        missing_vars.push('username') if username.nil?
        missing_vars.push('remote_dir') if remote_dir.nil?

        # If backup is enabled but folder for backup is not provided
        missing_vars.push("backup_dir") if (need_backup == true && backup_dir.nil?)

        # Pass the missing array to 'config_error'.
        Jekyll_Ftp_Deployer::Errors.config_error(missing_vars)
      else
        say '      FTP Server: '.blue + server
        say '        Username: '.blue + username
        say 'Remote Directory: '.blue + remote_dir
        say 'Backup Directory: '.blue + backup_dir if need_backup?
      end
    end

    def send_files_folder
      need_backup? ? backup_dir : remote_dir
    end

    def need_backup?
      need_backup == true
    end

    def missing_config
      Jekyll_Ftp_Deployer::Error.file_missing('deploy_config.yml')
    end

    def missing_site
      Jekyll_Ftp_Deployer::Error.site_missing
    end

  end
end