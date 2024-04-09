#!/usr/bin/env bash
source ../../lib.sh

bot "Setting Up Visual Studio Code..."

code -v > /dev/null
if [[ $? -eq 0 ]];then
    read -r -p "Do you want to install VSC extensions? [y|N] " configresponse
    if [[ $configresponse =~ ^(y|yes|Y) ]];then
        ok "Installing extensions please wait..."
        read -r -p "Do you want to install a slim variant? [y|N]" slimresponse
        if [[ $slimresponse =~ ^(y|yes|Y)]]; then
            ok "Installing slim extension pack..."
            code --install-extension robertohuertasm.vscode-icons
            code --install-extension GitHub.vscode-github-actions
            code --install-extension eamodio.gitlens
            code --install-extension esbenp.prettier-vscode
        else
            ok "Installing full extension pack..."
            code --install-extension robertohuertasm.vscode-icons
            code --install-extension DavidAnson.vscode-markdownlint
            code --install-extension GitHub.vscode-github-actions
            code --install-extension eamodio.gitlens
            code --install-extension esbenp.prettier-vscode
            code --install-extension bierner.github-markdown-preview
            code --install-extension htmlhint.vscode-htmlhint
            code --install-extension marp-team.marp-vscode
        fi
    else
        ok "Skipping extension install.";
    fi
    
    ok "Installation Complete."
fi