dev = OpenStruct.new({
  :ssh_user    => "polarbla@polarblau.com",
  :local_root  => "./build/",
  :remote_root => "public_html/rubysauna",
  :public_url  => "http://rubysauna.org/"
})

desc "Deploy 'deploy' dir to #{dev.ssh_user}:#{dev.remote_root}"
task :deploy do
  Dir.chdir(".") do
    puts "Building static files"
    system("bundle exec middleman build")
    puts
    puts "Deploying: #{Dir.pwd} -> #{dev.ssh_user}:#{dev.remote_root}"
    puts
    system("rsync -cvr --delete --exclude-from ./deploy_excludes.txt #{dev.local_root} #{dev.ssh_user}:#{dev.remote_root}")
    puts
    puts "Done."
  end
end
