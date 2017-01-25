module Jekyll_Ftp_Deployer
	class Errors
		def self.file_missing(filename)
			abort("ERROR:".red + " #{filename} does not exist.\n" + "Make sure you're in your site's root directory.".yellow)
		end

		def self.site_missing
			abort("ERROR:".red + " ERROR: _site directory does not exist.\n" + "Have you tried `jekyll build`?".yellow)
		end

		def self.config_error(missing)
			unless missing.empty?
				say "ERROR:".red + " Config file not set up properly."
				missing.each do |missed|
					say "  Missing:".yellow + " #{missed}"
				end
				abort
			end
		end
	end
end