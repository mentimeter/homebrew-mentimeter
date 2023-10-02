class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.7/linkup-0.1.7-aarch64-apple-darwin.tar.gz"
    sha256 "9405756eed9379d7f973da501dbbb42b0400362f0c9a6663f1df53eb4045ed28"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.7/linkup-0.1.7-x86_64-apple-darwin.tar.gz"
    sha256 "02f0c1aca9efccddc4a47e0a393f85cbbc6a49ced1bcf3299789784dde292ba7"
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
