class Pipgrip < Formula
  include Language::Python::Virtualenv

  desc "Lightweight pip dependency resolver"
  homepage "https://github.com/ddelange/pipgrip"
  url "https://files.pythonhosted.org/packages/8a/fd/308a624ebeba713523b52402e492238cfb09200b1818b06be18a16cdbd77/pipgrip-0.6.0.tar.gz"
  sha256 "f7d31f63708a9f6403d315324c43b80904e864028578d34e2b6351907212266e"
  license "BSD-3-Clause"

  bottle do
    cellar :any_skip_relocation
    sha256 "0a5dbaff192f2dab80d62b99510df7f67156a72fa6ab2097fa904410c53f9566" => :catalina
    sha256 "34eda1c5b41ae45fd81e8b86ac551eb4a0e465cd05b370885e0bdba1b2371a04" => :mojave
    sha256 "945c6ae070f7781192d00b5cedb84b2e36b1f7fd85e9074278fd80936bc565bf" => :high_sierra
    sha256 "b5b021846b4c5ae21691d36747e2a5b087bca6e60b394160f5d667421977a4d1" => :x86_64_linux
  end

  depends_on "gcc"
  depends_on "python@3.8"

  resource "anytree" do
    url "https://files.pythonhosted.org/packages/d8/45/de59861abc8cb66e9e95c02b214be4d52900aa92ce34241a957dcf1d569d/anytree-2.8.0.tar.gz"
    sha256 "3f0f93f355a91bc3e6245319bf4c1d50e3416cc7a35cc1133c1ff38306bbccab"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "packaging" do
    url "https://files.pythonhosted.org/packages/55/fd/fc1aca9cf51ed2f2c11748fa797370027babd82f87829c7a8e6dbe720145/packaging-20.4.tar.gz"
    sha256 "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
  end

  resource "pkginfo" do
    url "https://files.pythonhosted.org/packages/6c/04/fd6683d24581894be8b25bc8c68ac7a0a73bf0c4d74b888ac5fe9a28e77f/pkginfo-1.5.0.1.tar.gz"
    sha256 "7424f2c8511c186cd5424bbf31045b77435b37a8d604990b79d4e70d741148bb"
  end

  resource "pyparsing" do
    url "https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210/pyparsing-2.4.7.tar.gz"
    sha256 "c203ec8783bf771a155b207279b9bccb8dea02d8f0c9e5f8ead507bc3246ecc1"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/6b/34/415834bfdafca3c5f451532e8a8d9ba89a21c9743a0c59fbd0205c7f9426/six-1.15.0.tar.gz"
    sha256 "30639c035cdb23534cd4aa2dd52c3bf48f06e5f4a941509c8bafd8ce11080259"
  end

  def install
    venv = virtualenv_create(libexec, Formula["python@3.8"].opt_bin/"python3")
    venv.pip_install resources
    venv.pip_install buildpath

    gcc_path = Formula["gcc"].opt_bin
    gcc_version = Formula["gcc"].version.to_s.split(".").first
    (bin/"pipgrip").write_env_script(libexec/"bin/pipgrip",
                                     { CC: gcc_path/"gcc-#{gcc_version}", CXX: gcc_path/"g++-#{gcc_version}" })
  end

  test do
    assert_match "pipgrip==#{version}", shell_output("#{bin}/pipgrip pipgrip --no-cache-dir")
    # Test gcc dependency
    assert_match "dxpy==", shell_output("#{bin}/pipgrip dxpy --no-cache-dir")
  end
end
