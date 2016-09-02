Code.require_file("rel/sample_app_plugin.ex")
Code.require_file("rel/release_plugin.ex")

use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"^PoW@${;Ny~KcOdkRGf$6:kka8K88{c>roBcBZmSlc-+&?(nk=7~PJT|:=5%KumV"
end

environment :prod do
  set dev_mode: false
  set strip_debug_info: false
  set include_erts: true
  set include_src: false
  set cookie: :"^PoW@${;Ny~KcOdkRGf$6:kka8K88{c>roBcBZmSlc-+&?(nk=7~PJT|:=5%KumV"
  plugin SampleApp.ProdPlugin
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :standard_app do
  set version: "0.0.1"
  plugin SampleApp.ReleasePlugin
end

