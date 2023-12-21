ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.4/linkup-0.2.4-aarch64-apple-darwin.tar.gz"
ARM_SHA = "269c2aa34c746a47ee2e044a3109c6b9f32940e578e14648153b8e3a467ca76f"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.4/linkup-0.2.4-x86_64-apple-darwin.tar.gz"
X86_SHA = "19c7446830134800522a91ab177a68a34e6af7ec6ddb92d5cc4c8ec6c51bc6ce"

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
