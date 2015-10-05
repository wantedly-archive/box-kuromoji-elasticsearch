require 'serverspec'
require 'pathname'
require 'net/ssh'

include SpecInfra::Helper::Ssh
include SpecInfra::Helper::DetectOS

#
# Java is installed?
#
describe command("java -version") do
  it { should return_exit_status 0 }
end

#
# Elasticsearch Config File exists?
#
describe file("/usr/local/etc/elasticsearch/elasticsearch-env.sh") do
  it { should be_file }
end

describe file("/usr/local/etc/elasticsearch/elasticsearch.yml") do
  it { should be_file }
end

describe file("/usr/local/etc/elasticsearch/logging.yml") do
  it { should be_file }
end

#
# Elasticsearch Plugins is installed?
#
describe file("/usr/local/elasticsearch/plugins/analysis-kuromoji/") do
  it { should be_directory }
end

#
# Elasticsearch Server is running?
#
describe service("elasticsearch") do
  it { should be_running }
end

#
# Elasticsearch Server response?
#
describe command("curl http://localhost:9200") do
  it { should return_exit_status 0 }
end
