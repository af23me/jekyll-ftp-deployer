module Jekyll_Ftp_Deployer
  class Connection

    attr_reader :ftp, :remote_dir

    def initialize(ftp, remote_dir)
      @ftp = ftp
      @remote_dir = remote_dir
    end

    def check_connection
      check_local_settings
      check_server_settings
    end

    private

    def check_local_settings
      say 'Check local settings...'.yellow
      missing_config unless File.exist?('deploy_config.yml')
      missing_site unless File.directory?('_site')
      say 'OK.'.green
    end

    def check_server_settings
      say 'Check server settings...'.yellow
      # open folder on remote dir
      ftp.chdir(remote_dir)
      say 'Remote folder OK.'.yellow
      ftp.sendcmd('CWD')
    end

  end
end