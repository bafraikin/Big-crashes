desc "This task is called by heroku for upload the last S3 file and put it in bd"
task :upload => :environment do
Aws.config.update({
   credentials: Aws::Credentials.new(Rails.application.credentials.aws[:access_key_id],  Rails.application.credentials.aws[:secret_access_key])
})


=begin
  Aws::S3::Base.establish_connection!(
    :access_key_id   => Rails.application.credentials.aws[:access_key_id],
    :secret_access_key => Rails.application.credentials.aws[:secret_access_key]
)
=end
  s3 = Aws::S3::Resource.new(region: 'eu-west-3')
  obj = s3.bucket('tryons').object('results.json')
  puts JSON.parse(obj.get.body.read)
end
