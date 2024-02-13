ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.6/linkup-0.2.6-aarch64-apple-darwin.tar.gz"
ARM_SHA = "bd917c833d5e6ba35b12b0181d9e1cc244175e579a8d24f62ba4bb6d68ece0f4"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.6/linkup-0.2.6-x86_64-apple-darwin.tar.gz"
X86_SHA = "8873cbf60c3d39d92c706c2325f1e1ffa0d6ad7b96b10c3d7ccc4fde47b882b4"

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
