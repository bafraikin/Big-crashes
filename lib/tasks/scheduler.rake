desc "This task is called by heroku for upload the last S3 file and put it in bd"
task :upload => :environment do
  Aws.config.update({
    credentials: Aws::Credentials.new(Rails.application.credentials.aws[:access_key_id],  Rails.application.credentials.aws[:secret_access_key])
  })
  s3 = Aws::S3::Resource.new(region: 'eu-west-3')
  obj = s3.bucket('tryons').object('results.json')
  puts JSON.parse(obj.get.body.read)
end

desc "This task is going to take each type and add the crashes found with the api"
task :api_upload => :environment do
  any = Dataset.find_by(scraped: false)
  if any
    any.api_upload
  else
    another = Dataset.all.order(:"updated_at").first
    another.api_upload
  end
end

desc "This task add to crashes some define"
task :add_define => :environment do
  10.times do
  to_define = Crash.all.order(:updated_at).first
  to_define.define
  p to_define.body
  to_define.save
  end 
end




