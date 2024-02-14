ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.7/linkup-0.2.7-aarch64-apple-darwin.tar.gz"
ARM_SHA = "0c60c4a2351559f1bb30c0a118428158d080e0cf4414ea1f70ba02bc718c7579"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.7/linkup-0.2.7-x86_64-apple-darwin.tar.gz"
X86_SHA = "fd3a8893374276027bd3e96309b751780db3d673c057b504e6c824c78d57b5a7"

class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url ARM_URL
    sha256 ARM_SHA
  elsif Hardware::CPU.intel?
    url X86_URL
    sha256 X86_SHA
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
