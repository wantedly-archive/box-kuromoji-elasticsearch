require "spec_helper"

describe package("elasticsearch") do
  it { should be_installed }
end

describe command("/usr/share/elasticsearch/bin/elasticsearch -v") do
  its(:stdout) { should match(/1\.5\.2/) }
end

describe file("/usr/share/elasticsearch/plugins/analysis-kuromoji/elasticsearch-analysis-kuromoji-2.5.0.jar") do
  it { should exist }
end
