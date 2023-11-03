class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.13/linkup-0.1.13-aarch64-apple-darwin.tar.gz"
    sha256 "8fc791ae127f2bceb0f63de8da75ad468185808a76672b044d5c75d6d58d9cbe"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.13/linkup-0.1.13-x86_64-apple-darwin.tar.gz"
    sha256 "f570b129f6707a81335a6cfca98b6b37132d307ad7adb2eaef675c46c69e1e28"
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
