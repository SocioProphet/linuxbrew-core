class Pulumi < Formula
  desc "Cloud native development platform"
  homepage "https://pulumi.io/"
  url "https://github.com/pulumi/pulumi.git",
      tag:      "v2.8.0",
      revision: "14bc0c9c152b962c12c9adc8ff3d366fd4072f1d"
  license "Apache-2.0"
  head "https://github.com/pulumi/pulumi.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "240f19ee692e4eed9cf760d74f4c8a5de74ce67d24f2daa442901ed62e88ab12" => :catalina
    sha256 "65f7fde44202cb5025ec706ca82b0a89079852ec4e93e8c35567b52de8e05abe" => :mojave
    sha256 "3bb23387892a1b549520ed513582f67a461a8c7bec2b9756c87d1c3f4daf7ffa" => :high_sierra
    sha256 "f8c7c6a5ef42f060b2dbae2344d604a34215018802c8f2ade5746a1892cc5cf8" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"

    dir = buildpath/"src/github.com/pulumi/pulumi"
    dir.install buildpath.children

    cd dir do
      cd "./sdk" do
        system "go", "mod", "download"
      end
      cd "./pkg" do
        system "go", "mod", "download"
      end
      system "make", "brew"
      bin.install Dir["#{buildpath}/bin/*"]
      prefix.install_metafiles

      # Install shell completions
      (bash_completion/"pulumi.bash").write `#{bin}/pulumi gen-completion bash`
      (zsh_completion/"_pulumi").write `#{bin}/pulumi gen-completion zsh`
      (fish_completion/"pulumi.fish").write `#{bin}/pulumi gen-completion fish`
    end
  end

  test do
    ENV["PULUMI_ACCESS_TOKEN"] = "local://"
    ENV["PULUMI_TEMPLATE_PATH"] = testpath/"templates"
    system "#{bin}/pulumi", "new", "aws-typescript", "--generate-only",
                                                     "--force", "-y"
    assert_predicate testpath/"Pulumi.yaml", :exist?, "Project was not created"
  end
end
