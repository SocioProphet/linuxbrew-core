class Howdoi < Formula
  include Language::Python::Virtualenv

  desc "Instant coding answers via the command-line"
  homepage "https://github.com/gleitz/howdoi"
  url "https://files.pythonhosted.org/packages/bc/6c/bae579224a13944a45c4785b195cae233b7bc4728fc898c0bec9c9885393/howdoi-2.0.3.tar.gz"
  sha256 "ed8acb75779f598a831224f33fa991c51764872574a128e9b2f11b83fcace010"
  license "MIT"

  bottle do
    cellar :any_skip_relocation
    sha256 "61818b40a2e2fb4d987af957cde968ad2604e2a3ffcf315e9fa667ebcdf2ffa7" => :catalina
    sha256 "aeed5b101167c4c04fa532c0a4812f8ff92c1827030ebf1573ca7882ca23832f" => :mojave
    sha256 "6c43a09b187c622923f7e97a6eab9005bf5434a2e7300a6158301b23ec2c0194" => :high_sierra
    sha256 "a62e01d2925ebf935c818a23a82b91c281f1900737fd1bcd2d592bf984e9f307" => :x86_64_linux
  end

  depends_on "python@3.8"

  uses_from_macos "libxml2"
  uses_from_macos "libxslt"

  resource "appdirs" do
    url "https://files.pythonhosted.org/packages/d7/d8/05696357e0311f5b5c316d7b95f46c669dd9c15aaeecbb48c7d0aeb88c40/appdirs-1.4.4.tar.gz"
    sha256 "7d5d0167b2b1ba821647616af46a749d1c653740dd0d2415100fe26e27afdf41"
  end

  resource "cachelib" do
    url "https://files.pythonhosted.org/packages/0a/ce/50a08e17ae057b4afc3ef997a9846a9c335490e8137129d1d9213b7c5fe0/cachelib-0.1.1.tar.gz"
    sha256 "47e95a67d68c729cbad63285a790a06f0e0d27d71624c6e44c1ec3456bb4476f"
  end

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/40/a7/ded59fa294b85ca206082306bba75469a38ea1c7d44ea7e1d64f5443d67a/certifi-2020.6.20.tar.gz"
    sha256 "5930595817496dd21bb8dc35dad090f1c2cd0adfaf21204bf6732ca5d8ee34d3"
  end

  resource "chardet" do
    url "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"
    sha256 "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"
  end

  resource "click" do
    url "https://files.pythonhosted.org/packages/27/6f/be940c8b1f1d69daceeb0032fee6c34d7bd70e3e649ccac0951500b4720e/click-7.1.2.tar.gz"
    sha256 "d2b5255c7c6349bc1bd1e59e08cd12acbbd63ce649f2588755783aa94dfb6b1a"
  end

  resource "cssselect" do
    url "https://files.pythonhosted.org/packages/70/54/37630f6eb2c214cdee2ae56b7287394c8aa2f3bafb8b4eb8c3791aae7a14/cssselect-1.1.0.tar.gz"
    sha256 "f95f8dedd925fd8f54edb3d2dfb44c190d9d18512377d3c1e2388d16126879bc"
  end

  resource "Deprecated" do
    url "https://files.pythonhosted.org/packages/c1/2d/60b1be29720ea1a3d3146fac1a596875622ae8dcb40cf926cc4759dadfd6/Deprecated-1.2.10.tar.gz"
    sha256 "525ba66fb5f90b07169fdd48b6373c18f1ee12728ca277ca44567a367d9d7f74"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/ea/b7/e0e3c1c467636186c39925827be42f16fee389dc404ac29e930e9136be70/idna-2.10.tar.gz"
    sha256 "b307872f855b18632ce0c21c5e45be78c0ea7ae4c15c828c20788b26921eb3f6"
  end

  resource "keep" do
    url "https://files.pythonhosted.org/packages/7e/7b/377b40cb0055bdf1313b743c365b81b9936ad87728a4c51782b4cf131388/keep-2.9.tar.gz"
    sha256 "02b31b65eb4922aa7561068c2fa9c207b9e593702d44056cc1c5d705379b0224"
  end

  resource "lxml" do
    url "https://files.pythonhosted.org/packages/2c/4d/3ec1ea8512a7fbf57f02dee3035e2cce2d63d0e9c0ab8e4e376e01452597/lxml-4.5.2.tar.gz"
    sha256 "cdc13a1682b2a6241080745b1953719e7fe0850b40a5c71ca574f090a1391df6"
  end

  resource "PyGithub" do
    url "https://files.pythonhosted.org/packages/90/9a/1cdf86346b3f18a064b783ccbef734ca3d82f47f3c3373f3c6f4ecd429eb/PyGithub-1.51.tar.gz"
    sha256 "d2d17d1e3f4474e070353f201164685a95b5a92f5ee0897442504e399c7bc249"
  end

  resource "Pygments" do
    url "https://files.pythonhosted.org/packages/6e/4d/4d2fe93a35dfba417311a4ff627489a947b01dc0cc377a3673c00cf7e4b2/Pygments-2.6.1.tar.gz"
    sha256 "647344a061c249a3b74e230c739f434d7ea4d8b1d5f3721bc0f3558049b38f44"
  end

  resource "PyJWT" do
    url "https://files.pythonhosted.org/packages/2f/38/ff37a24c0243c5f45f5798bd120c0f873eeed073994133c084e1cf13b95c/PyJWT-1.7.1.tar.gz"
    sha256 "8d59a976fb773f3e6a39c85636357c4f0e242707394cadadd9814f5cbaa20e96"
  end

  resource "pyquery" do
    url "https://files.pythonhosted.org/packages/6b/94/4663206f709ac32446e995227cc5be34d5e2aa74ba8f92b8083c2740d3d7/pyquery-1.4.1.tar.gz"
    sha256 "8fcf77c72e3d602ce10a0bd4e65f57f0945c18e15627e49130c27172d4939d98"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/da/67/672b422d9daf07365259958912ba533a0ecab839d4084c487a5fe9a5405f/requests-2.24.0.tar.gz"
    sha256 "b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b"
  end

  resource "terminaltables" do
    url "https://files.pythonhosted.org/packages/9b/c4/4a21174f32f8a7e1104798c445dacdc1d4df86f2f26722767034e4de4bff/terminaltables-3.1.0.tar.gz"
    sha256 "f3eb0eb92e3833972ac36796293ca0906e998dc3be91fbe1f8615b331b853b81"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/81/f4/87467aeb3afc4a6056e1fe86626d259ab97e1213b1dfec14c7cb5f538bf0/urllib3-1.25.10.tar.gz"
    sha256 "91056c15fa70756691db97756772bb1eb9678fa585d9184f24534b100dc60f4a"
  end

  resource "wrapt" do
    url "https://files.pythonhosted.org/packages/82/f7/e43cefbe88c5fd371f4cf0cf5eb3feccd07515af9fd6cf7dbf1d1793a797/wrapt-1.12.1.tar.gz"
    sha256 "b62ffa81fb85f4332a4f609cab4ac40709470da05643a082ec1eb88e6d9b97d7"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "sqrt", shell_output("#{bin}/howdoi square root ruby")

    assert_match "# put current date as yyyy-mm-dd in $date",
      shell_output("#{bin}/howdoi format date bash 2>&1")
  end
end
