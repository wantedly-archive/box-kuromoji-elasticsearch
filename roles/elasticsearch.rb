name "elasticsearch"
run_list(
  "recipe[apt]",
  "recipe[build-essential]",
  "recipe[java]",
  "recipe[elasticsearch]",
  "recipe[elasticsearch::plugins]"
)
override_attributes({
  "apt" => {
    "mirror" => "us-east-1.ec2"
  },
  "elasticsearch" => {
    "version" => "1.0.1",
    "plugins" => {
      "elasticsearch/elasticsearch-analysis-kuromoji/2.0.0" => {}
    },
    "discovery" => {
      "zen" => {
        "ping" => {
          "multicast" => {
            "enabled" => false
          }
        }
      }
    }
  },
  "java" => {
    "install_flavor" => "openjdk",
    "jdk_version" => "7"
  }
})

