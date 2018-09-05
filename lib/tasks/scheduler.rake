desc "This task is called by heroku for upload the last S3 file and put it in bd"
task :upload => :environment do
  s3 = Aws::S3::Resource.new(region: 'eu-west-3')
  obj = s3.bucket('tryons').object('results.json')
  puts JSON.parse(obj.get.body.read)
end

