ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-aarch64-apple-darwin.tar.gz"
ARM_SHA = "64e55075dd18be59daa969b2258e0c1fae61f7c42e65a9897fc726a57cdfdd92"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-x86_64-apple-darwin.tar.gz"
X86_SHA = "9db8cbd21039040c47841dd3aa2b21d03a489728edb480741d4341cedf17442b"

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
