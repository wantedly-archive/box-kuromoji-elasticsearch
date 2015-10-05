require "spec_helper"

describe server(:target) do
  let(:elasticsearch_version) { "1.5.1" }

  describe http('http://target:9200') do
    it "responds OK 200" do
      expect(response.status).to eq 200
    end

    it "responds content including Elasticsearch version" do
      expect(JSON.parse(response.body)["version"]["number"]).to eq elasticsearch_version
    end
  end
end
