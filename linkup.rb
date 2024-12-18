ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "dd17d2be2117b3f97168d5cddc2f0ec1c7d29840c668c993129f20847e0629af"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "b480ef8150a590b92dbc77f2c2886e99d547d20d99043dc2cd936d883f8644ba"

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
