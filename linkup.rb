class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.14/linkup-0.1.14-aarch64-apple-darwin.tar.gz"
    sha256 "384c1d461a34419456910cca2d1ef25ffe9288de583672c5a55fff48d80c009e"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.14/linkup-0.1.14-x86_64-apple-darwin.tar.gz"
    sha256 "32fa5e6b651a08425955094e4769fcf371f9218c51738656998935754a938d8c"
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
