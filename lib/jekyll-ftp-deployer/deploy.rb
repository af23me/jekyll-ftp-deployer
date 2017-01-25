module Jekyll_Ftp_Deployer
	class Deploy

		def self.deploy(ftp, folder)
			ftp.chdir(folder)

			Dir.chdir('_site')
			entries = Dir.glob('**/*').sort

			say 'Deploying...'.yellow

			entries.each do |name|
				if File::directory? name
					ftp.mkdir name
					say 'Create folder: '.green + name
				else
					File.open(name) { |file| ftp.putbinaryfile(file, name) }
					say 'Send file: '.green + name
				end
			end
			say 'Done.'.green
		end

	end
end