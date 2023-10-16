class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.10/linkup-0.1.10-aarch64-apple-darwin.tar.gz"
    sha256 "84bc54ae2388d094d61e23aba9754f089e80480817d193b1005ee4f067d3b910"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.10/linkup-0.1.10-x86_64-apple-darwin.tar.gz"
    sha256 "83eabaf102ce65487f90cd2741c6e14e0d1a834024ee566af800656a47c669c1"
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
