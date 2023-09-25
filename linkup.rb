class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.6/linkup-0.1.6-aarch64-apple-darwin.tar.gz"
    sha256 "d4a75f896c6b394911ba46b16aabad301eefd9ebdcd541b22b6479711e227434"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.6/linkup-0.1.6-x86_64-apple-darwin.tar.gz"
    sha256 "948cfd65531e9fd4cfd7def1cb9ffe6eb580562166695025f11d4e82e7994684"
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
