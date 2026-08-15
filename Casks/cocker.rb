# Modèle du cask Homebrew.
#
# Le workflow de release y injecte la version et l'empreinte du dmg, puis
# pousse le résultat dans Bardyl/homebrew-tap. Ce fichier est la source ; le
# cask publié en est une copie générée, qu'on ne modifie jamais à la main.
cask "cocker" do
  version "0.4.0"
  sha256 "a63cc82ba3e00911ff862eaaffedcddf37da11f7761513e02aa6bb99596a51a2"

  url "https://github.com/Bardyl/Cocker/releases/download/v#{version}/Cocker-#{version}.dmg"
  name "Cocker"
  desc "Menu bar Docker environment for macOS, without Docker Desktop"
  homepage "https://github.com/Bardyl/Cocker"

  depends_on macos: ">= :sonoma"

  app "Cocker.app"

  # Volontairement limité aux réglages de Cocker : ~/.colima porte les
  # conteneurs et les images de l'utilisateur, que désinstaller l'interface
  # n'a aucune raison de détruire.
  zap trash: [
    "~/Library/Preferences/pro.menut.cocker.plist",
    "~/Library/Saved Application State/pro.menut.cocker.savedState",
  ]
end
