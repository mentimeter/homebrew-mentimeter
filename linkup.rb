require 'open-uri'
require 'json'

LATEST_RELEASE = JSON.parse(URI.open('https://api.github.com/repos/mentimeter/linkup/releases/latest').read)
ASSETS = LATEST_RELEASE['assets']

class Linkup < Formula
  desc 'Link up preview environments'
  homepage 'https://github.com/mentimeter/linkup'
  license 'Apache-2.0'
  version LATEST_RELEASE['tag_name']

  depends_on 'cloudflared'
  depends_on 'dnsmasq'

  if OS.mac?
    if Hardware::CPU.arm?
      mac_arm_asset = ASSETS.find { |asset| asset['name'].match(/darwin-aarch64\.tar\.gz$/) }
      sha_asset = ASSETS.find { |asset| asset['name'].match(/darwin-aarch64\.tar\.gz\.sha256$/) }

      url mac_arm_asset['browser_download_url']
      sha256 URI.open(sha_asset['browser_download_url']).read.split.first
    elsif Hardware::CPU.intel?
      mac_x86_asset = ASSETS.find { |asset| asset['name'].match(/darwin-x86\.tar\.gz$/) }
      sha_asset = ASSETS.find { |asset| asset['name'].match(/darwin-x86\.tar\.gz\.sha256$/) }

      url mac_x86_asset['browser_download_url']
      sha256 URI.open(sha_asset['browser_download_url']).read.split.first
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      linux_arm_asset = ASSETS.find { |asset| asset['name'].match(/linux-aarch64\.tar\.gz$/) }
      sha_asset = ASSETS.find { |asset| asset['name'].match(/linux-aarch64\.tar\.gz\.sha256$/) }

      url linux_arm_asset['browser_download_url']
      sha256 URI.open(sha_asset['browser_download_url']).read.split.first
    elsif Hardware::CPU.intel?
      linux_x86_asset = ASSETS.find { |asset| asset['name'].match(/linux-x86\.tar\.gz$/) }
      sha_asset = ASSETS.find { |asset| asset['name'].match(/linux-x86\.tar\.gz\.sha256$/) }

      url linux_x86_asset['browser_download_url']
      sha256 URI.open(sha_asset['browser_download_url']).read.split.first
    end
  end

  livecheck do
    url :homepage
    regex(/^(\d+(?:\.\d+)+)$/i)
    strategy :github_latest do |json, regex|
      match = json['tag_name']&.match(regex)
      next if match.blank?

      match[1]
    end
  end

  def install
    bin.install 'linkup'
    bin.install 'linkup-caddy'

    return unless OS.mac?

    generate_completions_from_executable(bin / 'linkup', 'completion', shell_parameter_format: '--shell=',
                                                                       shells: %i[bash zsh])
  end
end
